node 'install.puppeels.mylezeem.com' {
  include ::epel
  include cloud::install::puppetmaster
  include cloud::install::puppetdb_server
  include cloud::install::jenkins
}
