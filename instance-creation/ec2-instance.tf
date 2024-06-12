module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-master"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [ "sg-0b4982a41aa37eaa1" ]
  subnet_id = "subnet-0cbada78ee50d83ab"
  ami = data.aws_ami.ami-info.id
  user_data = file("jenkins-install.sh")

  tags = {
    Name = "jenkins-master"
  }
}

module "jenkins-agent" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-agent"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [ "sg-0b4982a41aa37eaa1" ]
  subnet_id = "subnet-0cbada78ee50d83ab"
  ami = data.aws_ami.ami-info.id
  user_data = file("jenkins-agent.sh")

  tags = {
    Name = "jenkins-agent"
  }
}

# resource "aws_key_pair" "tools" {
#   key_name = "tools"
#   public_key = file("~/.ssh/tools.pub")
# }

# module "nexus" {
#   source  = "terraform-aws-modules/ec2-instance/aws"

#   name = "nexus"

#   instance_type          = "t3.medium"
#   vpc_security_group_ids = [ "sg-0b4982a41aa37eaa1" ]
#   subnet_id = "subnet-0cbada78ee50d83ab"
#   ami = data.aws_ami.nexus-ami-info.id
#   key_name = aws_key_pair.tools.key_name
#   root_block_device = [ 
#     {
#       volume_type = "gp3"
#       volume_size = 30
#     } 
#   ] 

#   tags = {
#     Name = "nexus"
#   }
# }

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "jenkins"
      type    = "A"
      ttl     = 1
      records = [
        module.jenkins.public_ip
      ]
    },
    {
      name    = "jenkins-agent"
      type    = "A"
      ttl     = 1
      records = [
        module.jenkins-agent.private_ip
      ]
    }
    # {
    #   name    = "nexus"
    #   type    = "A"
    #   ttl     = 1
    #   allow_overwrite = true
    #   records = [
    #     module.nexus.private_ip
    #   ]
    # }
  ]
}