terraform {
  required_version = "~>1.9.8"
  required_providers {
    azurerm = {
      version = "~>4.5.0"
      source  = "hashicorp/azurerm"
    }
  }
}