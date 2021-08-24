output "public_ip_address" {
  description = "Public IP of instance"
  value       = aws_instance.jump_server.public_ip

}
output "image_id" {
  value = data.aws_ami.ubuntu.id
}
