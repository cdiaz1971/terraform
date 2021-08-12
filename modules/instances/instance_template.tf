resource "aws_instance" "instance_template" {
  ami                    = var.ubuntu-ami
  instance_type          = "t2.micro"
  iam_instance_profile   = var.EC2SSM
  subnet_id              = var.puplic-subnet-id
  key_name               = var.main-key
  vpc_security_group_ids = [var.web_security_group]
  tags = {
    Name = var.instance_name
  }
  root_block_device {
    delete_on_termination = true
    volume_size           = 30
    encrypted             = true
    tags = {
      Name = var.instance_name
    }

  }

  


}
/* output "public_ip_address" {
  description = "Public IP of instance"
  value       = aws_instance.instance.public_ip
}
 */