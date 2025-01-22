[postgresql]
%{ for hostname,ip in postgresql_nodes ~}
${hostname} ansible_host=${ip} ansible_port=22 ansible_user='${ssh_user}' ansible_ssh_private_key_file='${ssh_private_key_file}'
%{ endfor ~}

[odoo]
%{ for hostname,ip in odoo_nodes ~}
${hostname} ansible_host=${ip} ansible_port=22 ansible_user='${ssh_user}' ansible_ssh_private_key_file='${ssh_private_key_file}'
%{ endfor ~}
