module "vpc" {
  source             = "./modules/vpc/"
  vpc_cidr_block     = var.vpc_cidr_block
  Public_CIDR_BLOCK  = var.Public_CIDR_BLOCK
  Public2_CIDR_BLOCK = var.Public2_CIDR_BLOCK
  Private_CIDR_BLOCK = var.Private_CIDR_BLOCK
  Private2_CIDR_BLOCK = var.Private2_CIDR_BLOCK
  Public_Subnet_AZ   = var.Public_Subnet_AZ
  Public2_Subnet_AZ  = var.Public2_Subnet_AZ
  Private_Subnet_AZ  = var.Private_Subnet_AZ
  Private2_Subnet_AZ  = var.Private_Subnet_AZ
  public_bastion_key = var.public_bastion_key
  instance_type      = var.instance_type
  public_ec2_key     = var.public_ec2_key
  nacl_private_port  = var.nacl_private_port

}

module "ec2" {
  source              = "./modules/ec2/"
  vpc_id              = module.vpc.vpc_id
  public_subnet_id    = module.vpc.public_subnet_id
  public2_subnet_id   = module.vpc.public2_subnet_id
  private_subnet_id    = module.vpc.private_subnet_id
  private2_subnet_id   = module.vpc.private2_subnet_id
  public_bastion_key   = var.public_bastion_key
  public_ec2_key       = var.public_ec2_key
  private_ec2_key      = var.private_ec2_key
  private_bastion_key  = var.private_bastion_key
  instance_type        = var.instance_type
  startup_script       = var.startup_script
  portfolio            = var.portfolio
  pub_port             = var.pub_port
  lb-sg                = module.alb.lb-sg
}

module "alb" {
  source        = "./modules/alb"
  vpc_id        = module.vpc.vpc_id
  public_subnet = module.vpc.public_subnet_id
  public2_subnet = module.vpc.public2_subnet_id
  private_instance_id = module.ec2.private_instance_id
  private2_instance_id = module.ec2.private2_instance_id
}

