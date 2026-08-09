resource "azurerm_network_interface" "this" {
  for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.config_name
    subnet_id                     = data.azurerm_subnet.this[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.loc
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.this[each.key].id]

os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}

data "azurerm_subnet" "this" {
  for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}