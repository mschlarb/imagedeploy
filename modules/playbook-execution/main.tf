# This is how we call Ansible and pass in variables from Terraform.
resource null_resource "automation-execution" {
  provisioner "local-exec" {
    command = <<EOT
    OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES \
    AZURE_RESOURCE_GROUPS="${var.az_resource_group}" \
    ANSIBLE_HOST_KEY_CHECKING="False" \
    ansible-playbook -i ${var.ansible_targethost}, \
    -u ${var.vm_user} \
    --private-key '${var.sshkey_path_private}' \
    --extra-vars="{ \"url_sapcar\": \"${var.url_sap_sapcar}\", \
     \"url_hdbserver\": \"${var.url_sap_hdbserver}\", \
     \"fqdn\": \"${var.fqdn}\", \
     \"sap_sid\": \"${var.sap_sid}\", \
     \"sap_instancenum\": \"${var.sap_instancenum}\", \
     \"pwd_os_sapadm\": \"${var.pw_os_sapadm}\", \
     \"pwd_os_sidadm\": \"${var.pw_os_sidadm}\", \
     \"pwd_db_system\": \"${var.pw_db_system}\", \
     \"resource_group\": \"${var.az_resource_group}\", \
     \"url_xsa_runtime\": \"${var.url_xsa_runtime}\", \
     \"url_xsa_monitoring\": \"${var.url_xsa_monitoring}\", \
     \"url_xsa_alm\": \"${var.url_xsa_alm}\", \
     \"url_xsa_ead\": \"${var.url_xsa_ead}\", \
     \"url_di_core\": \"${var.url_di_core}\", \
     \"url_sapui5\": \"${var.url_sapui5}\", \
     \"url_portal_services\": \"${var.url_portal_services}\", \
     \"url_xs_services\": \"${var.url_xs_services}\", \
     \"url_xsa_hrtt\": \"${var.url_xsa_hrtt}\", \
     \"url_xsa_webide\": \"${var.url_xsa_webide}\", \
     \"url_xsa_mta\": \"${var.url_xsa_mta}\", \
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
