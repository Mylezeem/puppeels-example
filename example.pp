node postgresql {
  include ::profile::database::postgresql
  include ::profile::logging::agent::fluentd
  include ::puppetdb::database::postgresql
}

node log001 {
  include ::profile::logging::server::fluentd
}

node puppetdb {
  include ::puppetdb::server
}

node puppetmaster {
  include ::puppetdb::master::config
  include ::r10k
}
