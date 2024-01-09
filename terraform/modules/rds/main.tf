resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnet_group"
  subnet_ids = var.public_subnets

  tags = {
    Name = "subnet_group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage     = 10
  max_allocated_storage = 50
  db_name               = var.db_name
  identifier            = var.identifier
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  username              = var.username
  password              = var.password
  skip_final_snapshot   = true
  publicly_accessible   = true
  multi_az              = false
  availability_zone     = var.availability_zone
  db_subnet_group_name  = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = var.rds_security_group
}
  