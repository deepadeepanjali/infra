variable "keyvault" {
  description = "Name of keyvault"
  type        = string
}

variable "resourcegroup" {
  description = "The resource group of the Key Vault"
  type        = string
}

variable "config" {
  type = map(object({
    botname    = string
    foldername = string
    kv_secret_rbac = map(object({
      object_id = string
      role_name = string
    }))
  }))
  description = "Configuration for bot and key vault secret RBAC roles"
}

