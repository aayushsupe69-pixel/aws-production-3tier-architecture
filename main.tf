module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

module "security_groups" {
  source       = "./modules/security-groups"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "alb" {
  source         = "./modules/alb"
  project_name   = var.project_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg_id      = module.security_groups.alb_sg_id
}

module "ec2" {
  source               = "./modules/ec2"
  project_name         = var.project_name
  ec2_sg_id            = module.security_groups.ec2_sg_id
  private_app_subnets  = module.vpc.private_app_subnets
}

module "autoscaling" {
  source               = "./modules/autoscaling"
  project_name         = var.project_name
  launch_template_id   = module.ec2.launch_template_id
  private_app_subnets  = module.vpc.private_app_subnets
  target_group_arn     = module.alb.target_group_arn
}

module "rds" {
  source              = "./modules/rds"
  project_name        = var.project_name
  private_db_subnets  = module.vpc.private_db_subnets
  rds_sg_id           = module.security_groups.rds_sg_id
}