resource "azurerm_container_group" "spark_containers" {
  count               = 1
  name                = "${var.project_name}-spark"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "Public"
  os_type             = "Linux"

  depends_on = [azurerm_storage_share.data_lake_share]

  container {
    name   = "spark"
    image  = "jupyter/all-spark-notebook"
    cpu    = 1
    memory = 1

    ports {
      port     = 8888
      protocol = "TCP"
    }

    volume {
      name                 = "data-lake-volume"
      mount_path           = "/home/jovyan/work/datalake"
      share_name           = azurerm_storage_share.data_lake_share.name
      storage_account_name = azurerm_storage_account.data_lake.name
      storage_account_key  = azurerm_storage_account.data_lake.primary_access_key
    }

    environment_variables = {
      "JUPYTER_ENABLE_LAB" = "yes"
    }
  }

  tags = local.default_tags
}
