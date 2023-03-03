output "ElasticIp_Id" {
  value = aws_eip.NatEip.id
  description = "Value Of Elastic Ip Id"
}

output "NatGateway_Id" {
  value = aws_nat_gateway.NATgw.id
  description = "Value of Nat Gateway Id"
}