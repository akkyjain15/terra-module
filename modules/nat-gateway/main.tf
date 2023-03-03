resource "aws_eip" "NatEip" {
  vpc = true
}


resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.NatEip.id
  subnet_id = var.pub_subnet_id

    tags = {
    Name = var.natGateway_name
  }
}