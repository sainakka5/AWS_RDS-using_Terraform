#create a file variable.tf and save the following script in the file #

variable "access_key" {
  description = "AWS access key"
  type        = string
  default     = "AKIATX6ULZXLPSOT7VHR"
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  default     = "jTUZkhmCSvqm1BVpducyRQPZOBq75xHPEHnBOSQe"
}
variable "db_engine" {
  description = "Database engine type"
  type        = string
  default     = "mysql"
}

variable "db_instance_class" {
  description = "Database instance class"
  type        = string
  default     = "db.t2.micro"
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Password for the RDS instance"
  type        = string
  default     = "admin123"
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}
