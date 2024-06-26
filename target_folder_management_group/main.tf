# Create the first level management group
resource "azurerm_management_group" "level1" {
  name              = var.level1_name
  display_name      = var.level1_display_name
  parent_management_group_id = var.parent_management_group_id
  subscription_ids  = var.level1_subscription_ids
}

# Create the second level management group
resource "azurerm_management_group" "level2" {
  name              = var.level2_name
  display_name      = var.level2_display_name
  parent_management_group_id = azurerm_management_group.level1.id
  subscription_ids  = var.level2_subscription_ids
}

#