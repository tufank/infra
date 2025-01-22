variable "libvirt_network_name" {
  type    = string
  default = "default"
}

variable "hostname" {
  type    = string
  default = ""
}

variable "vcpu" {
  default = 2
  type    = number
}

variable "memory" {
  default = "4096"
  type    = number
}

variable "extra_disk_size" {
  type    = string
  default = "4096000000"
}

variable "lmi" {
  type = string
}

variable "ssh_user" {
  type = string
}

variable "timezone" {
  type = string
}

variable "ssh_authorized_keys" {
  type = list(any)
}

variable "domain_name" {
  type = string
}
