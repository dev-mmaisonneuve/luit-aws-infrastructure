# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Retrieve the default VPC ID
data "aws_vpc" "default" {
  default = true
}
# Retrieve the default Subnets in the VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Create Launch Template for the ASG
resource "aws_launch_template" "web_server" {
  name          = "web-server-template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  user_data = base64encode(file("apache_install_script.sh"))

  # Associate the Security with ASG Instances
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web_serve"
  }
}

# Create the Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  name = "web-server-asg"
  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }
  min_size            = 2
  max_size            = 5
  desired_capacity    = 2
  vpc_zone_identifier = data.aws_subnets.default.ids
}

# Security Group for the ASG
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "auto-scaling_sg "
  }
}

# Create the S3 bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
}
# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}



