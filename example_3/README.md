# Example 3 (A MongoDB server)

Example 3 represents the following architecture :

* mongod01.puppeels.mylezeem.com

## Infrastructure Overview

| What                  | URL                                                  | Credentials  |
|-----------------------|------------------------------------------------------|--------------|
|MongoDB Dashboard      | http://mongod01.puppeels.mylezeem.com:28017          | N/A          |

## Infrastructure Details

### mongod01.puppeels.mylezeem.com

A MongoDB server, with the mongod process running on 27017 and listening to its Public IP.

## Requirements

### Vagrant Box

The vagrantbox used for this example is : http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box

### Vagrant Plugins

  * [mutate](https://github.com/sciurus/vagrant-mutate) : used to mutate the CentOS 6.5 box from Virtualbox to Libvirt.

  * [hostmanager](https://github.com/smdahlen/vagrant-hostmanage) : used to handle the name resolution between boxes.
