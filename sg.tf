#Group for the Bastion Host aka Jump Box
# terraform aws create security group
resource "aws_security_group" "privatesubnetec2securitygroup" {

  name        = "privatesubnetec2securitygroup"
  description = "Enable SSH access on Port 22"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ssh-location}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
  Name = "priec2secgroup" }
}
# Create Security Group for the Web Server# terraform aws create security group
resource "aws_security_group" "publicsubnetec2securitygroup" {
  name        = "publicsubnetec2securitygroup"
  description = "Enable HTTP/HTTPS access on Port 80/443 via ALB and SSH access on Port 22 via SSH SG"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description     = "SSH Access"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "pubec2secgroup"
  }
}