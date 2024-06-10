module "jenkins-main" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-master"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [ "sg-0b4982a41aa37eaa1" ]
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
  ami = data.aws_ami.ami-info.id
  user_data = file("jenkins-agent.sh")

  tags = {
    Name = "jenkins-agent"
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "jenkins-main"
      type    = "A"
      ttl     = 1
      records = [
        module.jenkins-main.public_ip
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
  ]
}