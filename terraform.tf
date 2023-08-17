terraform {
  required_version = ">= 1.4.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.35.0"
    }
  }
  # Comment out backend to run init local
  backend "azurerm" {
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    storage_account_name = "terraform20230809sa"
    subscription_id      = "660f8f6b-518b-4d71-ba96-c59beab19f3a"
    snapshot             = true
    tenant_id            = "3601f7b0-7f78-48d6-9657-743f21b91069"
    use_azuread_auth     = true
    use_oidc             = true
  }
}
