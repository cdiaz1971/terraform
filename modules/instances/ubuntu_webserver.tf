locals {
  ssh_user = "ubuntu"
  key_name = "DIAZ-AWS"
  private_key_path = "~/DIAZ-AWS.pem"
}

resource "aws_instance" "ubuntu-web" {
  ami                    = var.ubuntu-ami
  instance_type          = "t2.micro"
  iam_instance_profile   = var.EC2SSM
  subnet_id              = var.puplic-subnet-id
  key_name               = var.main-key
  vpc_security_group_ids = [var.web_security_group]
  tags = {
    Name = "DIAZ-AWS-Ubuntu-Web"
  }
  root_block_device {
    delete_on_termination = true
    volume_size           = 30
    encrypted             = true
    tags = {
      Name = "ubuntu-web root volume"
    }

  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host = aws_instance.ubuntu-web.public_ip
      
    }
  }

   provisioner "local-exec" {
    command = "ansible-playbook  -i ${aws_instance.ubuntu-web.public_ip}, --private-key ${local.private_key_path} apache.yaml"
  }




}

