variable "nsg_rules" {
  type = list(object({
    name             = string
    priority         = number
    direction        = string
    access           = string
    protocol         = string
    destination_port = string
  }))
}

resource "azurerm_network_security_group" "nsg" {
  name                = "frontend-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  dynamic "security_rule" {
    for_each = var.nsg_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}