output "public_ip_address" {
  description = "Public IP of instance"
  value       = aws_instance.instance_template.public_ip
}
output "instance_id" {
  description = "instance ID"
  value       = aws_instance.instance_template.id
}