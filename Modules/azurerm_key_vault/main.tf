data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  for_each                    = var.kv
  name                        = each.value.kv_name
  location                    = each.value.loc
  resource_group_name         = each.value.rg_name
  rbac_authorization_enabled  = each.value.rbac_authorization_enabled
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name
}

resource "azurerm_key_vault_access_policy" "this" {
  for_each            = var.kv
  key_vault_id        = azurerm_key_vault.this[each.key].id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  key_permissions     = each.value.key_permissions
  secret_permissions  = each.value.secret_permissions
  storage_permissions = each.value.storage_permissions
}
