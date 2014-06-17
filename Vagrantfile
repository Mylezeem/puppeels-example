# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.box = "centos"

  config.vm.define "postgresql" do |postgresql|
    postgresql.vm.hostname = "postgresql.mylezeem.com"

    #postgresql.hostmanager.enabled = true
    #postgresql.hostmanager.manage_host = true
    postgresql.vm.synced_folder ".", "/vagrant", type: "rsync"
    postgresql.vm.provision "shell", inline: "yum -y update puppetlabs-release"
    postgresql.vm.provision "shell", inline: "yum -y update puppet"

    postgresql.vm.provision "puppet" do |puppet|
      puppet.synced_folder_type = 'rsync'
      puppet.module_path = 'modules'
      puppet.hiera_config_path = 'hiera.yaml'
    end
  end

  config.vm.define "puppetdb" do |puppetdb|
    puppetdb.vm.hostname = "puppetdb.mylezeem.com"

    #puppetdb.hostmanager.enabled = true
    #puppetdb.hostmanager.manage_host = true
    puppetdb.vm.synced_folder ".", "/vagrant", type: "rsync"
    puppetdb.vm.provision "shell", inline: "yum -y update puppetlabs-release"
    puppetdb.vm.provision "shell", inline: "yum -y update puppet"

    puppetdb.vm.provision "puppet" do |puppet|
      puppet.synced_folder_type = 'rsync'
      puppet.module_path = 'modules'
      puppet.hiera_config_path = 'hiera.yaml'
    end
  end

  config.vm.define "puppetmaster" do |puppetmaster|
    puppetmaster.vm.hostname = "puppetmaster.mylezeem.com"

    #puppetmaster.hostmanager.enabled = true
    #puppetmaster.hostmanager.manage_host = true
    puppetmaster.vm.synced_folder ".", "/vagrant", type: "rsync"
    puppetmaster.vm.provision "shell", inline: "yum -y update puppetlabs-release"
    puppetmaster.vm.provision "shell", inline: "yum -y update puppet"

    puppetmaster.vm.provision "puppet" do |puppet|
      puppet.synced_folder_type = 'rsync'
      puppet.module_path = 'modules'
      puppet.hiera_config_path = 'hiera.yaml'
    end
  end

end
