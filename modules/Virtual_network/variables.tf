variable "vnet_variables" {
    type = map(object({
    vnet_name = string
    location = string
    address_space = list(string)
    resource_group_name = string
    }))
  default = {}

}