variable "vnet_variables" {
type = map(object({
    vnet_name = string
    location = string
    resource_group_name = string
    address_space = list(string)

}))
    default = { }
}
variable "virtual_machine_variables" {
    type = map(object({
      location = string
      name = string
      resource_group_name = string
      vm_name = string
      vm_size = string
      admin_password = string
      admin_username = string
    source_image_reference = object({
    publisher = string
    offer = string
    sku = string
    version = string

    })
     os_disk = object ({
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