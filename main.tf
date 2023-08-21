#save the following script in main.tf file which have the all information of aws rds creation #

provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_vpc" "existing_vpc" {
  id = "vpc-07639b04723b3cae2"
}

resource "aws_db_subnet_group" "subnets" {
  name       = "subnets"
  subnet_ids = ["subnet-074b79862bb793109","subnet-0ffcc8e0b3e164dc1","subnet-07bd55d8010cbffad"]
}

resource "aws_db_instance" "myinstance" {
  engine              = "mysql"
  engine_version      = "8.0.33"
  allocated_storage   = var.allocated_storage
  storage_type        = "gp2"
  instance_class      = var.db_instance_class
  identifier          = var.db_instance_identifier
  username            = var.username
  password            = var.password
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = ["sg-0a754f37be5a64b87"]
  db_subnet_group_name   = aws_db_subnet_group.subnets.name
  skip_final_snapshot    = true
  publicly_accessible    = true
  backup_retention_period = var.backup_retention_period
}

output "rds_endpoint" {
  value = aws_db_instance.myinstance.endpoint
}
   
 ## the values defined in the variable.tf file are passed into the main.tf file  var.<> ##
