resource "azurerm_storage_account" "sa1" {
  name                     = "1hirenadlsmay2026"
  resource_group_name      = "rg-dataeng-training-uks"
  location                 = "UK South"

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  is_hns_enabled  = true
  local_user_enabled = true

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_0"

  allow_nested_items_to_be_public = false

  tags =    {
    environment = "dev"
    owner       = "devops_team"
  }
}
