 This work is licensed under a Creative Commons Attribution 3.0 Unported
 License.

 http://creativecommons.org/licenses/by/3.0/legalcode

==============================================
openstacklib::configs - A global configs class 
==============================================

Include the URL of your launchpad blueprint:

https://blueprints.launchpad.net/puppet-[projectname]/+spec/example

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
