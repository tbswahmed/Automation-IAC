locals {
  templatevars = {
    host-name     = var.host-name,
   instance_ip    = var.instance_ip,
    ipv4_gateway  = var.ipv4_gateway,
    domain        = var.domain,
    dns           = var.dns,
    user-name     = var.user-name,
    ssh_keys      = var.ssh_keys,
    sudo-perms    = var.sudo-perms,
    password      = var.password,
    user_groups   = var.user_groups,
    shell         = var.shell
  }
}

resource "vsphere_virtual_disk" "additional_disks" { # ==> This ressource will be only created when a user requests it (consumes content from the variable "additional_disks") default set to empty list [] 
  count              = length(var.additional_disks)
  size               = var.additional_disks[count.index].size
  type               = var.disk_type
  vmdk_path          = "/${var.vmdk-path}/${var.resource_id}_extra_disk_${count.index + 1}.vmdk"
  datacenter         = data.vsphere_datacenter.Datacenter.name
  datastore          = data.vsphere_datastore.System-Datastore.name
  create_directories = var.create_directories
}

resource "vsphere_virtual_machine" "vm" {
  name                   = var.vm_name
  resource_pool_id       = data.vsphere_compute_cluster.ClusterR.resource_pool_id
  datastore_id           = data.vsphere_datastore.System-Datastore.id
  num_cpus               = var.cpus
  memory                 = var.memory
  cpu_hot_add_enabled    = "true"
  cpu_hot_remove_enabled = "true"
  memory_hot_add_enabled = "true"
  guest_id               = data.vsphere_virtual_machine.template.guest_id
  scsi_type              = data.vsphere_virtual_machine.template.scsi_type
  firmware               = var.efi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "${var.disk_label}_1"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }

  dynamic "disk" {
    for_each = vsphere_virtual_disk.additional_disks
    content {
      label        = "${var.resource_id}_extra_disk${disk.key + 1}"
      path         = disk.value.vmdk_path
      datastore_id = data.vsphere_datastore.System-Datastore.id
      unit_number  = disk.key + 1
      size         = disk.value.size
    }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  extra_config = {
    "guestinfo.userdata"          = base64encode(templatefile("${path.module}/templates/userdata.yaml", local.templatevars))
    "guestinfo.userdata.encoding" = "base64"
    "guestinfo.metadata"          = base64encode(templatefile("${path.module}/templates/metadata.yaml", local.templatevars))
    "guestinfo.metadata.encoding" = "base64"
  }
}


# testing terraform state
terraform {
  backend "pg" {
    conn_str = "postgres://{{db_user}}:{{db_password}}@10.112.63.170:5432/{{db_name}}?sslmode=disable"
    
  }
}
