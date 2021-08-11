output "public_ip_jenkins" {
  description = "Public IP of instance"
  value       = aws_instance.ubuntu-jenkins.public_ip
}