output "bastionHost_sg_id" {
  value = aws_security_group.bastion_host_sg.id
  description = "Bastion Host security group id"
}

output "privateServers_sg_id" {
  value = aws_security_group.private_servers_sg.id
  description = "Private Servers security group id"
}