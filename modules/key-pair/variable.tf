variable "aws_key_name" {
  type = string
  default = ""
  description = "Aws private key name"
}

variable "private_key_algorithm" {
  type = string
  default = ""
  description = "Private key algorithm name"
}

variable "private_key_rsa_bits" {
  type = number
  default = 4096
  description = "Private key rsa bits"
}

variable "privateKey_fileName" {
  type = string
  default = ""
  description = "private key local filename"
}