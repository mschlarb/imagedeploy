variable "az_region" {}

variable "az_resource_group" {
  description = "Which Azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "az_domain_name" {
  description = "Prefix to be used in the domain name"
}

variable "name" {
  description = "A name that will be used to identify the resource this NIC and PIP are related to."
}

variable "private_ip_address" {
  description = "The desired private IP address of this NIC.  If it isn't specified, a dynamic IP will be allocated."
  default     = ""
}

variable "subnet_id" {
  description = "The subnet that this node needs to be on"
}

variable "zone" {
  description = "Specify the availability zone"
}

variable "public_ip" {
  description = "If the VM should have a public IP"
}

locals {
  dynamic      = "Dynamic"
  empty_string = ""
  static       = "Static"
}
