# Terraform module for Cisco ACI static port deploy

This module helps engineers to deploy a lot of static port on multiple EPGs.


### Requirements

This module tested on Linux/Windows.
The following packages are required:
 - Terraform v0.13.4


### Preparation:

 - Change "Login information" about cisco APIC controller at the begin of variable.tf file.
 - Prepare terraform environment:
```sh
> cd deploy_many_static_bind/
> terraform init
```


### How it works

You need to modify variable.tf file in the deploy_many_static_bind folder in order to add static bind.
For each new static bind you have to add "bind_n" section. In this example we have bind_1 for epg called TEST-1_EPG and bind_2 for TEST-2_EPG:

     
    variable "static_port" {
      type = map
      default = {
        bind_1 = {
          tenant_name = "TEST-TENANT"
          anp_name = "TEST-ANP"
          epg_name = "TEST-1_EPG"
          tdn_path = "topology/pod-2/protpaths-409-410/pathep-[vPC_test-terraform1_PolGrp]"
          encap_vlan = "vlan-3888"
          if_mode = "regular"
        },
        bind_2 = {
          tenant_name = "TEST-TENANT"
          anp_name = "TEST-ANP"
          epg_name = "TEST-2_EPG"
          tdn_path = "topology/pod-2/protpaths-409-410/pathep-[vPC_test-terraform1_PolGrp]"
          encap_vlan = "vlan-3889"
          if_mode = "regular"
        }
      }
    }
     
