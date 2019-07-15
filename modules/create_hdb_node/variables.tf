variable "machine_name" {
  description = "The name of the virtual machine"
}

variable "allow_ips" {
  description = "The IP addresses that will be allowed by the nsg"
  default     = ["0.0.0.0/0"]
}

variable "az_domain_name" {
  description = "Prefix to be used in the domain name"
}

variable "az_region" {}

variable "az_resource_group" {
  description = "Which Azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "install_cockpit" {
  description = "Flag that determines whether to install Cockpit on the host"
  default     = false
}

variable "install_xsa" {
  description = "Flag that determines whether to install XSA on the host"
  default     = false
}

variable "install_webide" {
  description = "Flag that determines whether to install WebIDE on the host"
  default     = false
}

variable "vnet_name" {
  description = "The name of the existing Vnet"
}

variable "vnet_subnet_name" {
  description = "The name of the first subnet"
  default = "default"
}

variable "private_ip_address" {
  description = "The desired private IP address of this HANA database.  If it isn't specified, a dynamic IP will be allocated."
  default = ""
}

variable "public_ip_allocation_type" {
  description = "Defines whether the IP address is static or dynamic. Options are Static or Dynamic."
  default     = "Dynamic"
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
  default     = [512, 512, 512]
}

variable "storage_disk_sizes_log" {
  description = "List disk sizes in GB for all HANA log disks"
  default     = [32, 32]
}

variable "storage_disk_sizes_shared" {
  description = "List disk sizes in GB for all HANA shared disks"
  default     = [512]
}

variable "write_accelerator" {
  description = "Whether or not you want to enable write accelerator for HANA log disks - this requires certain VM types"
  default = false
}

variable "zone" {
  description = "Specify the availability zone"
}

variable "url_cockpit" {
  description = "URL for HANA Cockpit"
  default     = ""
}

variable "url_di_core" {
  description = "URL for DI Core"
  default     = ""
}

variable "url_portal_services" {
  description = "URL for Portal Services"
  default     = ""
}

variable "url_sap_hdbserver" {
  type        = "string"
  description = "The URL that points to the HDB server 122.17 bits"
}

variable "url_sap_sapcar_linux" {
  description = "URL for SAPCAR for Linux to run on the bastion host"
  default     = ""
}

variable "url_sapui5" {
  description = "URL for SAPUI5"
  default     = ""
}

variable "url_xs_services" {
  description = "URL for XS Services"
  default     = ""
}

variable "url_xsa_runtime" {
  description = "URL for XSA runtime"
  default     = ""
}

variable "url_xsa_hrtt" {
  description = "URL for HRTT"
  default     = ""
}

variable "url_xsa_webide" {
  description = "URL for WebIDE"
  default     = ""
}

variable "url_xsa_mta" {
  description = "URL for MTA ext"
  default     = ""
}

variable "useHana2" {
  description = "If this is set to true, then, ports specifically for HANA 2.0 will be opened."
  default     = true
}

variable "vm_size" {
  default = "Standard_E8s_v3"
}

variable "vm_user" {
  description = "The username of your HANA database VM."
}

variable "proxy" {
  description = "The http and https proxy for downloading packages and SAP installation files."
}

variable "reg_user" {
  description = "The user for SUSE registration."
}

variable "reg_code" {
  description = "The registration key for SUSE registration."
}