data "vsphere_datacenter" "Datacenter" {
  name = var.datacenter
}

data "vsphere_datastore" "System-Datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.Datacenter.id
}

data "vsphere_compute_cluster" "ClusterR" {
  name          = var.compute-cluster
  datacenter_id = data.vsphere_datacenter.Datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network-name
  datacenter_id = data.vsphere_datacenter.Datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.Datacenter.id
}

# Vault Server 
data "vault_generic_secret" "vsphere_credentails" {
  path = "kv/secret/vsphere"
}
