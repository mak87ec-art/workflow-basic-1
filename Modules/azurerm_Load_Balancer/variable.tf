variable "lbs" {
  description = "Map of Azure Load Balancers to create"
  type = map(object({
    lb_name               = string
    loc                   = string
    rg_name               = string
    sku                   = optional(string, "Standard")
    pip_name              = optional(string)
    pip_allocation_method = optional(string, "Static")
  }))
}
