resource "azurerm_public_ip" "pip" {
  for_each            = { for k, v in var.lbs : k => v if v.pip_name != null }
  name                = each.value.pip_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.pip_allocation_method
  sku                 = each.value.sku
}

resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.lb_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name
  sku                 = each.value.sku

  dynamic "frontend_ip_configuration" {
    for_each = each.value.pip_name != null ? [1] : []
    content {
      name                 = "PublicIPAddress"
      public_ip_address_id = azurerm_public_ip.pip[each.key].id
    }
  }
}
