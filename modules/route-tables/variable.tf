variable "public_route_cidr_block" {
  type        = string
  default     = ""
  description = "Cidr block for adding igw in public route table"
}

variable "private_route_cidr_block" {
  type        = string
  default     = ""
  description = "Cidr block for adding igw in private route table"
}


variable "internet_gateway_id" {
  type = string
}

variable "nat_gateway_id" {
  type = string
}

variable "myvpc_id" {
  type = string
}

variable "public_route_name" {
  type        = string
  default     = ""
  description = "Name of public route table"
}

variable "private_route_name" {
  type        = string
  default     = ""
  description = "Name of private route table"
}
