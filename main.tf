provider "azurerm" {
    features {
      }
  
}

terraform {
    backend "azurerm" {
    resource_group_name = "Embee-KANTHARAJU-RG"
    storage_account_name = "jartank"
    container_name = "terraformbackend"
    key = "RgadWnxiYelr1FWA3oYRfUUUH1hIZLS8VUGqe/Liuo4meHHxwSgoN5hPCNkqgRCLlXPGqwguj5Wn+AStjGlEqA=="
      
    }
}
module "virtual_network" {
    source = "./modules/virtual_network"
    vnet_variables = var.vnet_variables
    
}
module "virtual_machine" {
    source = "./modules/virtual_machine"
    virtual_machine_variables = var.virtual_machine_variables
      depends_on = [module.virtual_network]
 

  
}
