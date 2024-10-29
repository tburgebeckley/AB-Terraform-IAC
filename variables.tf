# Resource Configuration

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to contain the AKS resources"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network to contain the AKS resources"
}

variable "virtual_network_address_space" {
  type        = string
  description = "Full address space of the virtual network named in `virtual_network_name`"
  default     = "10.0.0.0/16"
}

variable "subnets" {
  type = map(object({
    subnet_name    = string
    address_prefix = string
  }))
  description = "Map of subnet objects"
}

variable "aks_cluster" {
  type = object({
    name                       = string
    dns_prefix_private_cluster = string
    kubernetes_version         = string
    local_account_disabled     = bool
    admin_group_ids            = list(string)
    default_node_pool = object({
      name                        = string
      vm_size                     = string
      auto_scaling_enabled        = bool
      vnet_subnet_map_name        = string
      min_count                   = number
      max_count                   = number
      node_count                  = number
      temporary_name_for_rotation = string
    })
  })
}

# Resource tag information and location for deployment
variable "deployment_location" {
  type        = string
  description = "Region in Azure to deploy resources"
  default     = "eastus2"

  validation {
    condition     = contains(["eastus", "eastus2", "westus", "westus2"], var.deployment_location)
    error_message = "Deployment Location is restricted to the following regions: eastus, eastus2, westus, westus2."
  }
}
variable "deployment_environment" {
  type        = string
  description = "Environment name that will be tagged on the created resources"
}

variable "application_name" {
  type        = string
  description = "Name for the application being deployed"
}

variable "application_identifier" {
  type        = string
  description = "Unique identification number or signifier"
}

variable "application_owner" {
  type        = string
  description = "Email address of the owner of this application"
}