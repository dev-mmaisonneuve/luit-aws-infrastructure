# Configure the AWS Provider
terraform {
  backend "s3" {
    bucket = "ecommerce-appstack-bucket-mm"
    key    = "prod/appstack"
    region = "us-east-1"
  }
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}


/*
terraform {
  backend "s3" {
    bucket = "ecommerce-appstack-bucket-mm"
    key    = "prod/appstack"
    region = "us-east-1"
  }
}
*/


/*
terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-bucket"
    key            = "terraform/state"
    region         = "us-east-1" # Replace with your region

*/