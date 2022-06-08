terraform {
  required_providers {
    azurerm = {
        source = "azurerm"
        version = ">= 2.0"
    }
  }
  backend "azurerm" {
      resource_group_name = "rg-${var.environment}-${var.resource_group_name}"
      storage_account_name = var.storage_account_name
      container_name = var.container_name
      key = var.key
    
  }
}

provider "azurerm" {
  features {}
}

# Resource group 

resource "azurerm_resource_group"  {
  name     = var.resource_group_name
  location = var.location
  tags = {
    "Cost Center"  = var.Cost
    "Project Code" = var.Project_code
    "Project Name" = var.Project_name
    }
}

# Container registry 
resource "azurerm_container_registry" "acr" {
  name                = var.container_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = true
  tags = {
    "Cost Center"  = var.Cost
    "Project Code" = var.Project_code
    "Project Name" = var.Project_name
    }
}

# AKS Cluster 
resource "azurerm_kubernetes_cluster" "eshop_aks_app" {
  name                = var.cluster_name
  location            = azurerm_resource_group.var.resource_group_name.location
  resource_group_name = azurerm_resource_group.var.resource_group_name.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size             = var.vm_size
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 20
    max_pods            = 100
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  network_profile {
    network_plugin = "azure"
  }

  tags = {
    Environment = var.tag_env
    "Cost Center"  = var.Cost
    "Project Code" = var.Project_code
    "Project Name" = var.Project_name
    }
data "azurerm_subnet" "subnet_id" {
    name                       = "${var.subnet_names}"
    virtual_network_name       = "${var.vnet_name}"
    resource_group_name        = "${var.resource_group_name}"
}


}