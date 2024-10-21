provider "azurerm" {
  features {

  }
  use_oidc = true
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.5.0"
    }
  }

  backend "azurerm" {}
}