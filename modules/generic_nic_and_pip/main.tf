# Create network interface
resource "azurerm_network_interface" "nic" {
  name                      = "${var.name}-nic"
  location                  = "${var.az_region}"
  resource_group_name       = "${var.az_resource_group}"

  ip_configuration {
    name      = "${var.name}-nic-configuration"
    subnet_id = "${var.subnet_id}"

    private_ip_address_allocation           = "${var.private_ip_address != local.empty_string ? local.static : local.dynamic}"
    private_ip_address                      = "${var.private_ip_address}"
  }

  tags = {
    environment = "Terraform SAP HANA deployment"
  }
}
