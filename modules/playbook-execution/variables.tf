variable "az_resource_group" {
  description = "Which azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "install_cockpit" {
  description = "Flag to determine whether to install Cockpit on the host VM"
  default     = false
}

variable "install_xsa" {
  description = "Flag to determine whether to install XSA on the host VM"
  default     = false
}

variable "install_webide" {
  description = "Flag that determines whether to install WebIDE on the host"
  default     = false
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
  default     = ""
}

variable "pwd_db_xsaadmin" {
  description = "Password for XSAADMIN user"
  default     = ""
}

variable "sap_instancenum" {
  description = "The SAP instance number which is in range 00-99"
}

variable "sap_sid" {
  description = "The SAP system identifier"
}

variable "sshkey_path_private" {
  description = "The path on the local machine to where the private key is"
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

variable "url_sap_sapcar" {
  type        = "string"
  description = "The URL that points to the SAPCAR bits"
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

variable "hana1_db_mode" {
  description = "The database mode to use if deploying HANA 1. The acceptable values are: single_container, multiple_containers"
}

variable "vm_user" {
  description = "The username of your HANA database VM."
}

variable "vm_name" {
  description = "The hostname of the VM."
}

variable "ansible_targethost" {
  description = "The IP of the internal NIC of the created VM"
}

variable "fqdn" {
  description = "The domain for the xsa installation"
}

variable "nic_ip" {
  description = "The static or dynamic private IP of the VM"
}

variable "ansible_playbook_path" {
  description = "The path to the ansible playbook"
}

variable "luns_data" {
  description = "The LUNs for the data disks in Linux device format"
}

variable "luns_log" {
  description = "The LUNs for the log disks in Linux device format"
}

variable "luns_shared" {
  description = "The LUNs for the shared disks in Linux device format"
}