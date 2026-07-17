######################################################
# ALB Security Group Output
######################################################

output "alb_security_group_id" {
  description = "ID of the Application Load Balancer Security Group"
  value       = aws_security_group.alb_sg.id
}

######################################################
# EC2 Security Group Output
######################################################

output "ec2_security_group_id" {
  description = "ID of the EC2 Application Security Group"
  value       = aws_security_group.ec2_sg.id
}

######################################################
# RDS Security Group Output
######################################################

output "rds_security_group_id" {
  description = "ID of the RDS Database Security Group"
  value       = aws_security_group.rds_sg.id
}