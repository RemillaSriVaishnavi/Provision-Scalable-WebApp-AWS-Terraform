######################################################
# Networking Variables
######################################################

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the Application Load Balancer"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EC2 instances"
  type        = list(string)
}

######################################################
# Security Group Variables
######################################################

variable "alb_security_group_id" {
  description = "Security Group ID for the Application Load Balancer"
  type        = string
}

variable "ec2_security_group_id" {
  description = "Security Group ID for the EC2 instances"
  type        = string
}

######################################################
# EC2 Configuration
######################################################

variable "instance_type" {
  description = "EC2 instance type for the Launch Template"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Optional EC2 Key Pair name for SSH access"
  type        = string
  default     = null
}

######################################################
# Auto Scaling Configuration
######################################################

variable "desired_capacity" {
  description = "Desired number of EC2 instances"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of EC2 instances"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of EC2 instances"
  type        = number
  default     = 4
}

######################################################
# Application Configuration
######################################################

variable "app_port" {
  description = "Port on which the application listens"
  type        = number
  default     = 80
}

######################################################
# Resource Naming
######################################################

variable "project_name" {
  description = "Project name used for naming AWS resources"
  type        = string
  default     = "webapp"
}