
data "azurerm_virtual_network" "vnet1" {
  name                = "tomi-demo-network"
  resource_group_name = "rg-devops-pmo-uks"
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet3"
  resource_group_name  = data.azurerm_virtual_network.vnet1.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.3.0/24"]
}