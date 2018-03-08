/*
*     
*     
*     aws ec2 describe-instances --instance-ids "i-00737110e02245421"
*
*    My IP ::    51.148.11.165
*
*
*
*
*    yum install java-1.8.0
*
*    https://artifacts.elastic.co/downloads/logstash/logstash-6.2.2.rpm
*
*/


provider "aws" {
  region = "eu-west-2"
  access_key = ""
  secret_key = ""

}

resource "aws_instance" "web" {
  
ami = "${var.ami}"

  instance_type = "t2.micro"

  key_name = "${var.key_name}"

  tags {
    Name = "Logstash for Elasticsearch"
  }
}
