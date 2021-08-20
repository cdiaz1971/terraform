resource "aws_lb" "alb-01" {
  name               = var.alb_name
  internal           = "false"
  load_balancer_type = "application"
  security_groups    = [var.alb_sg]

  subnet_mapping {
    subnet_id = var.alb_sn

  }
  subnet_mapping {
    subnet_id = var.alb2_sn
  }
}

resource "aws_lb_listener" "alb-http" {
  load_balancer_arn = aws_lb.alb-01.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http-tg.arn
  }

}

resource "aws_lb_target_group" "http-tg" {
  name     = "http-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "http_target_attach" {
  target_group_arn = aws_lb_target_group.http-tg.arn
  target_id        = var.target_instance_instance_id1

}

resource "aws_lb_target_group_attachment" "http_target_attach2" {
  target_group_arn = aws_lb_target_group.http-tg.arn
  target_id        = var.target_instance_instance_id2

}