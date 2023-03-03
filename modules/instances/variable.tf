variable "bastionHost_instanceType"{
  type = string
  default = ""
  description = "Bastion host instance type"
}

variable "tags" {
  type = map(string)
  default = {

  }
}

variable "aws_key_name" {
  type = string
  default = ""
  description = "Aws private key name"
}

variable "subnet_id_bastionHost" {
  type = string
}

variable "subnet_id_private" {
  type = list(string)
}

variable "security_group_id_bastionHost" {
  type = string
}

variable "security_group_id_privateServers" {
  type = string
}

variable "private_servers_instanceType"{
  type = string
  default = ""
  description = "Private Servers instance type"
}


variable "private_server_name" {
  type = string
  default = ""
  description = "Value of private server name"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}