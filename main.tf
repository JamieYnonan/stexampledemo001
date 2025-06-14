terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}

module "module_name" {
  source         = "git::https://github.com/JamieYnonan/terraform-azurerm-storage-account.git?ref=v1"
  rg_name        = var.rg_name
  st_instance    = var.st_instance
  st_project     = var.st_project
  container_name = var.container_name
}
