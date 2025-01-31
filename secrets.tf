locals {
  foldername_nw = replace(var.foldername, "_", "-")
}


module "keyvault-secret" {
  source       = "git::https://github.com/deepadeepanjali/tfmodule-azurerm-resource-kvsecret.git?ref=main"
  for_each     = var.botconfig
  secretname   = "secret-${local.foldername_nw}-${each.value.botname}"
  secretvalue  = "123"
  keyvault_id = data.azurerm_key_vault.keyvault.id
}


module "keyvault-secret-rbac" {
  depends_on  = [module.keyvault-secret]
  for_each    = local.secret_rbac  # Loop over the merged secret RBAC map
  
  source = "git::https://github.com/deepadeepanjali/tfmodule-azurerm-resource-rbac-role-assignments?ref=main"

  role_assignments = {
    "${each.key}" = {
      role        = each.value.role_name
      principal_id = each.value.object_id
      scope       = "${data.azurerm_key_vault.keyvault.id}/secrets/module.keyvault-secret[each.value.kv_map_key].name"  
    }
  }
}
