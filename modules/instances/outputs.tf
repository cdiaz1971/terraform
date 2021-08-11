output "public_ip_address" {
  description = "Public IP of instance"
  value       = aws_instance.ubuntu-web.public_ip
}