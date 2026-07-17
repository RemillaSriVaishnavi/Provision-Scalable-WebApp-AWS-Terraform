######################################################
# VPC Module
######################################################

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  aws_region            = var.aws_region
}

######################################################
# Security Module
######################################################

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}

######################################################
# Compute Module
######################################################

module "compute" {
  source = "./modules/compute"

  ####################################################
  # Networking
  ####################################################

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids

  ####################################################
  # Security Groups
  ####################################################

  alb_security_group_id = module.security.alb_security_group_id
  ec2_security_group_id = module.security.ec2_security_group_id

  ####################################################
  # EC2 Configuration
  ####################################################

  instance_type = var.instance_type
  key_name      = var.key_name

  ####################################################
  # Auto Scaling Configuration
  ####################################################

  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size

  ####################################################
  # Application Configuration
  ####################################################

  app_port = var.app_port

  ####################################################
  # Resource Naming
  ####################################################

  project_name = var.project_name
}

######################################################
# Database Module
######################################################

module "database" {
  source = "./modules/database"

  ####################################################
  # Networking
  ####################################################

  private_subnet_ids = module.vpc.private_subnet_ids

  ####################################################
  # Security
  ####################################################

  rds_security_group_id = module.security.rds_security_group_id

  ####################################################
  # Database Configuration
  ####################################################

  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version

  db_instance_class = var.db_instance_class

  allocated_storage = var.allocated_storage

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  ####################################################
  # Resource Naming
  ####################################################

  project_name = var.project_name
}