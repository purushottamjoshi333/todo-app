variable "aws_region" {
  default = "ap-south-1"
}

variable "app_name" {
  default = "todo-app"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT Secret"
  sensitive   = true
}