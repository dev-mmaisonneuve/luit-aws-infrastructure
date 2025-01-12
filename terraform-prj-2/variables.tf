variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ami_id" {
  type    = string
  default = "ami-0e2c8caa4b6378d8c"
}

variable "bucket_name" {
  type    = string
  default = "ecommerce-appstack-bucket-mm"
}