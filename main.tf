terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.15.0"
    }
  }
}

provider "azurerm" {
  features {}
}
