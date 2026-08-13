variable "peerings" {
  description = "Map of virtual network peerings"
  type        = map(any)
}

variable "vnet_ids" {
  description = "A map of vnet names to their IDs, used to lookup remote_vnet_id if remote_vnet_name is specified."
  type        = map(string)
  default     = {}
}
