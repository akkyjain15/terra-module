output "public_subnets_id" {
  value = aws_subnet.public_subnets[*].id
  description = "Values of public subnet ids"
}

output "private_subnets_id" {
  value = aws_subnet.private_subnets[*].id
  description = "Values of public subnet ids"
}
