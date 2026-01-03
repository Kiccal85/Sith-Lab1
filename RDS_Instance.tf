
resource "aws_db_instance" "database_1" {
  identifier             = "database-1"
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  storage_type           = "gp2"
  allocated_storage      = 20
  backup_retention_period = 7
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  multi_az               = true
  delete_automated_backups = false

  # db_subnet_group_name   = "aws_db_subnet_group.chewbacca_rds_subnet_group01.name"
  # vpc_security_group_ids = [aws_security_group.chewbacca_rds_sg01.id]

  

  publicly_accessible    = false
  skip_final_snapshot    = true

  # TODO: student sets multi_az / backups / monitoring as stretch goals

  tags = {
    Name = "database"
  }
}
