terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.9.3"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

terraform {
  backend "s3" {
    endpoint = "s3.us-west-002.backblazeb2.com"
    region = "us-east-1"
    key = "debian-proxy.tfstate"
    bucket = "lmc-terraform"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    shared_credentials_file = "~/.vault/b2"
    profile = "terraform"
  }
}

resource "linode_instance" "debian-proxy" {
  image = "linode/debian12"
  label = "debian_proxy"
  region = var.region
  type = "g6-nanode-1"
  swap_size = "4096"
  authorized_keys = var.authorized_keys
  root_pass = var.root_pass
  backups_enabled = true
}
