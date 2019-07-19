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

variable "url_di_core" {
  description = "URL for DI Core"
}

variable "url_portal_services" {
  description = "URL for Portal Services"
}

variable "url_sap_hdbserver" {
  description = "The URL that points to the HDB server 122.17 bits"
}

variable "url_sap_sapcar_linux" {
  description = "URL for SAPCAR for Linux to run on the bastion host"
}

variable "url_xsa_monitoring" {
  description = "URL for XSA Monitoring"
}

variable "url_xsa_alm" {
  description = "URL for XS Advanced Application Lifecycle Management xsac_alm_pi_ui"
}

variable "url_xsa_ead" {
  description = "URL for Enterprise Architecture Designer xsac_hana_ea_d"
}

variable "url_sapui5" {
  description = "URL for SAPUI5"
}

variable "url_xs_services" {
  description = "URL for XS Services"
}

variable "url_xsa_runtime" {
  description = "URL for XSA runtime"
}

variable "url_xsa_hrtt" {
  description = "URL for HRTT"
}

variable "url_xsa_webide" {
  description = "URL for WebIDE"
}

variable "url_xsa_mta" {
  description = "URL for MTA ext"
}

variable "vm_size" {
  description = "Size of the VM to be deployed"
}

variable "vm_user" {
  description = "The username of your HANA database VM."
}
