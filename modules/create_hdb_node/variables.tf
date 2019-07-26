variable "machine_name" {
  description = "The name of the virtual machine"
}

variable "az_domain_name" {
  description = "Prefix to be used in the domain name"
}

variable "az_region" {
  description = "Azure region to deploy resource in"
}

variable "az_resource_group" {
  description = "Which Azure resource group to deploy the HANA setup into."
}

variable "install_xsa" {
  description = "Flag that determines whether to install XSA on the host"
}

variable "vnet_name" {
  description = "The name of the existing Vnet"
}

variable "vnet_subnet_name" {
  description = "The name of the first subnet"
  default = "default"
}

variable "diag_storage" {
  description = "The name of the storage account to be used for boot diagnostics of the VM"
}

variable "private_ip_address" {
  description = "The desired private IP address of this HANA database.  If it isn't specified, a dynamic IP will be allocated."
  default = ""
}

variable "pw_db_system" {
  description = "Password for the database user SYSTEM"
}

variable "pw_os_sapadm" {
  description = "Password for the SAP admin, which is an OS user"
}

variable "pw_os_sidadm" {
  description = "Password for this specific sidadm, which is an OS user"
}

variable "pwd_db_tenant" {
  description = "Password for SYSTEM user (tenant DB)"
}

variable "pwd_db_xsaadmin" {
  description = "Password for XSAADMIN user"
}

variable "sap_instancenum" {
  description = "The sap instance number which is in range 00-99"
}

variable "sap_sid" {
  description = "The SID of the SAP system"
}

variable "sshkey_path_private" {
  description = "The path on the local machine to where the private key is"
}

variable "sshkey_path_public" {
  description = "The path on the local machine to where the public key is"
}

variable "storage_disk_sizes_data" {
  description = "List disk sizes in GB for all HANA data disks"
}

variable "storage_disk_sizes_log" {
  description = "List disk sizes in GB for all HANA log disks"
}

variable "storage_disk_sizes_shared" {
  description = "List disk sizes in GB for all HANA shared disks"
}

variable "write_accelerator" {
  description = "Whether or not you want to enable write accelerator for HANA log disks - this requires certain VM types"
}

variable "zone" {
  description = "Specify the availability zone"
  default = null
}

variable "url_prefix" {
  description = "URL prefix for all downloads"
}

variable "file_sapcar" {
  description = "Filename for SAPCAR for Linux to run on the bastion host"
}

variable "file_hdbserver" {
  description = "Filename for HANA DB installation"
}

variable "file_xsa" {
  description = "Filename for XSA installation"
  default = ""
}

variable "list_xsa_files" {
  description = "A list of filenames for XSA components"
  default = [""]
}

variable "list_xsa_components" {
  description = "A list of component names"
  default = ""
}

variable "vm_size" {
  description = "Size of the VM to be deployed"
}

variable "vm_user" {
  description = "The username of your HANA database VM."
}

variable "public_ip" {
  description = "If the VM should have a public IP"
}
