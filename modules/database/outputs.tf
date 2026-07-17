######################################################
# Database Outputs
######################################################

output "db_instance_arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.database.arn
}

output "db_instance_identifier" {
  description = "Identifier of the RDS instance"
  value       = aws_db_instance.database.identifier
}

output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.database.address
}

output "db_port" {
  description = "Port used by the RDS instance"
  value       = aws_db_instance.database.port
}

output "db_subnet_group_name" {
  description = "DB Subnet Group Name"
  value       = aws_db_subnet_group.db_subnet_group.name
}