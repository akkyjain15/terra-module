resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  cidr_block        = var.public_subnet_cidrs[count.index]
  vpc_id            = var.myvpc_id
  availability_zone = join("",[var.region, var.availability_zone[count.index]])

  tags = {
    Name = join("-",[var.public_subnet_name, "${count.index + 1}"])
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = var.myvpc_id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = join("",[var.region, var.availability_zone[count.index]])

  tags = {
   Name = join("-",[var.private_subnet_name, "${count.index + 1}"])
  }
}
