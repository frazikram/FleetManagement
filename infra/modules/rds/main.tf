resource "aws_db_subnet_group" "main" {
  name       = "fleet-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "fleet-db-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  identifier              = "fleet-db"
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = "db.t4g.micro"  # Free Tier eligible
  allocated_storage       = 20              # Minimum required
  storage_type            = "gp2"
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  skip_final_snapshot     = true
  deletion_protection     = false
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [var.db_security_group_id]

  tags = {
    Name = "fleet-db"
  }
}