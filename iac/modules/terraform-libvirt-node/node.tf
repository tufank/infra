locals {
  fqdn = "${var.hostname}.${var.domain_name}"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit_${var.hostname}.iso"
  user_data = templatefile("${path.module}/config/cloud_init.yml", { fqdn = local.fqdn, ssh_user = var.ssh_user, ssh_authorized_keys = var.ssh_authorized_keys })
}

resource "libvirt_volume" "root_volume" {
  name   = "root_volume_${var.hostname}"
  pool   = "default"
  format = "qcow2"
  source = var.lmi
}

resource "libvirt_volume" "root_volume_resized" {
  name           = "root_volume_resized_${var.hostname}"
  pool           = "default"
  format         = "qcow2"
  base_volume_id = libvirt_volume.root_volume.id
  size           = 8361393152
}

resource "libvirt_volume" "extra_disk" {
  name = "${var.hostname}.extra.qcow2"
  size = var.extra_disk_size
}

resource "libvirt_domain" "node" {
  name    = var.hostname
  cmdline = []
  vcpu    = var.vcpu
  memory  = var.memory

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  disk {
    volume_id = libvirt_volume.root_volume_resized.id
  }

  disk {
    volume_id = libvirt_volume.extra_disk.id
  }

  network_interface {
    network_name   = var.libvirt_network_name
    wait_for_lease = true
    hostname       = local.fqdn
  }
}
