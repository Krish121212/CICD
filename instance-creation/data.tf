data "aws_ami" "ami-info" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "AMI name"
    values = ["RHEL-9-DevOps-*"]
  }

  filter {
    name   = "Root device type"
    values = ["ebs"]
  }
  filter {
    name   = "Owner account ID"
    values = ["973714476881"]
  }
  filter {
    name   = "Virtualization type"
    values = ["hvm"]
  }
}