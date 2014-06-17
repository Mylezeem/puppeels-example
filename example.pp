node postgresql {
  include ::postgresqlrepo
  include ::postgresql::globals
  include ::postgresql::server
  include ::postgresql::server::pg_hba_rules
  include ::puppetdb::database::postgresql
}

node puppetdb {
  include ::puppetdb::server
}

node puppetmaster {
  include ::puppetdb::master::config
  include ::r10k
}
