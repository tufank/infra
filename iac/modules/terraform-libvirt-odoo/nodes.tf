module "nodes" {
  for_each            = var.node_names
  source              = "../terraform-libvirt-node"
  hostname            = each.key
  vcpu                = var.vcpu
  memory              = var.memory
  lmi                 = var.lmi
  ssh_user            = var.ssh_user
  domain_name         = var.domain_name
  timezone            = var.timezone
  ssh_authorized_keys = var.ssh_authorized_keys
}

output "node_names_and_ips" {
  value = { for k, v in module.nodes : v.name => v.ip }
}
