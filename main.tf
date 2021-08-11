provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

}
module "webserver" {
  source             = "./modules/instances"
  puplic-subnet-id   = module.vpc.public_subnets[1]
  web_security_group = module.vpc.security_group_id
}
module "webserver2" {
  source             = "./modules/instances"
  puplic-subnet-id   = module.vpc.public_subnets[1]
  web_security_group = module.vpc.security_group_id
}