
data "azurerm_client_config" "connectivity" {
  provider = azurerm.connectivity
}

data "azurerm_client_config" "core" {
  provider = azurerm
}

data "azurerm_client_config" "management" {
  provider = azurerm.management
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

  # Mandatory Parameters for Providers
  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_connectivity_resources = false
  deploy_management_resources   = false
}