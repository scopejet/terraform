resource "azurerm_virtual_network" "vnet" {
for_each = var.vnet_variables
name = each.value["vnet_name"]
location = each.value["location"]
resource_group_name = each.value["resource_group_name"]
address_space = each.value["address_space"]

  
}
resource "azurerm_subnet" "internal" {
for_each = var.vnet_variables
  name                 = "internal"
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = each.value["vnet_name"]
  address_prefixes     = ["10.0.2.0/24"]
  depends_on = [ azurerm_virtual_network.vnet ]
}

