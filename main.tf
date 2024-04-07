module "vpc" {
  source           = "./vpc"
  vpc_cidr         = var.vpc_cidr
  public_cidr      = var.public_cidr
  vpc_az           = var.vpc_az
  private_app_cidr = var.private_app_cidr
  private_db_cidr  = var.private_db_cidr
  private_db2_cidr = var.private_db2_cidr
  public2_cidr     = var.public2_cidr
}

module "networking" {
  source         = "./networking"
  ec2_sg_name    = var.ec2_sg_name
  ec2_sg_desc    = var.ec2_sg_desc
  rds_sg_name    = var.rds_name
  rds_sg_desc    = var.rds_sg_desc
  vpc_id         = module.vpc.vpc_id
  tg_name        = var.tg_name
  lb_name        = var.lb_name
  lb_subnet1     = module.vpc.public_subnet_id
  lb_subnet2     = module.vpc.public_subnet2_id
  tg-instance_id = module.ec2_instance.ec2_instance_id

}

module "ec2_instance" {
  source                = "./ec2/"
  ami_id                = var.ec2_ami_id
  instance_type         = var.ec2_instance_type
  ec2_sg_id             = module.networking.ec2_sg_id
  script                = var.script
  ec2_name              = var.ec2_name
  jump_server_name      = var.jump_server_name
  jump_server_sg_id     = module.networking.jump_server_sg_id
  app_server_subnet_id  = module.vpc.private_app_subnet_id
  jump_server_subnet_id = module.vpc.public_subnet_id
}

module "rds_instance" {
  source               = "./rds/"
  instance_class       = var.instance_class
  rds_name             = var.rds_name
  engine               = var.engine
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  ec2_sg               = module.networking.ec2_sg_id
  master_username      = var.master_username
  master_password      = var.master_password
  rds_port             = var.rds_port
  rds_storage          = var.rds_storage
  rds_subnet_id        = [module.vpc.private_db_subnet_id, module.vpc.private_db_subnet2_id]
  rds_vpc              = module.networking.rds_sg_id
}