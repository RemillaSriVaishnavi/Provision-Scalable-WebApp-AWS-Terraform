######################################################
# Networking Variables
######################################################

variable "private_subnet_ids" {
  description = "Private subnet IDs for the RDS DB Subnet Group"
  type        = list(string)
}

######################################################
# Security Variables
######################################################

variable "rds_security_group_id" {
  description = "Security Group ID for the RDS instance"
  type        = string
}

######################################################
# Database Configuration
######################################################

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "16.3"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage (GB)"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "webappdb"
}

variable "db_username" {
  description = "Master database username"
  type        = string
}

variable "db_password" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

######################################################
# Resource Naming
######################################################

variable "project_name" {
  description = "Project name used for naming AWS resources"
  type        = string
}