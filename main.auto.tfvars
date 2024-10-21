deployment_environment = "dev"
deployment_location    = "eastus"
application_name       = "dev-ab-app"
application_identifier = "12345"
application_owner      = "tburgebeckley@gmail.com"

resource_group_name = "ab-dev-app-rg-01"

virtual_network_name = "ab-dev-app-vnet-01"

virtual_network_address_space = "10.0.0.0/16"

subnets = {
  subnet1 = {
    subnet_name    = "aks-defpool-snet"
    address_prefix = "10.0.0.0/24"
  }
}

aks_cluster = {
  name                       = "ab-dev-app-aks-01"
  dns_prefix_private_cluster = "ab-aks.dev"
  kubernetes_version         = "1.30"
  local_account_disabled     = true
  admin_group_ids = [
    "7fde10cc-63c0-4ef5-8e66-4b5533883247",
    "dee70b29-0305-47b4-98eb-aaf0ed65fbb8"
  ]
  default_node_pool = {
    name                        = "ab-aksdefpool-01"
    auto_scaling_enabled        = true
    min_count                   = 1
    max_count                   = 3
    node_count                  = 1
    temporary_name_for_rotation = "tempnodepool"
    vnet_subnet_map_name        = "subnet1"
  }

}