 variable "resource_group_name" {
  description = "The IP Version to use, IPv6 or IPv4."
  type        = string
}

variable "location" {
  description = "The SKU of the Public IP."
  type        = string
}

# ebns
variable "eventhub_namespace_name" {
  description = "The SKU Tier that should be used for the Public IP."
  type        = string
  default = "IOT-namespace"

}

variable "ns_sku" {
  description = "Specifies the name of the storage account."
  type        = string
}
variable "ns_capacity" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default = "2"

}

# eventhub
variable "eventhub_name" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
}

variable "ehub_partition_count" {
  description = "Specifies the name of the App Service Plan component."
  type        = string
  default = "2"
}
variable "ehub_message_retention" {
  description = "Specifies the plan's pricing tier."
  type        = string
  default = "1"
}
# iothub
variable "iothub_name" {
  type        = string
  description = "Specifies the name of the Management Lock"
}

variable "iotsku_name" {
  description = "Specifies the supported Azure Region where the Load Balancer should be created."
  type        = string
}


variable "iotsku_capacity" {
  description = " Specifies the name of the Public IP."
  type        = string
  default = "1"

}

# blob
variable "sa_name" {
  description = "Contains the name of the initial database of this instance that was provided at create time,"
  type        = string

}

variable "sa_tier" {
  description = "Contains the master username for the DB instance"
  type        = string

}
variable "sa_account_replication_type" {
  description = "Contains the password for the DB instance"
  type        = string

}
# variable "sa_container_name" {
#   description = "Contains the name of the compute and memory capacity class of the DB instance"
#   type        = string

# }
variable "container_access_type" {
  description = "Storage type associated with DB instance."
  type        = string
  default = "private"

}
variable "blob_name" {
  description = "Allocated storage size specified in gigabytes"
  type        = string

}
variable "blob_type" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string
  default = "Block"

}
variable "allow_nested_items_to_be_public" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string
  default = true

}
variable "public_network_access_enabled" {
  description = "Provisioned IOPS (I/O operations per second) value."
  type        = string
  default = true

}



variable "server_version" {
  type        = string
  description = "name of the azurerm_app_service_plan"
  default = "12.0"
}

variable "administrator_login" {
  type        = string
  description = "name of the azurerm_logic_app_standard"
}

variable "administrator_login_password" {
  type        = string
  description = "(optional) describe your variable"
}


variable "connection_policy" {
  type        = string
  description = "Specifies the plan's pricing tier."
  default = "Default"
}
variable "name" {
  type        = string
  description = "name of the resource group"
}
variable "server_name" {
  type        = string
  description = "name of the azurerm_app_service_plan"
}

variable "requested_service_objective_name" {
  type        = string
  description = "name of the azurerm_logic_app_standard"
}

variable "edition" {
  type        = string
  description = "(optional) describe your variable"
  default = "Standard"
}

variable "create_mode" {
  type        = string
  description = "(optional) describe your variable"
  default = "Default"
}
# 




# variable "private_endpoint_subnet_id" {
#   
# variable "eventhubcluster_name" {
#   description = "The IP Version to use, IPv6 or IPv4."
#   type        = string
# }

# variable "partition_count" {
#   description = "The SKU of the Public IP."
#   type        = string
# }

# variable "message_retention" {
#   description = "The SKU Tier that should be used for the Public IP."
#   type        = string

# }

# # STORAGE ACCOUNT

# variable "storage_name" {
#   description = "Specifies the name of the storage account."
#   type        = string
# }
# variable "account_tier" {
#   description = "Defines the Tier to use for this storage account."
#   type        = string
#   default     = "Standard"
# }
# variable "account_replication_type" {
#   description = "Defines the type of replication to use for this storage account."
#   type        = string
#   default     = "LRS"
# }

# # APP SERVICE PLAN

# variable "plan_name" {
#   description = "Specifies the name of the App Service Plan component."
#   type        = string
# }
# variable "app_service_tier" {
#   description = "Specifies the plan's pricing tier."
#   type        = string
# }
# variable "app_service_size" {
#   description = "Specifies the plan's instance size."
#   type        = string
# }
# variable "kind" {
#   type        = string
#   description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows."
#   default     = "Linux"
# }
# variable "reserved" {
#   type        = bool
#   description = "Is this App Service Plan Reserved. Defaults to false."
#   default     = true
# }

# # FUNCTION APP

# variable "function_name" {
#   description = "the name of the Function App."
#   type        = string
# }
# variable "functions_worker_runtime" {
#   description = "A map of key-value pairs for App Settings and custom values.possible values are dotnet, dotnet-isolated, java, node, powershell, python"
#   type        = string
# }
# variable "os_type" {
#   type        = string
#   description = "possible values are This value will be linux for Linux derivatives, or an empty string for Windows (default). When set to linux you must also set azurerm_app_service_plan arguments as and reserved = true"
#   default     = "linux"
# }
# variable "java_version" {
#   type        = string
#   description = "Java version hosted by the function app in Azure. Possible values are 1.8, 11."
#   default     = "11"
# }