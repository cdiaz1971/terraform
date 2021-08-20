provider "aws" {
  region = "us-east-1"
}
locals {
  ssh_user         = "ubuntu"
  key_name         = "DIAZ-AWS"
  private_key_path = "~/DIAZ-AWS.pem"
}
module "vpc" {
  source = "./modules/vpc"

}
module "webserver" {
  for_each           = toset(var.web_name)
  source             = "./modules/instances"
  public-subnet-id   = module.vpc.public_subnets[each.value]
  web_security_group = module.vpc.security_alb_id
  instance_name      = join("", ["web-0", each.value])

}
module "alb" {
  source                       = "./modules/load_balancers"
  alb_name                     = "ALB1"
  vpc_id                       = module.vpc.vpc_id
  alb_sn                       = module.vpc.public_subnets[1]
  alb_sg                       = module.vpc.security_alb_id
  target_instance_instance_id1 = module.webserver[1].instance_id
  target_instance_instance_id2 = module.webserver[2].instance_id
  #target_instance_instance_id = "i-08cb15f35aea0c24b"


} 
 