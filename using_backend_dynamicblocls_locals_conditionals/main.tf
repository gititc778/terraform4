resource "azurerm_resource_group" "rg" {
  name     = "mc_devops_rg"
  location = "UK South"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    owner  = "devops"
  lifecycle {
    create_before_destroy = true
  }
}

