# Resource block for creating a subnet
resource "azurerm_subnet" "subnet" {
  count                                         = length(var.subnets)
  name                                          = lookup(var.subnets[count.index], "subnet_name")
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = lookup(var.subnets[count.index], "virtual_network_name")
  address_prefixes                              = lookup(var.subnets[count.index], "subnet_address_prefixes")
  service_endpoints                             = lookup(lookup(var.subnets[count.index], "subnet_service_endpoints"), lookup(var.subnets[count.index], "subnet_name"), null)
  private_endpoint_network_policies_enabled     = lookup(var.subnets[count.index], "private_endpoint_network_policies_enabled", null)
  private_link_service_network_policies_enabled = lookup(var.subnets[count.index], "private_link_service_network_policies_enabled", null)
  service_endpoint_policy_ids                   = lookup(var.subnets[count.index], "service_endpoint_policy_ids", null)
  
  dynamic "delegation" {
    for_each = lookup(lookup(var.subnets[count.index], "subnet_delegation"), lookup(var.subnets[count.index], "subnet_name"), {})
    content {
      name = delegation.key
      service_delegation {
        name    = lookup(delegation.value, "service_name")
        actions = lookup(delegation.value, "service_actions", [])
      }
    }
  }
}

#