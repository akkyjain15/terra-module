variable "region" {

  type    = string
  default = "us-east-1"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type = string
  default = "default"
}

variable "vpc_name" {
  type = string
  default = "ninja-vpc-01"
}

variable "availability_zone" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["a", "b"]
}

variable "public_subnet_name" {
  type    = string
  default = "PublicSubnet"
  description = "Public Subnet Name"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnet_name" {
  type    = string
  default = "PrivateSubnet"
  description = "Private Subnet Name"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "igw_name" {
  type        = string
  default     = "myigw"
  description = "Name of internet gateway"
}

variable "natGateway_name" {
  type = string
  default = "mynatGateway"
  description = "Name of Nat Gateway"
}

variable "public_route_cidr_block" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Cidr block for adding igw in public route table"
}

variable "private_route_cidr_block" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Cidr block for adding igw in private route table"
}


variable "public_route_name" {
  type        = string
  default     = "ninja_route_public"
  description = "Name of public route table"
}

variable "private_route_name" {
  type        = string
  default     = "ninja_route_private"
  description = "Name of private route table"
}

variable "bastionHost_Sg_Name" {
  type = string
  default = "bastion_Sg"
  description = "Bastion Host Security Group Name"
}

variable "bastion_Sg_description" {
  type = string
  default = "Bastion Host Security Group"
  description = "Bastion host security group description"
}

variable "private_Sg_Name" {
  type = string
  default = "private_Sg"
  description = "Private Server Security Group Name"
}

variable "private_Sg_description" {
  type = string
  default = "Private Servers Security Group"
  description = "Private Server description"
}

variable "outbound_sg_rule_cidr_block" {
  type = list(string)
  default = ["0.0.0.0/0"]
  description = "Outbound Security group cidr block"
}

variable "bastinHost_Sg_portRange" {
  type = map
  default = {
    "http rule" = {
      port = 80
    },
    "ssh rule" = {
      port = 22
    }
  }
  description = "Public servers port range to allow traffic from these ports"
}

variable "privateServer_Sg_portRange" {
  type = map
  default = {
    "ssh rule" = {
      port = 22
    }
  }
  description = "Private servers port range to allow traffic from these ports"
}

variable "protocol" {
  type = string
  default = "tcp"
  description = "Value of the protocol used for inbound rule of security group"
}

variable "aws_key_name" {
  type = string
  default = "TF_key"
  description = "Aws private key name"
}

variable "private_key_algorithm" {
  type = string
  default = "RSA"
  description = "Private key algorithm name"
}

variable "private_key_rsa_bits" {
  type = number
  default = 4096
  description = "Private key rsa bits"
}

variable "privateKey_fileName" {
  type = string
  default = "tfkey.pem"
  description = "private key local filename"
}

variable "bastionHost_instanceType"{
  type = string
  default = "t2.micro"
  description = "Bastion host instance type"
}

variable "tags" {
  type = map(string)
  default = {
    "Name" = "Akshay"
    "Company" = "Opstree"
  }
}

variable "private_servers_instanceType"{
  type = string
  default = "t2.micro"
  description = "Private Servers instance type"
}

variable "private_server_name" {
  type = string
  default = "privateServer"
  description = "Value of private server name"
}