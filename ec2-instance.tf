module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-master"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow-ssh.id ]
  ami = "ami-031d574cddc5bb371"
  user_data = file("jenkins-install.sh")
}

  resource "aws_security_group" "allow-ssh" {
    name = "allow-ssh"
    description = "Allow ssh inbound traffic and all outbound traffic"

#below is terraform block as there is no equalto 
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0  ## 0 to 0 opening all protocals
    to_port          = 0
    protocol         = "-1" #-1 all protocals
    cidr_blocks      = ["0.0.0.0/0"]
  }

#below is terraform map as there is equalto,also list means [1, 2, 3, 4]
    tags = { 
        Name = "allow-ssh"
        createdby = "Krishna"
    }
}