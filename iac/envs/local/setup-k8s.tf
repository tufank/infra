module "terraform-libvirt-etcd" {
  source              = "../../modules/terraform-libvirt-etcd"
  node_names          = var.etcd_node_names
  vcpu                = var.etcd_vcpu
  memory              = var.etcd_memory
  lmi                 = var.etcd_lmi
  ssh_user            = var.ssh_user
  domain_name         = var.domain_name
  timezone            = var.timezone
  ssh_authorized_keys = var.ssh_authorized_keys
}

# generate inventory file for Ansible
resource "local_file" "etcd_hosts_cfg" {
  content = templatefile("${path.module}/ansible_hosts_k8s.tpl",
    {
      etcd_nodes           = module.terraform-libvirt-etcd.node_names_and_ips
      ssh_user             = var.ssh_user
      ssh_private_key_file = var.ssh_private_key_file
    }
  )
  filename = "../../../ansible/envs/local/terraform-hosts-k8s"
}

output "etcd_nodes" {
  value = [
    module.terraform-libvirt-etcd.node_names_and_ips,
  ]
}
