locals {
  tags = {
    app_id      = var.application_identifier
    app_name    = var.application_name
    env         = var.deployment_environment
    app_owner   = var.application_owner
    module_name = "ab-azure-kubernetes"
    location    = var.deployment_location
  }
}

resource "azurerm_resource_group" "app_rg" {
  name     = var.resource_group_name
  location = var.deployment_location
  tags     = local.tags
}

resource "azurerm_virtual_network" "app_vnet" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_address_space]
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = var.deployment_location
  tags                = local.tags
}

resource "azurerm_subnet" "app_subnets" {
  for_each             = var.subnets
  name                 = each.value["name"]
  address_prefixes     = [each.value["address_prefix"]]
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  resource_group_name  = azurerm_resource_group.app_rg.name
}

resource "azurerm_kubernetes_cluster" "app_aks" {
  name                       = var.aks_cluster["name"]
  resource_group_name        = azurerm_resource_group.app_rg.name
  location                   = var.deployment_location
  dns_prefix_private_cluster = var.aks_cluster.dns_prefix_private_cluster
  kubernetes_version         = var.aks_cluster.kubernetes_version
  local_account_disabled     = var.aks_cluster.local_account_disabled
  default_node_pool {
    name                        = var.aks_cluster.default_node_pool.name
    vm_size                     = var.aks_cluster.default_node_pool.vm_size
    auto_scaling_enabled        = var.aks_cluster.default_node_pool.auto_scaling_enabled
    vnet_subnet_id              = azurerm_subnet.app_subnets[var.aks_cluster.default_node_pool.vnet_subnet_map_name].id
    min_count                   = coalesce(var.aks_cluster.default_node_pool.auto_scaling_enabled ? var.aks_cluster.default_node_pool.min_count : null)
    max_count                   = coalesce(var.aks_cluster.default_node_pool.auto_scaling_enabled ? var.aks_cluster.default_node_pool.min_count : null)
    node_count                  = coalesce(var.aks_cluster.default_node_pool.auto_scaling_enabled ? var.aks_cluster.default_node_pool.min_count : null)
    temporary_name_for_rotation = coalesce(var.aks_cluster.default_node_pool.auto_scaling_enabled ? var.aks_cluster.default_node_pool.temporary_name_for_rotation : null)
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = true
    admin_group_object_ids = var.aks_cluster.admin_group_ids
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}