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

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = var.backend_state_rg_name
    storage_account_name = var.backend_state_stgacct_name
    container_name       = var.backend_container_name
    key                  = var.backend_key
    use_oidc             = true
  }
}