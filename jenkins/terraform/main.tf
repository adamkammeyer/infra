terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.37.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://192.168.10.34:8006/"
  username = var.proxmox_user
  password = var.proxmox_pass
  insecure = true
  tmp_dir  = "/var/tmp"
}

terraform {
  backend "s3" {
    endpoint = "s3.us-west-002.backblazeb2.com"
    region = "us-east-1"
    key = "jenkins.tfstate"
    bucket = "lmc-terraform"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    shared_credentials_file = "~/.vault/b2"
    profile = "terraform"
  }
}

resource "proxmox_virtual_environment_vm" "jenkins" {
  name        = "jenkins"
  description = "Jenkins CI/CD server"
  tags        = ["terraform", "ci"]

  node_name = "asus-proxmox"

  cpu {
    sockets = 4
  }

  memory {
    dedicated = 4096
  }

  clone {
    vm_id = 107
  }

  agent {
    enabled = "true"
  }

  disk {
    interface = "scsi0"
    datastore_id = "local-lvm"
    size = 64
  }

  initialization {
    dns {
      server = "192.168.10.1"
    }
    ip_config {
      ipv4 {
        address = "192.168.10.50/24"
        gateway = "192.168.10.1"
      }
    }
    user_account {
      password = random_password.navigator_vm_password.result
      username = "navigator"
    }
  }

}

resource "random_password" "navigator_vm_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

