# Example 1

Example 1 represents the following architecture :

* monitor.puppeels.mylezeem.com
* log.puppeels.mylezeem.com
* web001.puppeels.mylezeem.com
* web002.puppeels.mylezeem.com


## monitor.puppeels.mylezeem.com

Monitor hosts the sensu server services (sensu-server, sensu-api, sensu-dashboard). It also host its own rabbitmq and redis instance. sensu-dashboard is available behind an apache proxy, that allows one to do SSL termination, if needed.

## log.puppeels.mylezeem.com

Log hosts the logging collection services (kibana, fluentd, logstash). It formats the logs as they come in and store them in an elasticsearch cluster. Data are then retrieved from Kibana, that can be put behind an apache proxy if needed.


## web001.puppeels.mylezeem.com

web001 is a basic apache server that aims to display only one html page. In this example it will server as a log producer so we can feed log.puppeels.mylezeem.com

## web002.puppeels.mylezeem.com

web002 is a basic apache server that aims to display only one html page. In this example it will server as a log producer so we can feed log.puppeels.mylezeem.com
