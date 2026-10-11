variable "environment" {
  type = string
  default = "prod"
}

locals {
  vm_size              = var.environment == "prod" ? "Standard_D4s_v5" : "Standard_D2s_v5"
  storage_account_type = var.environment == "prod" ? "Premium_LRS" : "Standard_LRS"
  disk_size            = var.environment == "prod" ? 128 : 64
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-${var.environment}"
  location            = "UK South"
  resource_group_name = "rg-${var.environment}"

  size = local.vm_size   #"Standard_D4s_v5"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = local.storage_account_type  #"Premium_LRS"
    disk_size_gb         = local.disk_size #128
  }
}