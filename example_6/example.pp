node 'pentaho.puppeels.mylezeem.com' {
  Exec {
    path => ['/bin', '/usr/bin', '/usr/sbin'],
  }
  include ::epel
  include ::pentaho
}
