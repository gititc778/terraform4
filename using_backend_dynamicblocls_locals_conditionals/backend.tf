terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dataeng-training-uks"
    storage_account_name = "1hirenadlsmay2026"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}