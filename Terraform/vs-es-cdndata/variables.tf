/*
*   Terraform build for AWS Elasticsearch
*
*/



provider "aws" {
  region     = "eu-west-2"
  access_key = ""
  secret_key = ""
}

variable "domain_name" {
  default = "elasticsearch-cdndata"
}

variable "elasticsearch_version" {
  default = "6.0"
}

variable "domain_tag" {
  default = "Elasticsearch-CDN-Domain"
}

variable "vpc_id" {
  default = "vpc-021f2a373527fb10f"
}

variable "subnet_ids" {
  default = ["subnet-056dd67f358fe9887"]
}


variable "security_groups" {
  default = ["sg-0fd9093c60d1f5500"]
}

variable "aws_ebs_volume_name" { type = "string", default = "ESearch-ebs-vol" }
variable "aws_ebs_volume_size" { type = "string", default = "100" }

