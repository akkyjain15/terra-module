resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = var.subnet_id_public[count.index]
  route_table_id = var.public_routeTable_Id
}

resource "aws_route_table_association" "private_subnet_asso" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = var.subnet_id_private[count.index]
  route_table_id = var.private_routeTable_Id
}