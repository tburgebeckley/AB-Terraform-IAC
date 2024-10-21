module "ab-azure-kubernetes" {
  source = "./modules/ab-azure-kubernetes"

  resource_group_name           = var.resource_group_name
  virtual_network_name          = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space
  subnets                       = var.subnets
  aks_cluster                   = var.aks_cluster

  deployment_environment = var.deployment_environment
  deployment_location    = var.deployment_location
  application_name       = var.application_name
  application_identifier = var.application_identifier
  application_owner      = var.application_owner
}