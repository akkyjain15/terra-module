resource "aws_internet_gateway" "gw" {
  vpc_id = var.myvpc_id

  tags = {
    Name = var.igw_name
  }
}
