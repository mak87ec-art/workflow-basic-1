rgs = {
  rg1 = {
    rg_name = "rg-humana"
    loc     = "central india"
  }
}
vnets = {
  vnet1 = {
    vnet_name     = "netflix_vnet"
    rg_name       = "rg_humana"
    loc           = "central india"
    address_space = ["10.0.0.0/16"]
  }
  vnet2 = {
    vnet_name     = "Starbuck_vnet"
    rg_name       = "rg_humana"
    loc           = "central india"
    address_space = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    subnet_name      = "netflix_subnet"
    vnet_name        = "netflix_vnet"
    address_prefixes = ["10.0.1.0/24"]
    rg_name          = "rg_humana"
  }
  subnet2 = {
    subnet_name      = "starbuck_subnet"
    vnet_name        = "starbuck_vnet"
    address_prefixes = ["10.0.2.0/24"]
    rg_name          = "rg_humana"
  }
  subnet3 = {
    subnet_name      = "AzureBastionSubnet"
    vnet_name        = "netflix_vnet"
    address_prefixes = ["10.0.3.0/26"]
    rg_name          = "rg_humana"
  }
}
BHs = {
  BH1 = {
    pip_name          = "bastion_pip"
    loc               = "central india"
    rg_name           = "rg_humana"
    sku               = "Standard"
    allocation_method = "Static"
    subnet_name       = "AzureBastionSubnet"
    vnet_name         = "netflix_vnet"
    rg_name           = "rg_humana"
    bh_name           = "Bh_humana"
    config_name       = "configuration"

  }
}
kv = {
  kv1 = {
    kv_name                     = "kv-humana"
    loc                         = "central india"
    rg_name                     = "rg_humana"
    rbac_authorization_enabled  = false
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
    key_permissions             = ["Get"]
    secret_permissions          = ["Get"]
    storage_permissions         = ["Get"]
  }
}
