

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
  tags = {
    environment = "dev"
    owner       = "devops_team"
  }
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet.address_space
}


resource "azurerm_subnet" "subnet" {
  name                 = "subnet_demo"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


