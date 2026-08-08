resource "azurerm_resource_group" "this" {
    for_each = var.rgs
    name = each.value.rg_name
    location = each.value.loc
}