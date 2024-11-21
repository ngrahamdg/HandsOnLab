terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {

    organization = "NateCorp"

    workspaces {
      name = "HandsOnLab"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-ef612e92-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage1" {
  source               = "app.terraform.io/NateCorp/securestorage1/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "rcaistg555555"
}