project_name = "adzd-adl"
location     = "East US"
spark_cluster = {
  workers_count = 1
  node_size     = "ExtraSmall"
  username      = "master"
  password      = "d5kd3Y2ff3"
}

#https://docs.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-introduction
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment
#https://github.com/hashicorp/terraform-provider-azurerm/issues/6659
#https://github.com/arkadiuss/big-data-analysis/blob/main/Spark_assignment_3.ipynb
#https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-40-component-versioning
#https://github.com/hashicorp/terraform-provider-azurerm/issues/6659
#https://github.com/hashicorp/terraform-provider-azurerm/search?q=filesystem_id
#https://docs.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-introduction-abfs-uri
#https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/hdinsight/hdinsight-hadoop-use-data-lake-storage-gen2-azure-cli.md