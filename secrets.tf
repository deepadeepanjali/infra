locals {
foldername_nw = replace(var.foldername, "_", "-")
}


module "keyvault-secret-rbac" {
  source = "git::https://github.com/deepadeepanjali/tfmodule-azurerm-resource-kvsecret.git?ref=main"
  for_each = var.config
  secretname = "secret-${local.foldername_nw}-${each.value.botname}"
  secretvalue = "123"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
