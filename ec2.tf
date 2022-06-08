module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["public", "private"])

  name = "instance-${each.key}"

  ami                    = ""
  instance_type          = ""
  /*user_data =           << EOF
		#! /bin/bash
        sudo su
        yum install update
		yum install httpd
	EOF*/
  monitoring             = true
  vpc_security_group_ids = [""]
  subnet_id              = aws_subnet.publicsubnet.id
  associate_public_ip_address = "true"

  tags = {
    name   = "terraform"
    env = "prod"
  }
}
