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
  source             = "./modules/instances"
  puplic-subnet-id   = module.vpc.public_subnets[1]
  web_security_group = module.vpc.security_group_id
  instance_name = "webserver1"
  #count = 2
}
resource "null_resource" "apache" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = module.webserver.public_ip_address

    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook  -i ${module.webserver.public_ip_address}, --private-key ${local.private_key_path} ./apache.yml"
  }
}

/*  
 module "webserver2" {
  source             = "./modules/instances"
  puplic-subnet-id   = module.vpc.public_subnets[1]
  web_security_group = module.vpc.security_group_id
} 


module "cool_instance" {
  source             = "./modules/instances"
  puplic-subnet-id   = module.vpc.public_subnets[1]
  web_security_group = module.vpc.security_group_id
  instance_name      = "Pete"
} */