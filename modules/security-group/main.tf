data "http" "my_public_ip" {
  url = var.my_public_ip
}

resource "aws_security_group" "bastion_host_sg" {
  vpc_id = var.myvpc_id
  name        = var.bastionHost_Sg_Name
  description = var.bastion_Sg_description
  dynamic "ingress" {
    for_each = var.bastinHost_Sg_portRange
    content {
      description = ingress.key
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = var.protocol
      cidr_blocks = ["${data.http.my_public_ip.response_body}/32"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.outbound_sg_rule_cidr_block
  }
}

resource "aws_security_group" "private_servers_sg" {
  vpc_id = var.myvpc_id
  name        = var.private_Sg_Name
  description = var.private_Sg_description

  dynamic "ingress" {
    for_each = var.privateServer_Sg_portRange
    content {  
      description = ingress.key
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = var.protocol
      cidr_blocks = [var.public_subnet_cidr_value]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.outbound_sg_rule_cidr_block
  }
}