variable "subnet_id_public" {
    type = list(string)
}

variable "subnet_id_private" {
    type = list(string)
}


variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}


variable "public_routeTable_Id" {
  type = string
}

variable "private_routeTable_Id" {
  type = string
}