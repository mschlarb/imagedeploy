provider "azurerm" {
  version = "~> 1.30.1"
}

data "azurerm_subnet" "subnet" {
  name                 = "${var.vnet_subnet_name}"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name  = "${var.az_resource_group}"
}


module "nic_and_pip_setup" {
  source = "../generic_nic_and_pip"

  az_resource_group         = "${var.az_resource_group}"
  az_region                 = "${var.az_region}"
  az_domain_name            = "${var.az_domain_name}"
  name                      = "${var.machine_name}"
  nsg_id                    = "${data.azurerm_subnet.subnet.network_security_group_id}"
  subnet_id                 = "${data.azurerm_subnet.subnet.id}"
  private_ip_address        = "${var.private_ip_address}"
  public_ip_allocation_type = "${var.public_ip_allocation_type}"
  zone                      = "${var.zone}"
}

module "vm_and_disk_creation" {
  source = "../generic_vm_and_disk_creation"
  sshkey_path_public        = "${var.sshkey_path_public}"
  az_resource_group         = "${var.az_resource_group}"
  az_region                 = "${var.az_region}"
  storage_disk_sizes_data   = "${var.storage_disk_sizes_data}"
  storage_disk_sizes_log    = "${var.storage_disk_sizes_log}"
  storage_disk_sizes_shared = "${var.storage_disk_sizes_shared}"
  write_accelerator         = "${var.write_accelerator}"
  zone                      = "${var.zone}"
  machine_name              = "${var.machine_name}"
  vm_user                   = "${var.vm_user}"
  vm_size                   = "${var.vm_size}"
  nic_id                    = "${module.nic_and_pip_setup.nic_id}"
}

module "configure_vm" {
  source                   = "../playbook-execution"
  ansible_targethost       = "${module.nic_and_pip_setup.nic_ip}"
  fqdn                     = "${var.machine_name}.${var.az_domain_name}"
  ansible_playbook_path    = "../../ansible/hanainst.yml"
  az_resource_group        = "${var.az_resource_group}"
  sshkey_path_private      = "${var.sshkey_path_private}"
  sap_instancenum          = "${var.sap_instancenum}"
  sap_sid                  = "${var.sap_sid}"
  vm_user                  = "${var.vm_user}"
  url_sap_sapcar           = "${var.url_sap_sapcar_linux}"
  url_sap_hdbserver        = "${var.url_sap_hdbserver}"
  pw_os_sapadm             = "${var.pw_os_sapadm}"
  pw_os_sidadm             = "${var.pw_os_sidadm}"
  pw_db_system             = "${var.pw_db_system}"
  useHana2                 = "${var.useHana2}"
  vm_name                  = "${module.vm_and_disk_creation.machine_hostname}"
  hana1_db_mode            = "${var.hana1_db_mode}"
  url_xsa_runtime          = "${var.url_xsa_runtime}"
  url_di_core              = "${var.url_di_core}"
  url_sapui5               = "${var.url_sapui5}"
  url_portal_services      = "${var.url_portal_services}"
  url_xs_services          = "${var.url_xs_services}"
  url_xsa_hrtt             = "${var.url_xsa_hrtt}"
  url_xsa_webide           = "${var.url_xsa_webide}"
  url_xsa_mta              = "${var.url_xsa_mta}"
  pwd_db_xsaadmin          = "${var.pwd_db_xsaadmin}"
  pwd_db_tenant            = "${var.pwd_db_tenant}"
  install_xsa              = "${var.install_xsa}"
  install_cockpit          = "${var.install_cockpit}"
  install_webide           = "${var.install_webide}"
  url_cockpit              = "${var.url_cockpit}"
  nic_ip                   = "${module.nic_and_pip_setup.nic_ip}"
  luns_data                = jsonencode(module.vm_and_disk_creation.luns_data)
  luns_log                 = jsonencode(module.vm_and_disk_creation.luns_log)
  luns_shared              = jsonencode(module.vm_and_disk_creation.luns_shared)
}