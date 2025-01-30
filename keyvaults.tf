data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault
  resource_group_name = var.resourcegroup
}



module "customer_kv_rbac" {
  source               = "git::https://github.com/deepadeepanjali/tfmodule-azurerm-resource-rbac-role-assignments.git?ref=main"
  for_each             = var.kv_rbac
  principal_id         = each.value.object_id
  role_definition_name = each.value.role_name
  scope                = data.azurerm_key_vault.keyvault.id
}
  
