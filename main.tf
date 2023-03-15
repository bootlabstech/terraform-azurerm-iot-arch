resource "azurerm_eventhub_namespace" "eventhub" {
   name                = var.eventhub_namespace_name
   location            = var.location
   resource_group_name = var.resource_group_name
   sku                 = var.ns_sku
   capacity            = var.ns_capacity
   zone_redundant      = false
   local_authentication_enabled = true
   minimum_tls_version = "1.2"
   identity {
     type = "SystemAssigned"
   }
   
  }
  resource "azurerm_eventhub" "example" {
  name                = var.eventhub_name
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_eventhub_namespace.eventhub.name
  partition_count     = var.ehub_partition_count #2
  message_retention   = var.ehub_message_retention #1
}

resource "azurerm_eventhub_authorization_rule" "example" {
  resource_group_name = var.resource_group_name
  namespace_name      = azurerm_eventhub_namespace.eventhub.name
  eventhub_name       = azurerm_eventhub.example.name
  name                = "acctest"
  send                = true
}

resource "azurerm_iothub" "example" {
  name                = var.iothub_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.iotsku_name #"S1"
    capacity = var.iotsku_capacity #"1"
  }

  # endpoint {
  #   type              = "AzureIotHub.EventHub"
  #   connection_string = azurerm_eventhub_authorization_rule.example.primary_connection_string
  #   name              = "export2"
  # }

  # route {
  #   name           = "export"
  #   source         = "DeviceMessages"
  #   condition      = "true"
  #   endpoint_names = ["export"]
  #   enabled        = true
  # }

  # route {
  #   name           = "export2"
  #   source         = "DeviceMessages"
  #   condition      = "true"
  #   endpoint_names = ["export2"]
  #   enabled        = true
  # }

  # enrichment {
  #   key            = "tenant"
  #   value          = "$twin.tags.Tenant"
  #   endpoint_names = ["export", "export2"]
  # }

  # cloud_to_device {
  #   max_delivery_count = 30
  #   default_ttl        = "PT1H"
  #   feedback {
  #     time_to_live       = "PT1H10M"
  #     max_delivery_count = 15
  #     lock_duration      = "PT30S"
  #   }
  # }
}

resource "azurerm_storage_account" "example" {
  name                     = var.sa_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.sa_tier
  account_replication_type = var.sa_account_replication_type
  account_kind = "BlobStorage"
  public_network_access_enabled = var.public_network_access_enabled
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  blob_properties {
    versioning_enabled = true
    
  }
  
}


resource "azurerm_storage_container" "example" {
  name                  = "{{.name}}-container"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "example" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.blob_type
#   source                 = "some-local-file.zip"
}

resource "azurerm_sql_server" "example" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  connection_policy            = var.connection_policy



}

resource "azurerm_sql_database" "example" {
  name                             = var.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  server_name                      = azurerm_sql_server.example.name
  requested_service_objective_name = var.requested_service_objective_name
  create_mode                      = var.create_mode
  edition                          = var.edition


  depends_on = [
    azurerm_sql_server.example
  ]
}


