rgs = {
  rg1 = {
    rg_name = "rg-humana"
    loc     = "south africa north"
  }
}
vnets = {
  vnet1 = {
    vnet_name     = "netflix_vnet"
    rg_name       = "rg-humana"
    loc           = "south africa north"
    address_space = ["10.0.0.0/16"]
  }
  vnet2 = {
    vnet_name     = "Starbuck_vnet"
    rg_name       = "rg-humana"
    loc           = "south africa north"
    address_space = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    subnet_name      = "netflix_subnet"
    vnet_name        = "netflix_vnet"
    address_prefixes = ["10.0.1.0/24"]
    rg_name          = "rg-humana"
  }
  subnet2 = {
    subnet_name      = "starbuck_subnet"
    vnet_name        = "starbuck_vnet"
    address_prefixes = ["10.0.2.0/24"]
    rg_name          = "rg-humana"
  }
  subnet3 = {
    subnet_name      = "AzureBastionSubnet"
    vnet_name        = "netflix_vnet"
    address_prefixes = ["10.0.3.0/26"]
    rg_name          = "rg-humana"
  }
  subnet4 = {
    subnet_name      = "appgw_subnet"
    vnet_name        = "netflix_vnet"
    address_prefixes = ["10.0.4.0/24"]
    rg_name          = "rg-humana"
  }
}
BHs = {
  BH1 = {
    pip_name          = "bastion_pip"
    loc               = "south africa north"
    rg_name           = "rg-humana"
    sku               = "Standard"
    allocation_method = "Static"
    subnet_name       = "AzureBastionSubnet"
    vnet_name         = "netflix_vnet"
    rg_name           = "rg-humana"
    bh_name           = "Bh_humana"
    config_name       = "configuration"

  }
}
kv = {
  kv1 = {
    kv_name                     = "kv-humana"
    loc                         = "south africa north"
    rg_name                     = "rg-humana"
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
nsgs = {
  nsg1 = {
    nsg_name = "netflix-nsg"
    loc      = "south africa north"
    rg_name  = "rg-humana"
    nic_name = "netflix-nic"
  }
}
security_rule = {
  ssh = {
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.3.0/26"
    destination_address_prefix = "*"
  }
  http = {
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.3.0/26"
    destination_address_prefix = "*"
  }
}

vms = {
  vm1 = {
    nic_name                        = "netflix-nic"
    loc                             = "south africa north"
    rg_name                         = "rg-humana"
    config_name                     = "internal"
    private_ip_address_allocation   = "Dynamic"
    subnet_name                     = "netflix_subnet"
    vnet_name                       = "netflix_vnet"
    vm_name                         = "netflix-vm"
    size                            = "Standard_DS1_v2"
    admin_username                  = "adminuser"
    admin_password                  = "Adminuser@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
  vm2 = {
    nic_name                        = "starbucks-nic"
    loc                             = "south africa north"
    rg_name                         = "rg-humana"
    config_name                     = "internal"
    private_ip_address_allocation   = "Dynamic"
    subnet_name                     = "starbuck_subnet"
    vnet_name                       = "starbuck_vnet"
    vm_name                         = "starbuck-vm"
    size                            = "Standard_DS1_v2"
    admin_username                  = "adminuser"
    admin_password                  = "Adminuser@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
   vm3 = {
    nic_name                        = "Airtel-nic"
    loc                             = "south africa north"
    rg_name                         = "rg-humana"
    config_name                     = "internal"
    private_ip_address_allocation   = "Dynamic"
    subnet_name                     = "starbuck_subnet"
    vnet_name                       = "starbuck_vnet"
    vm_name                         = "Airtel-vm"
    size                            = "Standard_DS1_v2"
    admin_username                  = "adminuser"
    admin_password                  = "Adminuser@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
   vm4 = {
    nic_name                        = "Jio-nic"
    loc                             = "south africa north"
    rg_name                         = "rg-humana"
    config_name                     = "internal"
    private_ip_address_allocation   = "Dynamic"
    subnet_name                     = "starbuck_subnet"
    vnet_name                       = "starbuck_vnet"
    vm_name                         = "Jio-vm"
    size                            = "Standard_DS1_v2"
    admin_username                  = "adminuser"
    admin_password                  = "Adminuser@123"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}

lbs = {
  lb1 = {
    lb_name  = "lb-humana"
    loc      = "south africa north"
    rg_name  = "rg-humana"
    pip_name = "lb-pip-humana"
  }
}

appgws = {
  appgw1 = {
    appgw_name  = "appgw-humana"
    loc         = "south africa north"
    rg_name     = "rg-humana"
    subnet_name = "appgw_subnet"
    vnet_name   = "netflix_vnet"
    pip_name    = "appgw-pip-humana"
  }
}

storage_accounts = {
  sa1 = {
    sa_name                  = "sahumana123"
    rg_name                  = "rg-humana"
    loc                      = "south africa north"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

peerings = {
  peering1 = {
    peering_name                 = "netflix-to-starbuck"
    rg_name                      = "rg-humana"
    vnet_name                    = "netflix_vnet"
    remote_vnet_name             = "Starbuck_vnet"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
  }
  peering2 = {
    peering_name                 = "starbuck-to-netflix"
    rg_name                      = "rg-humana"
    vnet_name                    = "Starbuck_vnet"
    remote_vnet_name             = "netflix_vnet"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
  }
}
