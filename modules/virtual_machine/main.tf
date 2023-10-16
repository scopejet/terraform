resource "azurerm_windows_virtual_machine" "vm1" {
  for_each = var.virtual_machine_variables
  name                  = each.value["vm_name"]
  location              = each.value["location"]
  resource_group_name   = each.value["resource_group_name"]
 size               = each.value["vm_size"]

  os_disk {
    name              = "VM1_os_disk"
    caching           = each.value["os_disk"]["caching"]
    storage_account_type = each.value["os_disk"]["storage_account_type"]
  }

  source_image_reference {
    publisher = each.value["source_image_reference"]["publisher"]
    offer     = each.value["source_image_reference"]["offer"]
    sku       = each.value["source_image_reference"]["sku"]
    version   = each.value["source_image_reference"]["version"]
  }
  admin_username = each.value["admin_username"]
  admin_password = each.value["admin_password"]
  network_interface_ids = [azurerm_network_interface.main[each.key].id]

  }

  data "azurerm_subnet" "internal" {
  for_each = var.virtual_machine_variables
  name                 = each.value["subnet_name"]
  virtual_network_name = each.value["vnet_name"]
  resource_group_name  = each.value["vnet_rg"]
}

resource "azurerm_network_interface" "main" {
  for_each = var.virtual_machine_variables
  name                = "vm1-nic"
  location            = each.value["location"]
  resource_group_name = each.value["resource_group_name"]
  

  ip_configuration {
    
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.internal[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
    
}
