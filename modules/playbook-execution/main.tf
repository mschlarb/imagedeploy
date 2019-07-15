# This is how we call Ansible and pass in variables from Terraform.
resource null_resource "mount-disks-and-configure-hana" {
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
     \"use_hana2\": ${var.useHana2}, \
     \"hana1_db_mode\": \"${var.hana1_db_mode}\", \
     \"resource_group\": \"${var.az_resource_group}\", \
     \"url_xsa_runtime\": \"${var.url_xsa_runtime}\", \
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
     \"install_cockpit\": ${var.install_cockpit}, \
     \"install_webide\": ${var.install_webide}, \
     \"nic_ip\": \"${var.nic_ip}\", \
     \"vm_name\": \"${var.vm_name}\", \
     \"luns_data\": ${var.luns_data}, \
     \"luns_log\": ${var.luns_log}, \
     \"luns_shared\": ${var.luns_shared}, \
     \"proxy\": \"${var.proxy}\", \
     \"reg_user\": \"${var.reg_user}\", \
     \"reg_code\": \"${var.reg_code}\", \
     \"url_cockpit\": \"${var.url_cockpit}\" }" \
     ${var.ansible_playbook_path}
     EOT
  }
}
