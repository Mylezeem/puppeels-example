node postgresql {
  include ::postgresqlrepo
  include ::postgresql::globals
  include ::postgresql::server
}

node puppetdb {
  include ::puppetdb::server
}

node puppet {
  include ::puppetdb::master::config
  include ::r10k
}
