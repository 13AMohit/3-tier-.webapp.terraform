resource "aws_db_subnet_group" "beztlab-subnet_group" {
  name       = "beztlab-db-subnet-groups"
  subnet_ids = var.rds_subnet_id
}

resource "aws_db_instance" "rds_instance" {
  identifier             = var.rds_name
  instance_class         = var.instance_class
  allocated_storage      = var.rds_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  port                   = var.rds_port
  multi_az               = false
  storage_type           = "gp2"
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [var.rds_vpc]
  username               = var.master_username
  password               = var.master_password
  db_subnet_group_name   = aws_db_subnet_group.beztlab-subnet_group.id
}