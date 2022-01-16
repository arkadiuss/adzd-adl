output "tenant_id" {
    value = data.azuread_client_config.current.tenant_id
}

output "azure_application_id" {
    value = azuread_application.databricks.application_id
}

output "databricks_application_secret" {
    value = azuread_application_password.databricks_secret_password.value
    sensitive = true
}