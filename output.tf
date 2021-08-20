output "VPC_ID" {
  description = "First_VPC_ID"
  value       = module.vpc.vpc_id
}
output "public_subnets" {
  description = "VPC public Subnets"
  value       = module.vpc.public_subnets
}

output "instance2_IP" {
  description = "Instance IP"
  value       = module.webserver[*]
}
output "alb_sg" {
  description = "ALB security Group ID"
  value       = module.vpc.security_alb_id
}
output "instance_id" {
  value = module.webserver[1].instance_id
}