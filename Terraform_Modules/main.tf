resource "azurerm_resource_group" "rg" {
  name     = "mc_dev_rg"
  location = "UK South"
}

module "vnet" {
  source = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  vnet_name = var.vnet_name
  address_space = var.address_space
}

module "storageaccount" {
  source = "./modules/storageaccount"
  storage_account_name = var.storage_account_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
}

# module "aks" {
#   source = "./modules/aks"

#   name                = var.aks_name
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   dns_prefix          = var.aks_dns_prefix
#   kubernetes_version  = var.aks_kubernetes_version
#   node_pool_name      = var.aks_node_pool_name
#   node_count          = var.aks_node_count
#   vm_size             = var.aks_vm_size
#   identity_type       = var.aks_identity_type
# }


module "aks" {
  source  = "Azure/aks/azurerm"
  version = "11.7.0"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}