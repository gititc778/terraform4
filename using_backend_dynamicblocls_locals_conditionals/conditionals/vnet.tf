variable "environment" {
  type = string
  default = "dev"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.environment}"
  location            = "UK South"
  resource_group_name = "mc_devops_rg1"

  address_space = var.environment == "dev" ? ["10.0.0.0/16"] : ["10.1.0.0/16"]
}
