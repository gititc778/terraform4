
# vnet
variable "vnet_name" {
  
}


variable "address_space" {
  
}

# storage account
variable "storage_account_name" {
  type = string

}


variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}



# aks

variable "aks_name" {
  type = string
}


variable "aks_dns_prefix" {
  type = string
}

variable "aks_kubernetes_version" {
  type = string
}

variable "aks_node_pool_name" {
  type = string
}

variable "aks_node_count" {
  type = number
}

variable "aks_vm_size" {
  type = string
}

variable "aks_identity_type" {
  type = string
}


