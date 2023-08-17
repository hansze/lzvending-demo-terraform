#### 
# What is an archetype?
# ref; https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BUser-Guide%5D-Archetype-Definitions

# Archetypes are used in the Azure landing zone conceptual architecture to describe the Landing Zone configuration using a template-driven approach. 
# The archetype is what fundamentally transforms Management Groups and Subscriptions into Landing Zones.
# 
# An archetype defines which Azure Policy and Access control (IAM) settings are needed to secure and configure the Landing Zones with 
# everything needed for safe handover to the Landing Zone owner. This covers critical platform controls and configuration items, such as:
# 
#  - Consistent role-based access control (RBAC) settings
#  - Guardrails for security settings
#  - Guarfrails for common workload configurations (e.g. SAP, AKS, WVD, etc.)
#  - Automate provisioning of critical platform resources such as monitoring and networking solutions in each Landing Zone
#    This approach provides improved autonomy for application teams, whilst ensuring security policies and standards are enforced.

# Default Module archetype definitions
Start-Process 'https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/tree/main/modules/archetypes/lib'

# Management


### Check SP Assignments
$SPClientID = '85335da0-5820-4023-b031-a7e4adc79643' # 'Deploy IaC'
az role assignment list --all --assignee $SPClientID
### Billing Accounts and Billing Enrollment accounts
Start-Process 'https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/view-all-accounts'

# billing_enrollment_account
#  az billing enrollment-account list

# subscription_billing_scope 
# az billing account list
$BillingAccountId = 'c1302900-7ed5-49ee-beb4-5f40dd420485'

Start-Process 'https://portal.azure.com/#@M365x12435175.onmicrosoft.com/resource/subscriptions/660f8f6b-518b-4d71-ba96-c59beab19f3a/properties'
#  "/providers/Microsoft.Billing/billingAccounts//enrollmentAccounts/${each.value.billing_enrollment_account}"

# Microsoft.Authorization/roleAssignments
#


### Leverages the Azure Landing Zone Module (ALZ)
# which leverages the TerramForm providers AzureRm and AzAPI


# Permissions needed
Start-Process 'https://github.com/Azure/terraform-azurerm-lz-vending/wiki/Permissions'

start-Process 'https://github.com/Azure/terraform-azurerm-lz-vending/blob/main/docs/wiki/Permissions.md'

# Create Custom Role to Assign SP


# Heirarchy 
Start-Process 'https://learn.microsoft.com/en-us/azure/governance/management-groups/overview#moving-management-groups-and-subscriptions'

# [Examples] Deploy Virtual WAN Resources
Start-Process 'https://github.com/Azure/terraform-azurerm-caf-enterprise-scale/wiki/%5BExamples%5D-Deploy-Virtual-WAN-Resources'

# Create a hub virtual network in Azure by using Terraform
Start-Process 'https://learn.microsoft.com/en-us/azure/developer/terraform/hub-spoke-hub-network'