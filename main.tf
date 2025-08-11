resource "azurerm_resource_group" "rgD" {
  name     = "classD"
  location = "eastus"
}

resource "azurerm_resource_group" "rgE" {
  name     = "classE"
  location = "eastus"
}
resource "azurerm_storage_account" "stD" {
    name = "stclassd"
    resource_group_name = azurerm_resource_group.rgD.name
    location = azurerm_resource_group.rgD.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}
resource "azurerm_storage_account" "stE" {
    depends_on = [azurerm_resource_group.rgE]
    name = "stclasse"
    resource_group_name = "classE"
    location = "eastus"
    account_tier = "Standard"
    account_replication_type = "ZRS"
}