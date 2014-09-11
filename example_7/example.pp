node 'install.puppeels.mylezeem.com' {
  include cloud::install::puppetmaster
  include cloud::install::puppetdb_server
  include cloud::install::jenkins
}
