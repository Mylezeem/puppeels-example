# Example 7 (Spinal Stack Install-Server)

Example 7 represents the following architecture :

* install.puppeels.mylezeem.com

## Infrastructure Overview

| What               | URL                                       | Credentials  |
|--------------------|-------------------------------------------|--------------|
|PuppetDB Dashboard  | http://install.puppeels.mylezeem.com:8080 | N/A          |
|Jenkins             | http://install.puppeels.mylezeem.com:8282 | N/A          |

## Infrastructure Details

### install.puppeels.mylezeem.com

The install server is the server in charge of the Spinal Stack deployment. It is made of several difference pieces :

 * Puppet Master: a Puppet King
 * PuppetDB : to handle exported resources
 * Jenkins : to automate the actual deployment
 * eDeploy : to bootstrap the physical servers

## Requirements

### Vagrant Box

The vagrantbox used for this example is : http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box

### Vagrant Plugins

  * [mutate](https://github.com/sciurus/vagrant-mutate) : used to mutate the CentOS 6.5 box from Virtualbox to Libvirt.

  * [hostmanager](https://github.com/smdahlen/vagrant-hostmanage) : used to handle the name resolution between boxes.
