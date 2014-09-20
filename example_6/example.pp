node 'pentaho.puppeels.mylezeem.com' {
  Exec {
    path => ['/bin', '/usr/bin', '/usr/sbin'],
  }

  include ::profile::application::pentaho

}
