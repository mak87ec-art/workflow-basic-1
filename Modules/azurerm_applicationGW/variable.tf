variable "appgws" {
  description = "Map of Azure Application Gateways to create"
  type = map(object({
    appgw_name   = string
    loc          = string
    rg_name      = string
    sku_name     = optional(string, "Standard_v2")
    sku_tier     = optional(string, "Standard_v2")
    sku_capacity = optional(number, 2)
    subnet_name  = string
    vnet_name    = string
    vnet_rg_name = optional(string)
    pip_name     = optional(string)
  }))
}
