# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}


# Create Security Group - SSH and Web Traffic
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  vpc_id      = var.vpc_id
  description = "Allows SSH and HTTP traffic"
  ingress {
    description = "Allow Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["73.159.0.63/32"]
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create the Jenkins Server
resource "aws_instance" "jenkins_server" {
  ami           = var.ami # Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = "MyJenkinsKey" # key pair name

  security_groups = [aws_security_group.jenkins_sg.name]

  user_data = file("jenkins_install_script.sh")

  tags = {
    Name = "jenkins-server" # Tag in AWS
  }
}

# Create the S3 Bucket
resource "aws_s3_bucket" "jenkins_artifacts" {
  bucket        = var.bucket_name
  force_destroy = true # To allow Bucket Deletion
}






/*
output "instance_id" {
  value = aws_instance.jenkins_server.id
}

output "instance_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
*/