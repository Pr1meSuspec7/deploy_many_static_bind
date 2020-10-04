variable "user" {
  description = "Login information"
  type        = map
  default     = {
    username = "admin"
    password = "ciscopsdt"
    url      = "https://sandboxapicdc.cisco.com"
  }
}

## DECLARETION VARIABLES
# bind_n = It's only a label, to make it easy you can go on sequentially
# tenant_name = The real Tenant's name where EPG exist
# anp_name = The real ANP's name where EPG exist
# epg_name = The real EPG's name where you want to create static ports
# tdn_path = The path tDn for mapping vPC of interface:
### vPC interface example: "topology/pod-2/protpaths-409-410/pathep-[vPC_test-terraform1_PolGrp]"
### Single access interface example: "topology/pod-2/paths-410/pathep-[eth1/1]"
# encap_vlan = "vlan-nnnn"
# if_mode = "regular" for trunk (default), "native" for 802.1P, "untagged" for access


variable "static_port" {
  type = map
  default = {
    bind_1 = {
      tenant_name = "TEST-NSX"
      anp_name = "TEST-MULTIPOD_ANP"
      epg_name = "TEST-1_EPG"
      tdn_path = "topology/pod-2/protpaths-409-410/pathep-[vPC_test-terraform1_PolGrp]"
      encap_vlan = "vlan-3889"
      if_mode = "regular"
    },
    bind_2 = {
      tenant_name = "TEST-NSX"
      anp_name = "TEST-MULTIPOD_ANP"
      epg_name = "TEST-1_EPG"
      tdn_path = "topology/pod-2/protpaths-409-410/pathep-[vPC_test-terraform2_PolGrp]"
      encap_vlan = "vlan-3889"
      if_mode = "regular"
    },
    bind_3 = {
      tenant_name = "TEST-NSX"
      anp_name = "TEST-MULTIPOD_ANP"
      epg_name = "TEST-1_EPG"
      tdn_path = "topology/pod-2/protpaths-409-410/pathep-[vPC_test-terraform3_PolGrp]"
      encap_vlan = "vlan-3889"
      if_mode = "regular"
    }
  }
}
