# Configure the AWS Provider
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Stealth_Mode"

    workspaces {
      name = "my-luit-infra"
    }
  }
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}


