..
 This work is licensed under a Creative Commons Attribution 3.0 Unported
 License.

 http://creativecommons.org/licenses/by/3.0/legalcode

==============================================
openstacklib::configs - A global configs class 
==============================================

In order to get closer to the role/profile paradigm, 100% hiera oriented,
having a helper class to create the {neutron,nova,etc..}_config resources
is a plus

Problem description
===================

Currently, when a configuration can not be set with the puppet module,
the only way to still specify it, is to set it in the wrapper class.

For example :

.. code:: bash

  class mywrapper::compute {
     class {'nova':
       parameter1 => 'foo',
       parameter2 => 'bar',
     }
     nova_config {
       parameter_extra => 42,
     }
  }

Unfortunately, this prevent us from using fully the role/profile paradigm.
Something like

.. code:: bash

  class mywrapper::compute {
    include ::nova
    include anotherclass
  }

which would go along with a compute.yaml

.. code:: bash

  ---
    nova::parameter1: value1
    nova::parameter2: value2
    anotherclass::foo: bar


Proposed change
===============

During the first IRC meeting, it has been made clear that code that will get
used in more than one component should belong to openstacklib.

Hence I'd like to offer the creation of openstacklib::configs helper classes.
That will do the following :

.. code:: bash

  class openstacklib::nova_configs {
    $config = hiera_hash('openstacklib::nova_configs', undefined)
    if $config {
      create_resource('nova_config', $config)
    }
  }

This will ease the use of hiera, and the above example would become

.. code:: bash

  class mywrapper::compute {
    include openstacklib::nova_config
    include ::nova
  }

The corresponding compute.yaml could be

.. code:: bash

  ---
    openstack::nova_configs:
      'DEFAULT/foo' :
        value: bar
      'DEFAULT/42' :
        ensure: absent
    nova::parameter1: foo
    nova::parameter2: bar

The same apply for each component.

To make things cleaner, a profile::openstacklib::configs could be created that
would instantiate all the component configs class. And we can finally only
include this one class to all our node.

.. code:: bash

  class profile::openstack::configs {
    include openstack::nova_configs
    include openstack::cinder_configs
    include openstack::neutron_configs
    include openstack::keystone_configs
    include openstack::swift_configs
  }

So the mywrapper::compute class would result int

.. code:: bash

  class mywrapper::compute {
    include ::profile::openstack::configs
    include ::nova
  }

with the following compute.yaml

.. code:: bash

  ---
    openstack::nova_configs:
      'DEFAULT/foo' :
        value: bar
      'DEFAULT/42' :
        ensure: absent
    openstack::neutron_configs:
      'DEFAULT/foo' :
        value: bar
      'DEFAULT/42' :
        ensure: absent
    nova::parameter1: foo
    nova::parameter2: bar


Alternatives
------------

TBD. Haven't found one yet.

Data model impact
-----------------

This change requires no data model impact. It just changes the way one design
their wrapper class.

Module API impact
-----------------

This change requires no module API impact on the openstack component themselves.
It will, however, create new classes in the openstacklib puppet module.

End user impact
---------------------

This change has no end-user impact.

Performance Impact
------------------

This change should have no performance impact.

Deployer impact
---------------------

For a deployer, this change aims to help her deploy openstack.

Moving toward a full role/profile paradigm, the deployer will only
have to focus on the component of each role (the various include statement)
and forge about the data themselves that will be taken from somewhere else.
(hiera). This allows to aim a really clean wrapper class. Exclusively with
include statements.

Developer impact
----------------

This change has no developer impact.

Implementation
==============

Assignee(s)
-----------

Primary assignee:
  yanis-guenane

Other contributors:
  emilienm

Work Items
----------

Here is the list of the helper classes to create :

  * openstacklib::ceilometer_configs
  * openstacklib::ceph_configs
  * openstacklib::cinder_configs
  * openstacklib::designate_configs
  * openstacklib::glance_configs
  * openstacklib::heat_configs
  * openstacklib::horizon_configs
  * openstacklib::ironic_configs
  * openstacklib::keystone_configs
  * openstacklib::neutron_configs
  * openstacklib::nova_configs
  * openstacklib::sahara_configs
  * openstacklib::swift_configs
  * openstacklib::tempest_configs

Dependencies
============

None.

Testing
=======

TBD. Since the impact will mainly be for wrapper classes not sure how it can be tested.

Documentation Impact
====================

None.

References
==========

This pattern (configs) is already used in Puppet for serveral modules :
