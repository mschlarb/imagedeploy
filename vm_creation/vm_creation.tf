# Define AzureRM provider version
provider "azurerm" {
  version         = "1.28.0"
}

# Determine resource group
data "azurerm_resource_group" "rg" {
  name = "${var.rg_name}"
}

data "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  resource_group_name = "${var.rg_name}"
}

data "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name  = "${var.rg_name}"
}

data "azurerm_image" "custom" {
  name                = "${var.custom_image_name}"
  resource_group_name = "${var.rg_name}"
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                      = "${var.vm_name}-nic"
  location                  = "${data.azurerm_resource_group.rg.location}"
  resource_group_name       = "${data.azurerm_resource_group.rg.name}"
#  network_security_group_id = "${data.azurerm_subnet.subnet.network_security_group_id}"

  ip_configuration {
    name      = "${var.vm_name}-nic-configuration"
    subnet_id = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation           = "Static"
    private_ip_address                      = "${var.ip_address}"
  }

  tags = {
    autotag = "${var.tag}"
  }
}

# Create virtual machine from image
resource "azurerm_virtual_machine" "vm_from_image" {
  name                         = "${var.vm_name}"
  location                     = "${data.azurerm_resource_group.rg.location}"
  resource_group_name          = "${data.azurerm_resource_group.rg.name}"  
  network_interface_ids        = ["${azurerm_network_interface.nic.id}"]
  vm_size                      = "${var.vm_size}"

  storage_image_reference {
    id = "${data.azurerm_image.custom.id}"
  }

  storage_os_disk {
    name              = "${var.vm_name}-os"    
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  
  os_profile {
    computer_name      = "${var.vm_name}" 
    admin_username     = "${var.username}"
    admin_password     = "${var.password}"
  }

  os_profile_linux_config {
      disable_password_authentication = false
  }

  tags = {
      autotag = "${var.tag}"
  }

}
