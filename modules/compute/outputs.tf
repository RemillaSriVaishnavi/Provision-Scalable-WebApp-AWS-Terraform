######################################################
# Application Load Balancer Outputs
######################################################

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "DNS Name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "alb_hosted_zone_id" {
  description = "Hosted Zone ID of the Application Load Balancer"
  value       = aws_lb.alb.zone_id
}

######################################################
# Target Group Outputs
######################################################

output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.app_tg.arn
}

######################################################
# Launch Template Outputs
######################################################

output "launch_template_id" {
  description = "ID of the Launch Template"
  value       = aws_launch_template.launch_template.id
}

######################################################
# Auto Scaling Group Outputs
######################################################

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.asg.name
}