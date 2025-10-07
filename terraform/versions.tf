terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.9.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
    }
  }
}
provider "vsphere" {
  user                 = data.vault_generic_secret.vsphere_credentails.data["vsphere_admin"]
  password             = data.vault_generic_secret.vsphere_credentails.data["vsphere_password"]
  vsphere_server       = data.vault_generic_secret.vsphere_credentails.data["vsphere_server"]
  allow_unverified_ssl = true
}

provider "vault" {
  address         = var.vault_address
  token           = var.token
  skip_tls_verify = true
}
