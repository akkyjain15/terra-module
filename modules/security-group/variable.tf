variable "my_public_ip" {
  type = string
  default = "https://ifconfig.me/ip" 
}

variable "myvpc_id" {
  type = string
}

variable "bastionHost_Sg_Name" {
  type = string
  default = ""
  description = "Bastion Host Security Group Name"
}

variable "bastion_Sg_description" {
  type = string
  default = ""
  description = "Bastion host security group description"
}


variable "bastinHost_Sg_portRange" {
  type = map
  default = {

  }
  description = "Public servers port range to allow traffic from these ports"
}

variable "protocol" {
  type = string
  default = ""
  description = "Value of the protocol used for inbound rule of security group"
}

variable "outbound_sg_rule_cidr_block" {
  type = list(string)
  default = []
  description = "Outbound Security group cidr block"
}

variable "privateServer_Sg_portRange" {
  type = map
  default = {

  }
  description = "Private servers port range to allow traffic from these ports"
}

variable "private_Sg_Name" {
  type = string
  default = ""
  description = "Private Server Security Group Name"
}

variable "private_Sg_description" {
  type = string
  default = ""
  description = "Private Server description"
}

variable "public_subnet_cidr_value" {
  type = string
}
