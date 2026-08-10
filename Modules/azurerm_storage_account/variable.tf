variable "storage_accounts" {
  description = "Map of Azure Storage Accounts to create"
  type = map(object({
    sa_name                  = string
    rg_name                  = string
    loc                      = string
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
  }))
}
