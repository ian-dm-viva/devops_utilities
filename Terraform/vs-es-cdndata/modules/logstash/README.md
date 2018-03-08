
## Installation

To install Logstash you need tin install Java

yum install java-1.8.0

Download and install logstash

curl https://artifacts.elastic.co/downloads/logstash/logstash-6.2.2.rpm -o logstash-6.2.2.rpm
rpm -i logstash-6.2.2.rpm

The Logstash configuration is stored in :

/etc/logstash

The installation should create a startup script located here :

/etc/systemd/system/logstash.service

With this Logstash can be started with :

systemctl start logstash

## Plugins

For this instance of Logstash to work we need three plugins :

* s3
* grok
* logstash-output-amazon_es

s3 and grok are installed by default but we need to install logstash-output-amazon_es

/usr/share/logstash/bin/plugin install logstash-output-amazon_es

## Configuration

config/piplines.yml

config/s3.conf

Need to add AWS id and keys into s3.conf and the AWS Elasticsearch destination

hosts => ["search-elasticsearch-cdndata-vwixlfxfcnwlro47h5kil3w3na.eu-west-2.es.amazonaws.com"]

## Grok

The grok plugin is a useful tool to parse out the log message into useful tokens, there is this site which is useful for debugging the right syntax :

http://grokdebug.herokuapp.com/ 
