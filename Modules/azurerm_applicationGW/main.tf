data "azurerm_subnet" "appgw_subnet" {
  for_each             = var.appgws
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = coalesce(each.value.vnet_rg_name, each.value.rg_name)
}

resource "azurerm_public_ip" "pip" {
  for_each            = { for k, v in var.appgws : k => v if v.pip_name != null }
  name                = each.value.pip_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "appgw" {
  for_each            = var.appgws
  name                = each.value.appgw_name
  location            = each.value.loc
  resource_group_name = each.value.rg_name

  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.sku_capacity
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.appgw_subnet[each.key].id
  }

  frontend_port {
    name = "frontend-port-http"
    port = 80
  }

  dynamic "frontend_ip_configuration" {
    for_each = each.value.pip_name != null ? [1] : []
    content {
      name                 = "frontend-ip-configuration"
      public_ip_address_id = azurerm_public_ip.pip[each.key].id
    }
  }

  backend_address_pool {
    name = "backend-address-pool"
  }

  backend_http_settings {
    name                  = "backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "frontend-ip-configuration"
    frontend_port_name             = "frontend-port-http"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "request-routing-rule"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-address-pool"
    backend_http_settings_name = "backend-http-settings"
  }
}
