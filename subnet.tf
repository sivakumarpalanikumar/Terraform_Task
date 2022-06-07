resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "4.7.0.0/24"

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "4.7.1.0/24"

  tags = {
    Name = "private"
  }
}

