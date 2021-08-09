variable "main-key" {
  type    = string
  default = "DIAZ-AWS-KEY"
}
variable "ubuntu-ami" {
  type    = string
  default = "ami-09e67e426f25ce0d7"
}
variable "EC2SSM" {
  type    = string
  default = "AmazonEC2RoleforSSM-Diaz"
}
variable "Home_IP" {
  default = "71.206.46.139/32"
}