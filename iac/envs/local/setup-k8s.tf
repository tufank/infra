module "terraform-libvirt-etcd" {
  source              = "../../modules/terraform-libvirt-cluster"
  node_names          = var.etcd_node_names
  vcpu                = var.etcd_vcpu
  memory              = var.etcd_memory
  lmi                 = var.etcd_lmi
  ssh_user            = var.ssh_user
  domain_name         = var.domain_name
  timezone            = var.timezone
  ssh_authorized_keys = var.ssh_authorized_keys
}

module "terraform-libvirt-k8s_lb" {
  source              = "../../modules/terraform-libvirt-cluster"
  node_names          = var.k8s_lb_node_names
  vcpu                = var.k8s_lb_vcpu
  memory              = var.k8s_lb_memory
  lmi                 = var.k8s_lb_lmi
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
      k8s_lb_nodes         = module.terraform-libvirt-k8s_lb.node_names_and_ips
      ssh_user             = var.ssh_user
      ssh_private_key_file = var.ssh_private_key_file
    }
  )
  filename = "../../../ansible/envs/local/terraform-hosts-k8s"
}

output "k8s_nodes" {
  value = [
    module.terraform-libvirt-etcd.node_names_and_ips,
    module.terraform-libvirt-k8s_lb.node_names_and_ips,

  ]
}
