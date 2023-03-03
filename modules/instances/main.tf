data "aws_ami" "ubuntu" {
  most_recent = true


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # focal
}


resource "aws_instance" "bastion_host_instance" {
 ami                         = data.aws_ami.ubuntu.id
 instance_type               = var.bastionHost_instanceType
 key_name                    = var.aws_key_name
 subnet_id                   = var.subnet_id_bastionHost
 vpc_security_group_ids      = [var.security_group_id_bastionHost]
 associate_public_ip_address = true
 tags                        = var.tags
}

resource "aws_instance" "private_server_instance" {
 count             = length(var.private_subnet_cidrs)
 ami                         = data.aws_ami.ubuntu.id
 instance_type               = var.private_servers_instanceType
 key_name                    = var.aws_key_name
 subnet_id = var.subnet_id_private[count.index]
 vpc_security_group_ids      = [var.security_group_id_privateServers]

 tags = {
    Name = join("-",[var.private_server_name, "${count.index + 1}"])
  } 
}