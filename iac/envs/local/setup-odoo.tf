module "terraform-libvirt-postgresql" {
  source              = "../../modules/terraform-libvirt-postgresql"
  node_names          = var.postgresql_node_names
  vcpu                = var.postgresql_vcpu
  memory              = var.postgresql_memory
  lmi                 = var.postgresql_lmi
  ssh_user            = var.ssh_user
  domain_name         = var.domain_name
  timezone            = var.timezone
  ssh_authorized_keys = var.ssh_authorized_keys
}

module "terraform-libvirt-odoo" {
  source              = "../../modules/terraform-libvirt-odoo"
  node_names          = var.odoo_node_names
  vcpu                = var.odoo_vcpu
  memory              = var.odoo_memory
  lmi                 = var.odoo_lmi
  ssh_user            = var.ssh_user
  domain_name         = var.domain_name
  timezone            = var.timezone
  ssh_authorized_keys = var.ssh_authorized_keys
}

# generate inventory file for Ansible
resource "local_file" "odoo_hosts_cfg" {
  content = templatefile("${path.module}/ansible_hosts_odoo.tpl",
    {
      postgresql_nodes     = module.terraform-libvirt-postgresql.node_names_and_ips
      odoo_nodes           = module.terraform-libvirt-odoo.node_names_and_ips
      ssh_user             = var.ssh_user
      ssh_private_key_file = var.ssh_private_key_file
    }
  )
  filename = "../../../ansible/envs/local/terraform-hosts-odoo"
}

output "odoo_nodes" {
  value = [
    module.terraform-libvirt-postgresql.node_names_and_ips,
    module.terraform-libvirt-odoo.node_names_and_ips
  ]
}
