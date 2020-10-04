terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

# Fetch Tenant
data "aci_tenant" "tenant" {
  name  = var.tenant_name
}

variable "tenant_name" {}

# Fetch AP
data "aci_application_profile" "anp" {
  tenant_dn  = data.aci_tenant.tenant.id
  name       = var.anp_name
}

variable "anp_name" {}

# Fetch EPG
data "aci_application_epg" "epg" {
  application_profile_dn  = data.aci_application_profile.anp.id
  name                    = var.epg_name
}

variable "epg_name" {}

# Configuring static ports
resource "aci_epg_to_static_path" "static_path" {                           
  application_epg_dn  = data.aci_application_epg.epg.id
  tdn  = var.tdn_path
  encap  = var.encap_vlan
  mode  = var.if_mode
#  instr_imedcy  = "immediate", "lazy"
}

variable "tdn_path" {}
variable "encap_vlan" {}
variable "if_mode" {}