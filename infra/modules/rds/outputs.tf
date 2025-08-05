output "db_instance_endpoint" {
  description = "PostgreSQL instance endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_name" {
  value = aws_db_instance.main.db_name
}