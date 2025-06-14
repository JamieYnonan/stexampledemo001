terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}

module "module_name" {
  source            = "git::https://github.com/{owner}/{repo}.git?ref=v1"
  rg_name           = var.rg_name
}
