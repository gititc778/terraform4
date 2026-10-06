# variable "vnet_name" {
#  type = string
#   description = "The name of the virtual network to be created."
#   # default     = "demo_vnet"
# }

# variable "address_space" {
#   type        = list(string)
#   description = "The address space for the virtual network."
#   # default     = ["10.0.0.0/16"]
# }

variable "vnet" {
  type = object({
    vnet_name = string
    address_space = list(string)    
  })
}



variable "rg_name" {}
variable "rg_location" {}


