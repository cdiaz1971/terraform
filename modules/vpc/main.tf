
locals {
  region = "us-east-1"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = var.vpc_name
  cidr   = var.vpc_cidr

  azs             = ["${local.region}a", "${local.region}b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true


  tags = {
    Owner       = "Cesar"
    Environment = "Test"
  }

  vpc_tags = {
    Name = var.vpc_name
  }
}
