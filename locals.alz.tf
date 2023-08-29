locals {
  # Substituted with vWAN
  #hub_networks_by_location = {
  #  for k, v in module.alz.azurerm_virtual_network.connectivity :
  #  v.location => k
  #}

  # Create Mapping location to vWAN
  # MAPPING was not taking HACK change back later
  #virtual_hubs_by_location = {
  #  for k, v in module.alz.azurerm_virtual_network.connectivity :
  #  v.location => k
  #}

}


