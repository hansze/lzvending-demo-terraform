data "azurerm_client_config" "current" {
}

output "c" {
  description = "Connectivity Object"
  value       = data.azurerm_client_config.connectivity.this.virtual_networks
}


output "account_id" {
  value = data.azurerm_client_config.current.client_id
}

output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}