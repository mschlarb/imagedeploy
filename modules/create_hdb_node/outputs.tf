output "machine_hostname" {
  value = "${module.vm_and_disk_creation.machine_hostname}"
}

output "ansible_targethost" {
  value = "${module.nic_and_pip_setup.nic_ip}"
}

output "fqdn" {
  value = "${var.machine_name}.${var.az_domain_name}"
}

output "hdb_vm_user" {
  value = "${var.vm_user}"
}

output "machine_name" {
  value = "${var.machine_name}"
}

output "sshkey_path_private" {
  value = "${var.sshkey_path_private}"
}

output "sshkey_path_public" {
  value = "${var.sshkey_path_public}"
}

output "az_resource_group" {
  value = "${var.az_resource_group}"
}

output "install_xsa" {
  value = "${var.install_xsa}"
}

output "az_domain_name" {
  value = "Prefix to be used in the domain name"
}

output "az_region" {
  value = "${var.az_region}"
}

output "vnet_name" {
  value = "${var.vnet_name}"
}

output "vnet_subnet_name" {
  value = "${var.vnet_subnet_name}"
}

output "private_ip_address" {
  value = "${module.nic_and_pip_setup.nic_ip}"
}

output "pw_db_system" {
  value = "${var.pw_db_system}"
#  sensitive = true
}

output "pw_os_sapadm" {
  value = "${var.pw_os_sapadm}"
#  sensitive = true
}

output "pw_os_sidadm" {
  value = "${var.pw_os_sidadm}"
#  sensitive = true
}

output "pwd_db_tenant" {
  value = "${var.pwd_db_tenant}"
#  sensitive = true
}

output "pwd_db_xsaadmin" {
  value = "${var.pwd_db_xsaadmin}"
#  sensitive = true
}

output "sap_instancenum" {
  value = "${var.sap_instancenum}"
}

output "sap_sid" {
  value = "${var.sap_sid}"
}

output "storage_disk_sizes_data" {
  value = "${var.storage_disk_sizes_data}"
}

output "storage_disk_sizes_log" {
  value = "${var.storage_disk_sizes_log}"
}

output "storage_disk_sizes_shared" {
  value = "${var.storage_disk_sizes_shared}"
}

output "write_accelerator" {
  value = "${var.write_accelerator}"
}

output "zone" {
  value = "${var.zone}"
}

output "url_di_core" {
  value = "${var.url_di_core}"
}

output "url_portal_services" {
  value = "${var.url_portal_services}"
}

output "url_sap_hdbserver" {
  value = "${var.url_sap_hdbserver}"
}

output "url_sap_sapcar_linux" {
  value = "${var.url_sap_sapcar_linux}"
}

output "url_sapui5" {
  value = "${var.url_sapui5}"
}

output "url_xs_services" {
  value = "${var.url_xs_services}"
}

output "url_xsa_runtime" {
  value = "${var.url_xsa_runtime}"
}

output "url_xsa_hrtt" {
  value = "${var.url_xsa_hrtt}"
}

output "url_xsa_webide" {
  value = "${var.url_xsa_webide}"
}

output "url_xsa_mta" {
  value = "${var.url_xsa_mta}"
}

output "vm_size" {
  value = "${var.vm_size}"
}

output "vm_user" {
  value = "${var.vm_user}"
}

output "luns_data" {
  value = "${module.vm_and_disk_creation.luns_data}"
}

output "luns_log" {
  value = "${module.vm_and_disk_creation.luns_log}"
}

output "luns_shared" {
  value = "${module.vm_and_disk_creation.luns_shared}"
}