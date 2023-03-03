output "public_routetable_Id"{
  value = aws_route_table.public_route.id
  description = "Value of Public Route Table Id"
}

output "private_routetable_Id"{
  value = aws_route_table.private_route.id
  description = "Value of Private Route Table Id"
}