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

/*locals {
    private_subnets         = [
        "${lookup(var.cidr_ab, var.environment)}.1.0/24",
       
        
    ]

    

    public_subnets          = [
        "${lookup(var.cidr_ab, var.environment)}.0.0/24",
        
        
    ]
}*/