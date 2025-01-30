variable "keyvault" {
  description = "Name of keyvault"
  type        = string
}

variable "resourcegroup" {
  description = "The resource group of the Key Vault"
  type        = string
}

variable "kv_rbac" {
  description = "Map of rbacc config for keyvault"
  type = map(object({
    object_id     = string
    role_name    = string
  }))
}

