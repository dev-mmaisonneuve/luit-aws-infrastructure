
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

/* variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
} */


variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
#
variable "sub_cidr_1" {
  type    = string
  default = "10.0.1.0/24"
}

variable "sub_cidr_2" {
  type    = string
  default = "10.0.2.0/24"
}

variable "sub_cidr_3" {
  type    = string
  default = "10.0.3.0/24"
}

variable "sub_cidr_4" {
  type    = string
  default = "10.0.4.0/24"
}
#
variable "az_1" {
  type    = string
  default = "us-east-1a"
}

variable "az_2" {
  type    = string
  default = "us-east-1b"
}
# 
variable "my_ip" {
  type    = string
  default = "73.159.0.63/32"
}
# 
variable "ami_id" {
  type    = string
  default = "ami-043a5a82b6cf98947"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#
variable "db_username" {
  type    = string
  default = "admin1"
}

variable "db_password" {
  type    = string
  default = "pass15Word$"
}

variable "db_identifier" {
  type    = string
  default = "rds-mysql-instance"
}