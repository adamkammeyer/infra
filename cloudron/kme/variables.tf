variable "linode_token" {
  sensitive = true
}

variable "authorized_keys" {
  sensitive = true
}

variable "root_pass" {
  sensitive = true
}

variable "region" {
  default = "us-central"
}
