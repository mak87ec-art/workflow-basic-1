resource "azurerm_network_security_group" "this" {
  for_each            = var.nsgs
  name                = each.value.nsg_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name

  dynamic "security_rule" {
    for_each = var.security_rule
    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }

  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  for_each                  = var.nsgs
  network_interface_id      = data.azurerm_network_interface.this[each.key].id
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}
data "azurerm_network_interface" "this" {
  for_each            = var.nsgs
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}