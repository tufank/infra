[k8s_etcd]
%{ for hostname,ip in etcd_nodes ~}
${hostname} ansible_host=${ip} ansible_port=22 ansible_user='${ssh_user}' ansible_ssh_private_key_file='${ssh_private_key_file}'
%{ endfor ~}

[k8s_lb]
%{ for hostname,ip in k8s_lb_nodes ~}
${hostname} ansible_host=${ip} ansible_port=22 ansible_user='${ssh_user}' ansible_ssh_private_key_file='${ssh_private_key_file}'
%{ endfor ~}

[k8s_cp]
%{ for hostname,ip in k8s_cp_nodes ~}
${hostname} ansible_host=${ip} ansible_port=22 ansible_user='${ssh_user}' ansible_ssh_private_key_file='${ssh_private_key_file}'
%{ endfor ~}

[k8s_worker]
%{ for hostname,ip in k8s_worker_nodes ~}
${hostname} ansible_host=${ip} ansible_port=22 ansible_user='${ssh_user}' ansible_ssh_private_key_file='${ssh_private_key_file}'
%{ endfor ~}

[k8s:children]
k8s_etcd
k8s_cp
k8s_worker
