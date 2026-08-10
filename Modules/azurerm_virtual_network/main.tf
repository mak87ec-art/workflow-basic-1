resource "azurerm_virtual_network" "this" {
  for_each            = var.vnets
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
  location            = each.value.loc
  address_space       = each.value.address_space
}