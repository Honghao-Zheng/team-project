resource "aws_db_instance" "rds-database" {
  allocated_storage     = 10
  max_allocated_storage = 50
  db_name               = "mydb"
  identifier            = "backend-database"
  engine                = "postgres"
  engine_version        = "15.5"
  instance_class        = "db.t3.micro"
  username              = "test"
  password              = "password"
  skip_final_snapshot   = true
  publicly_accessible   = true
}