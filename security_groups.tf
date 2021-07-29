resource "aws_security_group" "ssh_sg" {
  name        = "SSH"
  description = " Allow Connections via ssh"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Access from Home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["71.206.46.139/32"]
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