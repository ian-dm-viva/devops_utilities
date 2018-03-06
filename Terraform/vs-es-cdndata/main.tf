/*
*	https://www.terraform.io/docs/providers/aws/r/elasticsearch_domain.html
*
*	aws es update-elasticsearch-domain-config --domain-name "vs-stage-es"
*
*	https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html
*
*	https://vpc-vs-esearch-cdndata-c356lzgqvzt3glxvnnffprhlq4.eu-west-2.es.amazonaws.com/_plugin/kibana/
*
*	(ID: arn:aws:es:eu-west-2:409913703342:domain/vs-esearch-cdndata)
*/


resource "aws_ebs_volume" "es-volume" {
    availability_zone = "eu-west-2a"
    size = "${var.aws_ebs_volume_size}"
    tags {
        Name = "${var.aws_ebs_volume_name}"
    }
}


resource "aws_elasticsearch_domain" "es" {
  domain_name           = "${var.domain_name}"           
  elasticsearch_version = "${var.elasticsearch_version}" # "6.0"

  cluster_config {
    instance_type = "m4.large.elasticsearch"
  }

  ebs_options {
    ebs_enabled = "true"
    #volume_size = 40
    volume_size = "${var.aws_ebs_volume_size}"
  }

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }


  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Condition": {
                "IpAddress": {"aws:SourceIp": ["51.148.11.165/32"]}
            }
        }
    ]
}
CONFIG

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  tags {
    Domain = "${var.domain_tag}"
  }
}
