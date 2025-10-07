output "vm_ip" {
  description = "IP of created Vm"
  value       = vsphere_virtual_machine.vm.default_ip_address

}
output "instance_name" {
  description = "Instance name"
  value       = vsphere_virtual_machine.vm.name
}

output "attached_disks" {
  description = "The attached disks"
  value = [
    for disk in vsphere_virtual_machine.vm.disk : {
      name = disk.label
      size = disk.size
  }]
}

output "os_guest" {
  description = "Vm Running Operating system"
  value       = vsphere_virtual_machine.vm.guest_id
}

output "ram" {
  description = "Instance Memory"
  value       = vsphere_virtual_machine.vm.memory
}

output "cpus" {
  description = "Instance reserved cpus"
  value       = vsphere_virtual_machine.vm.num_cpus
}

output "vm_power_state" {
  description = "shows the power state of instance (powered On/Off)"
  value       = vsphere_virtual_machine.vm.power_state
}