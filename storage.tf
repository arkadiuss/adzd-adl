locals {
  hdinsight_suffix = "hdinsights"
}

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

resource "azurerm_storage_data_lake_gen2_filesystem" "hdinsight" {
  name               = local.hdinsight_suffix
  storage_account_id = azurerm_storage_account.data_lake.id

  depends_on = [azurerm_role_assignment.current_user_contributor]
  properties = {

  }
}