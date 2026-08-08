resource "azurerm_public_ip" "this" {
  for_each = var.BHs
  name                = each.value.pip_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

data "azurerm_subnet" "this" {
  for_each = var.BHs
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

resource "azurerm_bastion_host" "this" {
  for_each = var.BHs
  name                = each.value.bh_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = each.value.config_name
    subnet_id            = data.azurerm_subnet.this[each.key].id
    public_ip_address_id = azurerm_public_ip.this[each.key].id
  }
}
