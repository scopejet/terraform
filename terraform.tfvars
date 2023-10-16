vnet_variables = {
  "myvnet" = {
  vnet_name = "myvnet"
  location = "centralindia"
  resource_group_name = "Embee-KANTHARAJU-RG"
  address_space = ["10.0.0.0/16"]

}
}
virtual_machine_variables = {
  "vm1" = {
  vm_name = "vm1"
  name = "vm1"
  location = "centralindia"
  resource_group_name = "Embee-KANTHARAJU-RG"
  vm_size = "Standard_D2s_v3"
  admin_username = "azureuser"
  admin_password = "sonata@123"
  source_image_reference ={
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-Datacenter"
    version = "latest"
    }
  os_disk = {
    name = "vm1_os_disk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
} 
  
 
  subnet_name = "internal"
  vnet_name = "myvnet"
  vnet_rg = "Embee-KANTHARAJU-RG" 
  
  } 

}