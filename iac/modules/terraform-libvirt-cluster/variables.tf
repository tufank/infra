variable "node_names" {
  type    = set(string)
  default = []
}

variable "vcpu" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 2048
}

variable "lmi" {
  type = string
}

variable "ssh_user" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "timezone" {
  type = string
}

variable "ssh_authorized_keys" {
  type = list(any)
}
