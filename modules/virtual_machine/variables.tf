variable "virtual_machine_variables" {
  description = "Configuration for the virtual machine module"
  type        = map(object({
    name              = string
    location       = string
    resource_group_name = string
    vm_name           = string
    vm_size           = string
    admin_username = string
    admin_password = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    os_disk = object({
     name = string
    caching = string
    storage_account_type = string
    }) 
    subnet_name = string
    vnet_name = string
    vnet_rg = string
  }))
    default = {}
}
