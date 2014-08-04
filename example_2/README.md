# Example 2 (The basic on steroids)

Example 2 represents the following architecture :

* monitor.puppeels.mylezeem.com
* log.puppeels.mylezeem.com
* web001.puppeels.mylezeem.com
* web002.puppeels.mylezeem.com
* web003.puppeels.mylezeem.com
* balancer001.puppeels.mylezeem.com
* balancer002.puppeels.mylezeem.com

## Infrastructure Overview

| What                  | URL                                                  | Credentials  |
|-----------------------|------------------------------------------------------|--------------|
|Sensu Dashboard        | http://monitor.puppeels.mylezeem.com:8080            | admin/secret |
|Kibana Dashboard       | http://log.puppeels.mylezeem.com                     | N/A          |
|HAProxy(001) Dashboard | http://balancer001.puppeels.mylezeem.com:1936/admin  | admin/secret |
|HAProxy(002) Dashboard | http://balancer002.puppeels.mylezeem.com:1936/admin  | admin/secret |
|Web001 Homepage        | http://web001.puppeels.mylezeem.com                  | N/A          |
|Web002 Homepage        | http://web002.puppeels.mylezeem.com                  | N/A          |
|Web003 Homepage        | http://web003.puppeels.mylezeem.com                  | N/A          |

## Infrastructure Details

### monitor.puppeels.mylezeem.com

Monitor hosts the sensu server services (sensu-server, sensu-api, sensu-dashboard). It also host its own rabbitmq and redis instance. sensu-dashboard is available behind an apache proxy, that allows one to do SSL termination, if needed.

### log.puppeels.mylezeem.com

Log hosts the logging collection services (kibana, fluentd, logstash). It formats the logs as they come in and store them in an elasticsearch cluster. Data are then retrieved from Kibana, that can be put behind an apache proxy if needed.

### web001.puppeels.mylezeem.com

web001 is a basic apache server that aims to display only one html page. In this example it will server as a log producer so we can feed log.puppeels.mylezeem.com

### web002.puppeels.mylezeem.com

web002 is a basic apache server that aims to display only one html page. In this example it will server as a log producer so we can feed log.puppeels.mylezeem.com

### web003.puppeels.mylezeem.com

web003 is a basic apache server that aims to display only one html page. In this example it will server as a log producer so we can feed log.puppeels.mylezeem.com

### balancer001.puppeels.mylezeem.com

balancer001 hosts two highavailbility key components. First one is HAProxy, it redistribute the load between web001, web002 and web003. It also is part of a keepalived cluster. It holds the role of MASTER, and it actually hold the virtual ip the cluster has been asigned.

### balancer002.puppeels.mylezeem.com

balancer002 hosts two highavailbility key components. First one is HAProxy, it redistribute the load between web001, web002 and web003. It also is part of a keepalived cluster. It holds the role of BACKUP, and it would actally hold the virtual ip the cluster has been asigned in case balancer001 come to not answer.

## Requirements

### Vagrant Box

The vagrantbox used for this example is : http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box

### Vagrant Plugins

  * [mutate](https://github.com/sciurus/vagrant-mutate) : used to mutate the CentOS 6.5 box from Virtualbox to Libvirt.

  * [hostmanager](https://github.com/smdahlen/vagrant-hostmanage) : used to handle the name resolution between boxes.
