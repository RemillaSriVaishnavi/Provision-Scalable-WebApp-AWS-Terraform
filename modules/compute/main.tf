######################################################
# Latest Amazon Linux 2023 AMI
######################################################

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

######################################################
# Application Load Balancer
######################################################

resource "aws_lb" "alb" {

  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-alb"
  }
}

######################################################
# Target Group
######################################################

resource "aws_lb_target_group" "app_tg" {

  name        = "${var.project_name}-tg"
  port        = var.app_port
  protocol    = "HTTP"
  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

######################################################
# HTTP Listener
######################################################

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.alb.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.app_tg.arn

  }

}

######################################################
# User Data
######################################################

locals {

  user_data = <<-EOF
#!/bin/bash
yum update -y

dnf install -y httpd

systemctl enable httpd

systemctl start httpd

echo "<h1>Terraform Auto Scaling Web Server</h1>" > /var/www/html/index.html

echo "<p>Hostname: $(hostname)</p>" >> /var/www/html/index.html
EOF

}

######################################################
# Launch Template
######################################################

resource "aws_launch_template" "launch_template" {

  name_prefix = "${var.project_name}-lt-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  user_data = base64encode(local.user_data)

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-instance"
    }

  }

}

######################################################
# Auto Scaling Group
######################################################

resource "aws_autoscaling_group" "asg" {

  name = "${var.project_name}-asg"

  desired_capacity = var.desired_capacity

  min_size = var.min_size

  max_size = var.max_size

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [
    aws_lb_target_group.app_tg.arn
  ]

  launch_template {

    id = aws_launch_template.launch_template.id

    version = "$Latest"

  }

  health_check_type = "ELB"

  health_check_grace_period = 300

  force_delete = true

  tag {

    key = "Name"

    value = "${var.project_name}-instance"

    propagate_at_launch = true

  }

}