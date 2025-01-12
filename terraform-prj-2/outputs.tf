# Fetch Instances in the Auto Scaling Group
data "aws_instances" "asg_instances" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.web_asg.name]
  }
}

# Outputs to Retrieve Public IPs of Running Instances
output "asg_instance_public_ips" {
  value       = data.aws_instances.asg_instances.public_ips
  description = "Public IPs of instances in the ASG"
}

/*
output "asg_instance_ids" {
  value       = data.aws_instances.asg_instances.ids
  description = "Instance IDs of instances in the Auto Scaling Group"
}
*/