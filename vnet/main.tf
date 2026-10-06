data "azurerm_resource_group" "rg1" {
  name = "rg-python-pmo-uks"
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  location            = "UK South"
  resource_group_name = data.azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/16"]
}