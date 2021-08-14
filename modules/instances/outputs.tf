output "public_ip_address" {
  description = "Public IP of instance"
  value       = aws_instance.instance_template.public_ip
}