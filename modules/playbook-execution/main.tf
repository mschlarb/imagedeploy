# This is how we call Ansible and pass in variables from Terraform.
resource null_resource "automation-execution" {
  provisioner "local-exec" {
    command = <<EOT
    OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES \
    AZURE_RESOURCE_GROUPS="${var.az_resource_group_vm}" \
    ANSIBLE_HOST_KEY_CHECKING="False" \
    ansible-playbook -i ${var.ansible_targethost}, \
    -u ${var.vm_user} \
    --private-key '${var.sshkey_path_private}' \
    --extra-vars="{ \"file_sapcar\": \"${var.file_sapcar}\", \
     \"file_hdbserver\": \"${var.file_hdbserver}\", \
     \"file_xsa\": \"${var.file_xsa}\", \
     \"url_prefix\": \"${var.url_prefix}\", \
     \"list_xsa_files\": ${var.list_xsa_files}, \
     \"list_xsa_components\": \"${var.list_xsa_components}\", \
     \"fqdn\": \"${var.fqdn}\", \
     \"public_ip\": ${var.public_ip}, \
     \"sap_sid\": \"${var.sap_sid}\", \
     \"sap_instancenum\": \"${var.sap_instancenum}\", \
     \"pwd_os_sapadm\": \"${var.pw_os_sapadm}\", \
     \"pwd_os_sidadm\": \"${var.pw_os_sidadm}\", \
     \"pwd_db_system\": \"${var.pw_db_system}\", \
     \"resource_group\": \"${var.az_resource_group}\", \
     \"pwd_db_xsaadmin\": \"${var.pwd_db_xsaadmin}\", \
     \"pwd_db_tenant\": \"${var.pwd_db_tenant}\", \
     \"install_xsa\": ${var.install_xsa}, \
     \"nic_ip\": \"${var.nic_ip}\", \
     \"vm_name\": \"${var.vm_name}\", \
     \"luns_data\": ${var.luns_data}, \
     \"luns_log\": ${var.luns_log}, \
     \"luns_shared\": ${var.luns_shared} }" \
     ${var.ansible_playbook_path}
     EOT
  }
}
