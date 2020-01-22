
variable "az_region" {}

variable "az_resource_group_vm" {
  description = "Which Azure resource group to deploy the HANA VM into."
}

variable "az_resource_group_storage" {
  description = "Which Azure resource group does the storage account belong to."
}

variable "machine_name" {
  description = "The name for the VM that is being created."
}

variable "nic_id" {
  description = "The id of the network interface that should be associated with this VM."
}

variable "diag_storage" {
  description = "The name of the storage account to be used for boot diagnostics of the VM"
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

variable "tags" {
  type        = "map"
  description = "tags to add to the machine"
  default     = {}
}

variable "vm_size" {
  description = "The size of the VM to create."
}

variable "vm_user" {
  description = "The username of your VM."
}

variable "write_accelerator" {
  description = "Whether or not you want to enable write accelerator for HANA log disks - this requires certain VM types"
}

variable "zone" {
  description = "Specify the availability zone"
}