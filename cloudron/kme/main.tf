terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.9.3"
    }
    publicip = {
      source = "nxt-engineering/publicip"
      version = "0.0.9"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

provider "publicip" {}

data "publicip_address" "default" {
}

terraform {
  backend "s3" {
    endpoint = "s3.us-west-002.backblazeb2.com"
    region = "us-east-1"
    key = "kme.tfstate"
    bucket = "lmc-terraform"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    shared_credentials_file = "~/.vault/b2"
    profile = "terraform"
  }
}

resource "linode_instance" "kme" {
  image = "linode/ubuntu22.04"
  label = "kme-cloudron"
  region = var.region
  type = "g6-nanode-1"
  swap_size = "4096"
  authorized_keys = var.authorized_keys
  root_pass = var.root_pass
  backups_enabled = true
}

resource "linode_firewall" "kme-firewall" {
  label = "kme-firewall"
  inbound {
    label    = "allow-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label = "allow-ssh"
    action = "ACCEPT"
    protocol = "TCP"
    ports = "22"
    ipv4 = ["${data.publicip_address.default.ip}/32"]
  }

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [linode_instance.kme.id]
}