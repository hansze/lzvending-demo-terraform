variable "root_id" {
  type    = string
  default = "mw-demo"
}

variable "root_name" {
  type    = string
  default = "MW-Demo"
}

# variable "deploy_connectivity_resources" {
#   type    = bool
#   default = true
# }
# 
variable "connectivity_resources_location" {
  type    = string
  default = "northeurope"
}
# 
variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}

# 
# # Variables used to control the deployment of management resources for
# # the platform
variable "deploy_management_resources" {
  type    = bool
  default = true
}
# 
# variable "management_security_contact_email" {
#   type    = string
#   default = "hansze@microsoft.com"
# }
# 
variable "subscription_id_identity" {
  type = string
  # ME-M365x12435175-hansze-2
  # When this is set subscription will be Moved to LZ
  default = "26f87617-364a-4ac7-bdc3-44bf3e33b253"
}

