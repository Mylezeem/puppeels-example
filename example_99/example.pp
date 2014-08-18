node 'install.puppeels.mylezeem.com' {

  include profile::application::jenkins
  include profile::application::puppet_master

}
