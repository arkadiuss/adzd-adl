resource "azurerm_hdinsight_spark_cluster" "spark" {
  name                = "sparkcluster"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  cluster_version     = "4.0"
  tier                = "Standard"

  depends_on = [azurerm_role_assignment.spark_user_storage_contributor]

  component_version {
    spark = "2.3"
  }

  gateway {
    username = var.spark_cluster.username
    password = var.spark_cluster.password
  }

  storage_account_gen2 {
    is_default                   = true
    storage_resource_id          = azurerm_storage_account.data_lake.id
    filesystem_id                = azurerm_storage_data_lake_gen2_filesystem.hdinsight.id
    managed_identity_resource_id = azurerm_user_assigned_identity.spark_user.id
  }

  roles {
    head_node {
      vm_size  = var.spark_cluster.node_size
      username = var.spark_cluster.username
      password = var.spark_cluster.password
    }

    worker_node {
      vm_size               = var.spark_cluster.node_size
      username              = var.spark_cluster.username
      password              = var.spark_cluster.password
      target_instance_count = var.spark_cluster.workers_count
    }

    zookeeper_node {
      vm_size  = var.spark_cluster.node_size
      username = var.spark_cluster.username
      password = var.spark_cluster.password
    }
  }
}