locals {
  vm_size              = var.environment == "prod" ? "Standard_D4s_v5" : "Standard_D2s_v5"
  storage_account_type = var.environment == "prod" ? "Premium_LRS" : "Standard_LRS"
  disk_size            = var.environment == "prod" ? 128 : 64
}