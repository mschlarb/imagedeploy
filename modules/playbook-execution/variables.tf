variable "az_resource_group" {
  description = "Which azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "install_xsa" {
  description = "Flag to determine whether to install XSA on the host VM"
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
}

variable "list_xsa_files" {
  description = "A list of filenames for XSA components"
}

variable "list_xsa_components" {
  description = "A list of component names"
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
