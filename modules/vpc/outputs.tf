# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}



# AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}
output "security_group_home_sg" {
  description = "Id of home_sg"
  value       = aws_security_group.home_sg.id
}
output "security_alb_id" {
  description = "ID of alb sg"
  value       = aws_security_group.from-alb.id
}

/* output "alb-sg" {
  description = "id of alb sg"
  value       = aws_security_group.from-alb.id
}
output "workspace" {
  description = "Workspace where apply was run"
  value       = terraform.workspace
}
output "ALB_DNS" {
  description = "DNS of ALB"
  value       = module.alb.lb_dns_name
}
 */
