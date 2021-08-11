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
  value       = module.webserver.public_ip_address
}
/* output "instance2_IP" {
  description = "Instance IP"
  value       = module.webserver2.public_ip_address
} */