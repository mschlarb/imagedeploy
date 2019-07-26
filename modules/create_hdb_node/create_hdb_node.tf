provider "azurerm" {
  version = "~> 1.30.1"
}

data "azurerm_subnet" "subnet" {
  name                 = var.vnet_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.az_resource_group
}

module "nic_and_pip_setup" {
  source = "../generic_nic_and_pip"
  az_resource_group         = var.az_resource_group
  az_region                 = var.az_region
  az_domain_name            = var.az_domain_name
  name                      = var.machine_name
  subnet_id                 = data.azurerm_subnet.subnet.id
  private_ip_address        = var.private_ip_address
  public_ip                 = var.public_ip
  zone                      = var.zone
}

module "vm_and_disk_creation" {
  source = "../generic_vm_and_disk_creation"
  sshkey_path_public        = var.sshkey_path_public
  az_resource_group         = var.az_resource_group
  az_region                 = var.az_region
  storage_disk_sizes_data   = var.storage_disk_sizes_data
  storage_disk_sizes_log    = var.storage_disk_sizes_log
  storage_disk_sizes_shared = var.storage_disk_sizes_shared
  write_accelerator         = var.write_accelerator
  zone                      = var.zone
  machine_name              = var.machine_name
  vm_user                   = var.vm_user
  vm_size                   = var.vm_size
  nic_id                    = module.nic_and_pip_setup.nic_id
  diag_storage              = var.diag_storage
}

module "ansible" {
  source                   = "../playbook-execution"
  ansible_targethost       = var.public_ip ? module.nic_and_pip_setup.fqdn : module.nic_and_pip_setup.nic_ip
  fqdn                     = var.public_ip ? module.nic_and_pip_setup.fqdn : var.az_domain_name
  vm_name                  = module.vm_and_disk_creation.machine_hostname
  ansible_playbook_path    = "../../ansible/hanainst.yml"
  az_resource_group        = var.az_resource_group
  sshkey_path_private      = var.sshkey_path_private
  sap_instancenum          = var.sap_instancenum
  sap_sid                  = var.sap_sid
  vm_user                  = var.vm_user
  url_prefix               = var.url_prefix
  file_sapcar              = var.file_sapcar
  file_hdbserver           = var.file_hdbserver
  file_xsa                 = var.file_xsa
  list_xsa_files           = jsonencode(var.list_xsa_files)
  list_xsa_components      = var.list_xsa_components
  pw_os_sapadm             = var.pw_os_sapadm
  pw_os_sidadm             = var.pw_os_sidadm
  pw_db_system             = var.pw_db_system
  pwd_db_xsaadmin          = var.pwd_db_xsaadmin
  pwd_db_tenant            = var.pwd_db_tenant
  install_xsa              = var.install_xsa
  nic_ip                   = module.nic_and_pip_setup.nic_ip
  public_ip                = var.public_ip
  luns_data                = jsonencode(module.vm_and_disk_creation.luns_data)
  luns_log                 = jsonencode(module.vm_and_disk_creation.luns_log)
  luns_shared              = jsonencode(module.vm_and_disk_creation.luns_shared)
}