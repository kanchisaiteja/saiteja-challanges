variable "service_principal_client_id" {
  type        = string
  description = "Client ID"
  sensitive = true
}

variable "service_principal_client_secret" {
  type        = string
  description = "Client Secret"
  sensitive = true
}

variable "resource_name_prefix" {
  type        = string
  description = "Resource prefix"
  default     = "string"
}

variable "container_name" {
    type = string
    description = "container"
    default = "value"
  
}

variable "storage_account_name" {
    type = string
    description = "storage"
    default = "value"
  
}

variable "key" {
    type = key
    default = "string"
  
}

variable "Cost_Center" {
    type = cost
    default = "value"
  
}

variable "Project_Code" {
    type = code
    default = "value"
  
}
variable "Project_Name" {
    type = project_name
    default = "value"
  
}



variable resource_group_name {
  type        = string
  description = "Resource group name"
  default     = "string"
}

variable location {
  type        = string
  description = "Azure location where the infrastructure will be provisioned"
  default     = "westcentralus"
}

## AKS settings 
variable "node_count" {
  default = 1
}

variable "vm_size" {
  default = "Standard_f4s"
}

variable "dns_prefix" {
  default = "string"
}

variable cluster_name {
  default = "string"
}

variable "content_trust" {
  description = "Set to true to enable Docker Content Trust on registry."
  type        = bool
  default     = true
}

# Tags
