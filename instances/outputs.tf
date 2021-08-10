output "public_ip" {
  description = "Public IP of instance"
  value       = aws_instance.ubuntu-web.public_ip
}