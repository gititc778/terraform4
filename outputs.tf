output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.subnet.address_prefixes[0]

}
