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
}
  