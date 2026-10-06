data "azurerm_storage_account" "sa1" {
  name                     = "1hirenadlsmay2026"
  resource_group_name      = "rg-dataeng-training-uks"
}

resource "azurerm_storage_container" "sa1" {
  name                  = "devops-container1"
  storage_account_id  = data.azurerm_storage_account.sa1.id
  container_access_type = "private"
}

