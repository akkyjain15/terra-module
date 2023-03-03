module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  vpc_name = var.vpc_name 
}

 module "subnet" {
   source = "./modules/subnet"
   public_subnet_cidrs = var.public_subnet_cidrs
   public_subnet_name = var.public_subnet_name
   private_subnet_cidrs = var.private_subnet_cidrs
   private_subnet_name = var.private_subnet_name
   availability_zone = var.availability_zone
   myvpc_id = module.vpc.vpc_id
 }

 module "internet-gateway" {
   source = "./modules/internet-gateway"
   igw_name = var.igw_name
   myvpc_id = module.vpc.vpc_id 
 }

 module "nat-gateway" {
  source = "./modules/nat-gateway"
  natGateway_name = var.natGateway_name
  pub_subnet_id = module.subnet.public_subnets_id[0]
 }

 module "route-tables" {
  source = "./modules/route-tables"
  public_route_cidr_block = var.public_route_cidr_block
  private_route_cidr_block = var.private_route_cidr_block
  internet_gateway_id = module.internet-gateway.internet_gateway_id
  nat_gateway_id = module.nat-gateway.NatGateway_Id
  myvpc_id = module.vpc.vpc_id
  public_route_name = var.public_route_name
  private_route_name = var.private_route_name
 }

 module "route-table-association" {
 source = "./modules/route-table-association"
 public_routeTable_Id = module.route-tables.public_routetable_Id
 subnet_id_public = module.subnet.public_subnets_id
 private_routeTable_Id = module.route-tables.private_routetable_Id
 subnet_id_private = module.subnet.private_subnets_id
 }

 module "security-group" {
 source = "./modules/security-group"
 myvpc_id = module.vpc.vpc_id
 bastionHost_Sg_Name = var.bastionHost_Sg_Name
 bastion_Sg_description = var.bastion_Sg_description
 bastinHost_Sg_portRange = var.bastinHost_Sg_portRange
 protocol = var.protocol
 private_Sg_Name = var.private_Sg_Name
 private_Sg_description = var.private_Sg_description
 privateServer_Sg_portRange = var.privateServer_Sg_portRange
 public_subnet_cidr_value = var.public_subnet_cidrs[0]
 outbound_sg_rule_cidr_block = var.outbound_sg_rule_cidr_block
 }

 module "key-pair" {
 source = "./modules/key-pair"
 aws_key_name = var.aws_key_name
 private_key_algorithm = var.private_key_algorithm
 private_key_rsa_bits = var.private_key_rsa_bits
 privateKey_fileName = var.privateKey_fileName
 }

 module "instances" {
 source = "./modules/instances"
 bastionHost_instanceType = var.bastionHost_instanceType
 aws_key_name = var.aws_key_name
 subnet_id_bastionHost = module.subnet.public_subnets_id[0]
 security_group_id_bastionHost = module.security-group.bastionHost_sg_id
 subnet_id_private = module.subnet.private_subnets_id
 security_group_id_privateServers = module.security-group.privateServers_sg_id
 tags = var.tags
 private_server_name = var.private_server_name
 private_subnet_cidrs = var.private_subnet_cidrs
 }