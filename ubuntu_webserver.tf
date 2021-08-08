resource "aws_instance" "ubuntu-web" {
  ami                    = var.ubuntu-ami
  instance_type          = "t2.micro"
  iam_instance_profile   = var.EC2SSM
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = var.main-key
  vpc_security_group_ids = [aws_security_group.from-alb.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 30
    encrypted             = true
    tags = {
      Name = "ubuntu-web root volume"
    }

  }
  user_data = fileexists("script.sh") ? file("script.sh") : null
  tags = {
    Name = "DIAZ-AWS-Ubuntu-Web"
  }
}

