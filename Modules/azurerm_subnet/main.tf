resource "azurerm_subnet" "this" {
  for_each             = var.subnets
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
  resource_group_name  = each.value.rg_name
}
