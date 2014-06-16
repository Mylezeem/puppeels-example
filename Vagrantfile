# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "postgresql" do |postgresql|
    postgresql.vm.box = "centos" 
    postgresql.vm.hostname = "postgresql.mylezeem.com"

    #postgresql.vm.provision "puppet" do |puppet|
    #  puppet.module_path = 'modules'
    #  puppet.hiera_config_path = 'hiera.yaml'
    #  puppet.options = "--verbose --debug"
    #end
  end

  config.vm.define "puppetdb" do |puppetdb|
    puppetdb.vm.box = "centos" 
    puppetdb.vm.hostname = "puppetdb.mylezeem.com"

    #puppetdb.vm.provision "puppet" do |puppet|
    #  puppet.module_path = 'modules'
    #  puppet.hiera_config_path = 'hiera.yaml'
    #  puppet.options = "--verbose --debug"
    #end
  end

  config.vm.define "puppetmaster" do |puppetmaster|
    puppetmaster.vm.box = "centos" 
    puppetmaster.vm.hostname = "puppetmaster.mylezeem.com"

    #puppetmaster.vm.provision "puppet" do |puppet|
    #  puppet.module_path = 'modules'
    #  puppet.hiera_config_path = 'hiera.yaml'
    #  puppet.options = "--verbose --debug"
    #end
  end

end
