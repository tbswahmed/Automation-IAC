variable "datacenter" {
  type    = string
  default = "sys-Datacenter"

}
variable "datastore" {
  type    = string
  default = "System-Datastore"
}
variable "network-name" {
  type    = string
  default = "VM Network"
}
variable "compute-cluster" {
  type    = string
  default = "sys-cluster"
}
variable "template_name" {
  type    = string
  default = "RHEL8-template"
}


# Vm resource definition

variable "vm_name" {
  type    = string
  default = "terraform-test"
}
variable "memory" {
  type    = number
  default = 4096
}
variable "cpus" {
  type    = number
  default = 2
}
variable "efi_type" {
  type    = string
  default = "efi"

}

# Disk Definition and params


variable "disk_type" {
  type    = string
  default = "thin"
}
variable "disk_label" {
  type    = string
  default = "disk0"

}
variable "vmdk-path" {
  type    = string
  default = "Terraform_Disks"

}
variable "create_directories" {
  type    = bool
  default = true

}

# Cloud-init Parameters (user/meta data)
variable "ssh_keys" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDtcQjezv09vEgG9jvHPZyEGipgeP+hNxnj4lJ0hClvh5dQzJmfBdLBpUDQ6ChRSOYvo+Hk2hljeonpqrV+/0lO8R0/XHR/0cKWUCD2T3isPhph+NGw15/XsVCzhHqLUvnDJh7pv6Uc16a3mKmOf/DG7ct+0vMZCMNKmqD0Wmkls8tj/C+OT0c01T3e2bXgUhBmq9g6Hefm78/IqRQbABwwDu+JMwadhBWXLsWJWHDvHWKxO+J5vRSVn76+ZThm+srRjNtLolpz03lhQGdf5tGJK/VH1WH2loxzkeFH5wddb+Fg1gzV4mRonkY/p5lAhas6EU7ZnxVxaKDjyfcLoqu9vdZhjR7FhyXISBDd03zQ4W9yQj7hM9QIM4oJc1bNGqKY0uvWW2DeZmvBsU4DK6BICH6jCcg0ajEOyCetrxpwBg5KiSN8H3EK49VYYzqTZR0I1dy6gkbo3jAOx+G4V5+AsJDVSjkdgBDAZAf16HkQjrsce79n4W5+t3fSdp9X9hU= ahmedtb@otbs-LTP641.onetech-group.corp"
}

variable "instance_ip" {
  type    = string
  default = "####"
}
variable "ipv4_gateway" {
  type    = string
  default = "####"

 }
variable "host-name" {
  type    = string
  default = "terraform-temp-vm"
}
variable "domain" {
  type    = string
  default = "###"
}
variable "dns" {
  type    = string
  default = "####"
}

# Cloud-init Userdata
variable "user-name" {
  type    = string
  default = "cloud-user"
}
variable "sudo-perms" {
  type    = string
  default = "['ALL=(ALL) NOPASSWD:ALL']"
}
variable "password" {
  type    = string
  default = "$6$rounds=4096$ABxPa/cZFvLnnuFk$HvO4chSGAL8qyu3G30zDVOZK6omqu0CiXwkHP6e4woSjo/yACl5pQKYMhF7ut60geAkTgGQ9u6hejyfmsPiRt0"
}
variable "shell" {
  type    = string
  default = "/bin/bash"
}
variable "user_groups" {
  type    = string
  default = "sudo"
}




## Vault Server Credentials
variable "vault_address" {
  type    = string
  default = "##" # vault address
}
variable "token" {
  type    = string
  default = "####"
}




### requested Disks size to be added to instance ###
variable "additional_disks" {
  type = list(object({
    size = number
  }))
  #default     = [{size = 10}, {size = 10}]
  description = "List of additional disks to create and attach to the VM"
}


variable "resource_id" {
    type = string
    default = ""
}