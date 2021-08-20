module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = var.alb_name

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = [var.alb_sn]
  security_groups    = [var.alb_sg]

  /* access_logs = {
    bucket = "my-alb-logs"
  } */

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = var.target_instance_instance_id1
          port = 80
          target_id = var.target_instance_instance_id2
          port = 80
        }
      ]
    }
  ]

  

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  /* tags = {
    Environment = "Test"
  } */
}