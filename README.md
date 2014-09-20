puppeels-example
================

The puppeels-example repository is a set of real life infra example one could build using the [puppeels](https://github.com/Mylezeem/puppeels) profiles. It is meant to highlight how one could build common infra scenario using those given puppet profiles.


Example 1: The basic
--------------------

The [example_1](https://github.com/Mylezeem/puppeels-example/tree/master/example_1) folder, represents a basic infrastructure case of having 2 webservers. Each web server is monitored using [sensu](http://sensuapp.org), and logs are centralized using ([fluentd](http://www.fluentd.org) + [elasticsearch](http://www.elasticsearch.org) + [kibana](http://www.elasticsearch.org/overview/kibana/)). Once the Vagrant file is run please see below the reachable URLs:

| What            | URL                                       | Credentials  |
|-----------------|-------------------------------------------|--------------|
|Sensu Dashboard  | http://monitor.puppeels.mylezeem.com:8080 | admin/secret |
|Kibana Dashboard | http://log.puppeels.mylezeem.com          | N/A          |
|Web001 Homepage  | http://web001.puppeels.mylezeem.com       | N/A          |
|Web002 Homepage  | http://web002.puppeels.mylezeem.com       | N/A          |


Example 2: The basic on steroids
--------------------------------

The [example_2](https://github.com/Mylezeem/puppeels-example/tree/master/example_2) folder, represents the basic infrastructure case of having 3 webservers, but this time the webservers are behing a [HAProxy](http://www.haproxy.org), that is itself tight to a floating ip managed by [keepalived](http://keepalived.org). Each web server is monitored using [sensu](http://sensuapp.org), and logs are centralized using ([fluentd](http://www.fluentd.org) + [elasticsearch](http://www.elasticsearch.org) + [kibana](http://www.elasticsearch.org/overview/kibana/)). Once the Vagrant file is run please see below the reachable URLs:

| What                  | URL                                                  | Credentials  |
|-----------------------|------------------------------------------------------|--------------|
|Sensu Dashboard        | http://monitor.puppeels.mylezeem.com:8080            | admin/secret |
|Kibana Dashboard       | http://log.puppeels.mylezeem.com                     | N/A          |
|HAProxy(001) Dashboard | http://balancer001.puppeels.mylezeem.com:1936/admin  | admin/secret |
|HAProxy(002) Dashboard | http://balancer002.puppeels.mylezeem.com:1936/admin  | admin/secret |
|Web001 Homepage        | http://web001.puppeels.mylezeem.com                  | N/A          |
|Web002 Homepage        | http://web002.puppeels.mylezeem.com                  | N/A          |
|Web003 Homepage        | http://web003.puppeels.mylezeem.com                  | N/A          |

Example 6: Pentaho BA server
----------------------------

The [example_6](https://github.com/Mylezeem/puppeels-example/tree/master/example_6) folder, represents a server running [Pentaho BA server](http://www.pentaho.com) community edition behind the [tomcat](http://tomcat.apache.org) application server. Once the Vagrant file is run please see below the reachable URLs:

| What                    | URL                                                | Credentials    |
|-------------------------|----------------------------------------------------|----------------|
|Pentaho Dashboard        | http://pentaho.puppeels.mylezeem.com:8080/pentaho  | admin/password |
