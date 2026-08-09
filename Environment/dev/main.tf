module "resource_grp" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs
}
module "virtual_network" {
  depends_on = [module.resource_grp]
  source     = "../../Modules/azurerm_virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../Modules/azurerm_subnet"
  subnets    = var.subnets
}
module "bastion_host" {
  depends_on = [module.subnet]
  source     = "../../Modules/azurerm_bastion"
  BHs        = var.BHs
}
module "key_vault" {
    depends_on = [ module.resource_grp ]
    source = "../../Modules/azurerm_key_vault"
    kv = var.kv
}
module "Linux_virtual_machine" {
  depends_on = [ module.subnet ]
  source = "../../Modules/azurerm_virtual_machine"
  vms = var.vms
}
module "network_security_grp" {
  depends_on = [ module.Linux_virtual_machine, module.subnet ]
  source = "../../Modules/azurerm_nsg"
  nsgs = var.nsgs
  security_rule = var.security_rule
}
