variable "availability_zone" {
  type        = list(string)
  description = "Availability Zones"
  default     = []
}

variable "region" {

  type    = string
  default = "us-east-1"
}

variable "public_subnet_name" {
  type    = string
  default = ""
  description = "Public Subnet Name"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = []
}

variable "private_subnet_name" {
  type    = string
  default = ""
  description = "Private Subnet Name"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = []
}

variable "myvpc_id" {
  type = string
}
