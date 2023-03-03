resource "aws_route_table" "public_route" {
  vpc_id = var.myvpc_id

  route {
    cidr_block = var.public_route_cidr_block
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.public_route_name
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = var.myvpc_id

  route {
    cidr_block = var.private_route_cidr_block
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = var.private_route_name
  }
}

# resource "aws_route_table_association" "public_subnet_asso" {
#   count          = length(var.public_subnet_cidrs)
#   subnet_id      = var.subnet_id[count.index]
#   route_table_id = aws_route_table.public_route.id
# }

# resource "aws_route_table_association" "private_subnet_asso" {
#   count          = length(var.private_subnet_cidrs)
#   subnet_id      = aws_subnet.private_subnets[count.index].id
#   route_table_id = aws_route_table.private_route.id
# }
