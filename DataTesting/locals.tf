variable "azurerm_virtual_network" {
  type = map(object({
    connectivity = map(object({
      location = string
    }))
  }))
}

locals {
  hub_networks = local.settings.hub_networks
  # We generate the hub_networks_by_location as a map
  # to ensure the user has provided unique values for
  # each hub location. If duplicates are found,
  # terraform will throw an error at this point.
  hub_networks_by_location = {
    for hub_network in local.hub_networks :
    coalesce(hub_network.config.location, local.location) => hub_network
  }
  hub_network_locations = keys(local.hub_networks_by_location)
  virtual_hubs          = local.settings.vwan_hub_networks

}


# Creates a Mapping where Location is the Key
locals {
  hub_networks_by_location = {
    # K refers to the key of the current element
    for k, v in var.azurerm_virtual_network.connectivity :
    v.location => k
  }
}

variable "users" {
  type = map(object({
    role = string
  }))
}

locals {
  users_by_role = {
    for name, user in var.users : user.role => name...
  }
}



