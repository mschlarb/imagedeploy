
variable "rg_name" {
  description = "The name of the existing Resource Group"
}

variable "vnet_name" {
  description = "The name of the existing Virtual Network"
}

variable "subnet_name" {
  description = "The name of the existing Subnet"
}

variable "vm_name" {
  description = "The name of the Virtual Machine"
}

variable "ip_address" {
  description = "The static IP address of the Virtual Machine"
}

variable "tag" {
  description = "The autotag name"
}
variable "vm_size" {
  description = "The size of the Virtual Machine"
}

variable "custom_image_name" {
  description = "The name of the custom image to provision this Virtual Machine from"
}

variable "username" {
  description = "The username for initial login"
}

variable "password" {
  description = "The password for initial login"
}
