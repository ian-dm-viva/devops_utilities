# Logstash variables
#
#

variable "aws_profile" {
  default = "vs"
}

variable "application" {
  default = "Logstash"
}

variable "environment" {
  default = "prod"
}

variable "aws_region" {
  default = "eu-west-2"
}

variable "ami" {
  default = "ami-c1d2caa5"
}

variable "vpc_security_group_ids" {
  default = ["sg-0fd9093c60d1f5500"]
}

variable "security_groups" {
  default = ["sg-elasticsearch"]
}

# vs-esearch-net
variable "subnet_id" {
   default = "subnet-056dd67f358fe9887"
} 

variable "key_name" {
  default = "logstash-cdn"
}

variable "aws_availability_zones" {
  type    = "list"
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "aws_vpc_cidr_block" {
  default = "172.31.117.0/24"
}


