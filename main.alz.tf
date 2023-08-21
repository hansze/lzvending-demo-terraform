# Definining Data soures in order to query information from Provider
# this will allow us to query azurerm resources using 
data "azurerm_client_config" "core" {
  provider = azurerm
}

data "azurerm_client_config" "management" {
  provider = azurerm.management
}

data "azurerm_client_config" "connectivity" {
  provider = azurerm.connectivity
}


module "alz" {
  source = "Azure/caf-enterprise-scale/azurerm"
  #source = "github.com/Azure/terraform-azurerm-caf-enterprise-scale?ref=main"
  version = "= 3.3.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  # The root Management
  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  # Deploy the following ArcheTypes 
  deploy_corp_landing_zones   = true
  deploy_online_landing_zones = true
  deploy_diagnostics_for_mg   = true

  default_location  = "northeurope"
  disable_telemetry = true

  // Set subscription IDs for placement of platform subs - This data is loaded in by the provider
  subscription_id_management   = data.azurerm_client_config.management.subscription_id
  subscription_id_connectivity = data.azurerm_client_config.connectivity.subscription_id
  subscription_id_identity     = var.subscription_id_identity # "26f87617-364a-4ac7-bdc3-44bf3e33b253" 

  // Use management group association instead of having to be explicit about MG membership
  strict_subscription_association = false

  # Values will cause platform components to be deployed
  deploy_connectivity_resources = true #var.deploy_connectivity_resources
  deploy_management_resources   = true #var.deploy_management_resources

  # Configuration data comes from Settings.connectivity.tf
  configure_connectivity_resources = local.configure_connectivity_resources

  # Configuration data comes from Settings.management.tf
  configure_management_resources = local.configure_management_resources
}
