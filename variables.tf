variable "root_id" {
  type    = string
  default = "mw-demo"
}

variable "root_name" {
  type    = string
  default = "MW-Demo"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "connectivity_resources_location" {
  type    = string
  default = "northeurope"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}