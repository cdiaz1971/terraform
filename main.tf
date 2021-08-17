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
  puplic-subnet-id   = module.vpc.public_subnets[1]
  web_security_group = module.vpc.security_group_id
  instance_name      = each.value

}
/* resource "null_resource" "apache" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(local.private_key_path)
      host        = module.webserver[0].public_ip_address

    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook  -i ${module.webserver[0].public_ip_address}, --private-key ${local.private_key_path} ./apache.yml && ansible-playbook  -i ${module.webserver[1].public_ip_address}, --private-key ${local.private_key_path} ./apache.yml "
  }
} */

