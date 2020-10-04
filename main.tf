terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

# Configure the provider with your Cisco APIC credentials.
provider "aci" {
  # APIC Username
  username = var.user.username
  # APIC Password
  password = var.user.password
  # APIC URL
  url      = var.user.url
  insecure = true
}



module "bind_for_epg" {
  source = "./modules/static_port"
  for_each = var.static_port
  tenant_name = each.value.tenant_name
  anp_name = each.value.anp_name
  epg_name = each.value.epg_name
  tdn_path = each.value.tdn_path
  encap_vlan = each.value.encap_vlan
  if_mode = each.value.if_mode
}
