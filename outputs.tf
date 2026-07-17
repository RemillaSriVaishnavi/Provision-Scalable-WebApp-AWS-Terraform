######################################################
# VPC Outputs
######################################################

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = module.vpc.private_subnet_ids
}

######################################################
# Security Outputs
######################################################

output "alb_security_group_id" {
  description = "Application Load Balancer Security Group ID"
  value       = module.security.alb_security_group_id
}

output "ec2_security_group_id" {
  description = "EC2 Security Group ID"
  value       = module.security.ec2_security_group_id
}

output "rds_security_group_id" {
  description = "RDS Security Group ID"
  value       = module.security.rds_security_group_id
}

######################################################
# Compute Outputs
######################################################

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = module.compute.alb_arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.compute.alb_dns_name
}

output "alb_hosted_zone_id" {
  description = "Application Load Balancer Hosted Zone ID"
  value       = module.compute.alb_hosted_zone_id
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = module.compute.target_group_arn
}

output "launch_template_id" {
  description = "Launch Template ID"
  value       = module.compute.launch_template_id
}

output "autoscaling_group_name" {
  description = "Auto Scaling Group Name"
  value       = module.compute.autoscaling_group_name
}

######################################################
# Database Outputs
######################################################

output "db_instance_arn" {
  description = "ARN of the RDS instance"
  value       = module.database.db_instance_arn
}

output "db_instance_identifier" {
  description = "Identifier of the RDS instance"
  value       = module.database.db_instance_identifier
}

output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.database.db_endpoint
}

output "db_port" {
  description = "Port of the RDS instance"
  value       = module.database.db_port
}

output "db_subnet_group_name" {
  description = "DB Subnet Group Name"
  value       = module.database.db_subnet_group_name
}