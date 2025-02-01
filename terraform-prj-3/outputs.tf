# Public IP of the 1st web server
output "web_1_public_ip" {
  description = "Public IP of the first web server"
  value       = aws_instance.web_1.public_ip
}
# Public IP of the 2nd web server
output "web_2_public_ip" {
  description = "Public IP of the second web server"
  value       = aws_instance.web_2.public_ip
}
# Endpoint of the RDS MySQL instance
output "rds_endpoint" {
  description = "Endpoint of the RDS MySQL instance"
  value       = aws_db_instance.rds_mysql.endpoint
}