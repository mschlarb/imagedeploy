# Create public IPs
resource "azurerm_public_ip" "pip" {
  count                        = var.public_ip ? 1 : 0
  name                         = "${var.name}-pip"
  location                     = var.az_region
  resource_group_name          = var.az_resource_group_vm
  allocation_method            = local.dynamic
  domain_name_label            = "${lower(var.name)}-${lower(var.az_domain_name)}"
  zones                        = var.zone
  idle_timeout_in_minutes = 30
}

# Create network interface
resource "azurerm_network_interface" "nic" {
#  depends_on                = ["azurerm_public_ip.pip"]
  name                      = "${var.name}-nic"
  location                  = var.az_region
  resource_group_name       = var.az_resource_group_vm

  ip_configuration {
    name      = "${var.name}-nic-configuration"
    subnet_id = var.subnet_id

    private_ip_address_allocation           = var.private_ip_address != local.empty_string ? local.static : local.dynamic
    private_ip_address                      = var.private_ip_address
    public_ip_address_id                    = var.public_ip ? azurerm_public_ip.pip[0].id : null
  }
}
