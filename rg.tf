data "azurerm_resource_group" "main" {
  name = "adzd-rg"
}

resource "azurerm_storage_account" "main" {
  name                     = "adzd-adl"
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  tags = local.default_tags
}