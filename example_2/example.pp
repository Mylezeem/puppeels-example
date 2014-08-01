node 'monitor.puppeels.mylezeem.com' {
  include ::profile::monitoring::server::sensu
}

node 'log.puppeels.mylezeem.com' {
  include ::profile::logging::server::fluentd
}

node 'web001.puppeels.mylezeem.com', 'web002.puppeels.mylezeem.com', 'web003.puppeels.mylezeem.com' {
  include ::profile::webserver::apache
}

node 'balancer001.puppeels.mylezeem.com', 'balancer002.puppeels.mylezeem.com' {
  include ::profile::highavailability::haproxy
}
