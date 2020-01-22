output "machine_hostname" {
  value = "${module.vm_and_disk_creation.machine_hostname}"
}

output "ansible_targethost" {
  value = "${module.nic_and_pip_setup.nic_ip}"
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

output "az_resource_group_vm" {
  value = "${var.az_resource_group_vm}"
}

output "az_resource_group_net" {
  value = "${var.az_resource_group_net}"
}

output "az_resource_group_storage" {
  value = "${var.az_resource_group_storage}"
}

output "install_xsa" {
  value = "${var.install_xsa}"
}

output "fqdn" {
  value = var.public_ip ? module.nic_and_pip_setup.fqdn : "${var.machine_name}.${var.az_domain_name}"
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

output "url_prefix" {
  value = var.url_prefix
}

output "file_sapcar" {
  value = var.file_sapcar
}

output "file_hdbserver" {
  value = var.file_hdbserver
}

output "file_xsa" {
  value = var.file_xsa
}

output "list_xsa_files" {
  value = var.list_xsa_files
}

output "list_xsa_components" {
  value = var.list_xsa_components
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