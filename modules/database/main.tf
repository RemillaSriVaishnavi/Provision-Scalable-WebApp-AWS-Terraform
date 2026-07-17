######################################################
# DB Subnet Group
######################################################

resource "aws_db_subnet_group" "db_subnet_group" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

######################################################
# Amazon RDS PostgreSQL Instance
######################################################

resource "aws_db_instance" "database" {

  identifier = "${var.project_name}-postgres"

  engine         = var.db_engine
  engine_version = var.db_engine_version

  instance_class = var.db_instance_class

  allocated_storage = var.allocated_storage
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  publicly_accessible = false

  multi_az = false

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  backup_retention_period = 0

  skip_final_snapshot = true

  deletion_protection = false

  apply_immediately = true

  tags = {
    Name = "${var.project_name}-postgres"
  }

}