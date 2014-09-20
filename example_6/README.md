# Example 6 (Pentaho BA server)

Example 6 represents the following architecture :

* pentaho.puppeels.mylezeem.com

## Infrastructure Overview

| What              | URL                                               | Credentials    |
|-------------------|---------------------------------------------------|----------------|
|Pentaho Dashboard  | http://pentaho.puppeels.mylezeem.com:8080/pentaho | admin/password |

## Infrastructure Details

### monitor.puppeels.mylezeem.com

Pentaho hosts the Pentaho BA server it is running behind an apache tomcat application container.

## Requirements

### Vagrant Box

The vagrantbox used for this example is : http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box

### Vagrant Plugins

  * [mutate](https://github.com/sciurus/vagrant-mutate) : used to mutate the CentOS 6.5 box from Virtualbox to Libvirt.

  * [hostmanager](https://github.com/smdahlen/vagrant-hostmanage) : used to handle the name resolution between boxes.
