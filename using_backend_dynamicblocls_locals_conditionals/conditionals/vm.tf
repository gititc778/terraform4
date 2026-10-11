variable "environment" {
  default = "dev"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm01"
  resource_group_name = "trainingAzure"
  location            = "eastus"
  size                = var.environment == "prod" ? "Standard_B4ms" : "Standard_B1s"   //If var.environment is "prod", use "Standard_B4ms", otherwise use "Standard_B1s".
  admin_username      = "azureuser"                                                 
  disable_password_authentication = false
  admin_password      = "Str0ngP@ssword123!"

  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
