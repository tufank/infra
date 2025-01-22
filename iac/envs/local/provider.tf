terraform {
  required_version = ">= 1.9.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2"
    }
    libvirt = {
      source  = "dmacvicar/libvirt",
      version = "~> 0.8.1"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}
