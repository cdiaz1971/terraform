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
  public-subnet-id   = module.vpc.public_subnets[1]
  web_security_group = module.vpc.security_group_id
  instance_name      = each.value

}
