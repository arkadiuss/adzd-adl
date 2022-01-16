resource "azurerm_storage_account" "data_lake" {
  name                     = replace(var.project_name, "-", "")
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true

  tags = local.default_tags
}

resource "azurerm_storage_container" "data" {
  name                  = "adzd-adl-data"
  storage_account_name  = azurerm_storage_account.data_lake.name
  container_access_type = "private"
}

// to be able to mount to a container
resource "azurerm_storage_share" "data_lake_share" {
  name                 = "${var.project_name}-share"
  storage_account_name = azurerm_storage_account.data_lake.name
  quota                = 100
}