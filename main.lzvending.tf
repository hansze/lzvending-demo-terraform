# The landing zone module will be called once per landing_zone_*.yaml file
# in the data directory.
module "lz_vending" {
  source   = "Azure/lz-vending/azurerm"
  version  = "3.1.0"                     # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints
  for_each = local.landing_zone_data_map #

  location = each.value.location

  # subscription variables
  subscription_alias_enabled = false                      # Changed from True and adding SubscriptionId
  subscription_id            = each.value.subscription_id # added Id because Alias_enabled false
  subscription_billing_scope = "/providers/Microsoft.Billing/billingAccounts/c1302900-7ed5-49ee-beb4-5f40dd420485/enrollmentAccounts/${each.value.billing_enrollment_account}"
  subscription_display_name  = each.value.name
  subscription_alias_name    = each.value.name
  subscription_workload      = each.value.workload

  # management group association variables
  subscription_management_group_association_enabled = true
  subscription_management_group_id                  = each.value.management_group_id

  # virtual network variables
  virtual_network_enabled = true
  virtual_networks = {
    for k, v in each.value.virtual_networks : k => merge(
      v,
      {
        #hub_network_resource_id         = local.hub_networks_by_location[each.value.location]
        #hub_peering_use_remote_gateways = false
        #vwan_connection_enabled = true
        #vwan_hub_resource_id    = local.virtual_hubs_by_location[each.value.location]
      }
    )
  }

}
