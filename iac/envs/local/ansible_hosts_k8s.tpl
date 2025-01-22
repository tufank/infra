[etcd]
%{ for hostname,ip in etcd_nodes ~}
${hostname} ansible_host=${ip} ansible_port=22 ansible_user='${ssh_user}' ansible_ssh_private_key_file='${ssh_private_key_file}'
%{ endfor ~}
