provider "azurerm" {
  features {}
  subscription_id = "660f8f6b-518b-4d71-ba96-c59beab19f3a"
}

provider "azurerm" {
  features {}
  alias           = "management"
  subscription_id = "660f8f6b-518b-4d71-ba96-c59beab19f3a"
}

provider "azurerm" {
  features {}
  alias           = "connectivity"
  subscription_id = "660f8f6b-518b-4d71-ba96-c59beab19f3a"
}
