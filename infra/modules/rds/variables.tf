variable "private_subnet_ids" {
  description = "Private subnet IDs for DB subnet group"
  type        = list(string)
}

variable "db_name" {
  description = "PostgreSQL DB name"
  type        = string
}

variable "db_user" {
  description = "Master username"
  type        = string
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "db_security_group_id" {
  description = "Security group ID to attach to RDS"
  type        = string
}
