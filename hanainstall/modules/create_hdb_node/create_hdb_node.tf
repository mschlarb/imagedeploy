provider "azurerm" {}

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
