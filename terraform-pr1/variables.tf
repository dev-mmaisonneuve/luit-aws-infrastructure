variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ami" {
  type    = string
  default = "ami-0ca9fb66e076a6e32"
}

variable "key_name" {
  type    = string
  default = "MyJenkinsKey"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0952f4370e8f40f52"
}


variable "bucket_name" {
  type    = string
  default = "jenkins-artifacts-bucket-maicomm"
}