variable "aws_region" {}
variable "environment" {}

variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}

variable "instance_type" {}
variable "key_name" {}

variable "strapi_port" {
  default = 1337
}
variable "public_subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}
variable "ssh_cidr" {}

