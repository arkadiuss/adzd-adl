// resource "azurerm_databricks_workspace" "databricks" {
//   name                = "${var.project_name}-databricks"
//   resource_group_name = azurerm_resource_group.main.name
//   location            = azurerm_resource_group.main.location
//   sku                 = "standard"

//   tags = local.default_tags
// }

data "azuread_client_config" "current" {}

resource "azuread_application" "databricks" {
  display_name     = "adzd-adl-databricks-app"
}

resource "azuread_service_principal" "databricks" {
  application_id = azuread_application.databricks.application_id
}

resource "azurerm_role_assignment" "data_bricks_storage_contributor" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.databricks.object_id
}

resource "azuread_application_password" "databricks_secret_password" {
  application_object_id = azuread_application.databricks.object_id
}