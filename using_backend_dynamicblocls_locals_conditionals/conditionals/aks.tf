variable "environment" {
  type = string
  default = "prod"
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.environment}"
  location            = "UK South"
  resource_group_name = "mc_devops_rg1"

  default_node_pool {
    name       = "system"
    node_count = var.environment == "dev" ? 1 : 3
    vm_size    = "Standard_D2s_v5"
  }

  identity {
    type = "SystemAssigned"
  }
}