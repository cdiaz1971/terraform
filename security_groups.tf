resource "aws_security_group" "home_sg" {
  name        = "From_Home"
  description = " Allow Connections from home"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH Access from Home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.Home_IP]
  }
  ingress {
    description = "HTTP Access from Home"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.Home_IP]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Verified = "No"
  }
}
resource "aws_security_group" "ssh_sg_private" {
  name        = "SSH-internal"
  description = " Allow Connections via ssh"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Access from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Verified = "No"
  }
}
resource "aws_security_group" "from-alb" {
  name        = "From_ALB"
  description = " Allow Connections from the alb"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "HTTP Access from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.home_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Verified = "No"
  }
}