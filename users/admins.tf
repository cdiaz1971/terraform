provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "names" {
  for_each = toset(var.names)
  name     = each.value
}