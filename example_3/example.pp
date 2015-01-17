node 'mongod01.puppeels.mylezeem.com' {
  Class['epel'] -> Package['mongodb']

  include profile::base::common
  include profile::database::mongodb::mongod
}
