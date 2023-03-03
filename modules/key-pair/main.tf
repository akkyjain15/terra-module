resource "aws_key_pair" "TF_key" {
  key_name   = var.aws_key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}

resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.privateKey_fileName
}

