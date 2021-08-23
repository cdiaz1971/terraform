output "VPC_ID" {
  description = "First_VPC_ID"
  value       = module.vpc.vpc_id
}
output "public_subnets" {
  description = "VPC public Subnets"
  value       = module.vpc.public_subnets
}

output "instance_IP" {
  description = "Instance IP"
  value       = module.webserver[*].public_ip_address
}
output "alb_sg" {
  description = "ALB security Group ID"
  value       = module.vpc.security_alb_id
}
output "alb_dns" {
  description = "public DNS of ALB"
  value       = module.alb.alb_dns
}
output "jump_server_ip" {
  value = module.jump-server
}