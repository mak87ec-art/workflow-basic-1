resource "azurerm_virtual_network_peering" "this" {
  for_each = var.peerings
  
  name                         = each.value.peering_name
  resource_group_name          = each.value.rg_name
  virtual_network_name         = each.value.vnet_name
  remote_virtual_network_id    = try(each.value.remote_virtual_network_id, var.vnet_ids[each.value.remote_vnet_name])
  
  allow_virtual_network_access = try(each.value.allow_virtual_network_access, true)
  allow_forwarded_traffic      = try(each.value.allow_forwarded_traffic, false)
  allow_gateway_transit        = try(each.value.allow_gateway_transit, false)
  use_remote_gateways          = try(each.value.use_remote_gateways, false)
}
