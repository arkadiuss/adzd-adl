resource "azurerm_user_assigned_identity" "spark_user" {
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  name = "spark-user"
}
resource "azurerm_role_assignment" "spark_user_storage_contributor" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.spark_user.principal_id
}

data "azurerm_client_config" "current" {
}

resource "azurerm_role_assignment" "current_user_contributor" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}