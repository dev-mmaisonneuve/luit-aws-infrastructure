output "web_1_public_ip" {
  description = "Public IP of the first web server"
  value       = aws_instance.web_1.public_ip
}

output "web_2_public_ip" {
  description = "Public IP of the second web server"
  value       = aws_instance.web_2.public_ip
}
