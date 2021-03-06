#This is to create 2 route tables thats connects with internet gateway

resource "aws_route_table" "publicroutetable" {#I should name both my public and route table
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "terraform"
    env="prod"
  }
}
resource "aws_route_table" "privateroutetable" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name = "terraform"
    environment="prod"
  }
}

resource "aws_route_table_association" "publicroutetableassosiation" {
  
  gateway_id     = aws_internet_gateway.internet-gateway.id
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicroutetable.id
}

resource "aws_route_table_association" "privateroutetableassosiation" {
  
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.privateroutetable.id
}
