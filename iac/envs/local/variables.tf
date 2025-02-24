# general variables

variable "ssh_private_key_file" {
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

# postgresql
variable "postgresql_node_names" {
  type    = set(string)
  default = []
}

variable "postgresql_vcpu" {
  type    = number
  default = 1
}

variable "postgresql_memory" {
  type    = number
  default = 1024
}

variable "postgresql_lmi" {
  type = string
}

# odoo
variable "odoo_node_names" {
  type    = set(string)
  default = []
}

variable "odoo_vcpu" {
  type    = number
  default = 1
}

variable "odoo_memory" {
  type    = number
  default = 1024
}

variable "odoo_lmi" {
  type = string
}

# etcd
variable "etcd_node_names" {
  type    = set(string)
  default = []
}

variable "etcd_vcpu" {
  type    = number
  default = 1
}

variable "etcd_memory" {
  type    = number
  default = 2048
}

variable "etcd_lmi" {
  type = string
}


# k8s_lb
variable "k8s_lb_node_names" {
  type    = set(string)
  default = []
}

variable "k8s_lb_vcpu" {
  type    = number
  default = 1
}

variable "k8s_lb_memory" {
  type    = number
  default = 1024
}

variable "k8s_lb_lmi" {
  type = string
}


# k8s_cp
variable "k8s_cp_node_names" {
  type    = set(string)
  default = []
}

variable "k8s_cp_vcpu" {
  type    = number
  default = 2
}

variable "k8s_cp_memory" {
  type    = number
  default = 2048
}

variable "k8s_cp_lmi" {
  type = string
}

# k8s_cp
variable "k8s_worker_node_names" {
  type    = set(string)
  default = []
}

variable "k8s_worker_vcpu" {
  type    = number
  default = 4
}

variable "k8s_worker_memory" {
  type    = number
  default = 4096
}

variable "k8s_worker_lmi" {
  type = string
}
