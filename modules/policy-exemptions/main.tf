# Resource-level exemptions
resource "azurerm_resource_policy_exemption" "resource" {
  for_each = { for k, v in var.policy_exemptions : k => v if v.exemption_scope == "resource" }
  
  name                            = each.value.name
  policy_assignment_id            = each.value.policy_assignment_id
  resource_id                     = each.value.resource_id  # Required for resource exemptions
  exemption_category              = each.value.exemption_category
  
  display_name                    = lookup(each.value, "display_name", null)
  description                     = lookup(each.value, "description", null)
  expires_on                      = lookup(each.value, "expires_on", null)
  policy_definition_reference_ids = lookup(each.value, "policy_definition_reference_ids", null)
  metadata                        = lookup(each.value, "metadata", null) != null ? jsonencode(each.value.metadata) : null
}

# Resource Group-level exemptions  
resource "azurerm_resource_group_policy_exemption" "resource_group" {
  for_each = { for k, v in var.policy_exemptions : k => v if v.exemption_scope == "resource_group" }
  
  name                            = each.value.name
  policy_assignment_id            = each.value.policy_assignment_id
  resource_group_id               = each.value.resource_group_id  # Required for RG exemptions
  exemption_category              = each.value.exemption_category
  
  display_name                    = lookup(each.value, "display_name", null)
  description                     = lookup(each.value, "description", null)
  expires_on                      = lookup(each.value, "expires_on", null)
  policy_definition_reference_ids = lookup(each.value, "policy_definition_reference_ids", null)
  metadata                        = lookup(each.value, "metadata", null) != null ? jsonencode(each.value.metadata) : null
}

# Subscription-level exemptions
resource "azurerm_subscription_policy_exemption" "subscription" {
  for_each = { for k, v in var.policy_exemptions : k => v if v.exemption_scope == "subscription" }
  
  name                            = each.value.name
  policy_assignment_id            = each.value.policy_assignment_id
  subscription_id                 = each.value.subscription_id  # Required for subscription exemptions
  exemption_category              = each.value.exemption_category
  
  display_name                    = lookup(each.value, "display_name", null)
  description                     = lookup(each.value, "description", null)
  expires_on                      = lookup(each.value, "expires_on", null)
  policy_definition_reference_ids = lookup(each.value, "policy_definition_reference_ids", null)
  metadata                        = lookup(each.value, "metadata", null) != null ? jsonencode(each.value.metadata) : null
}

# Management Group-level exemptions
resource "azurerm_management_group_policy_exemption" "management_group" {
  for_each = { for k, v in var.policy_exemptions : k => v if v.exemption_scope == "management_group" }
  
  name                            = each.value.name
  policy_assignment_id            = each.value.policy_assignment_id
  management_group_id             = each.value.management_group_id  # Required for MG exemptions
  exemption_category              = each.value.exemption_category
  
  display_name                    = lookup(each.value, "display_name", null)
  description                     = lookup(each.value, "description", null)
  expires_on                      = lookup(each.value, "expires_on", null)
  policy_definition_reference_ids = lookup(each.value, "policy_definition_reference_ids", null)
  metadata                        = lookup(each.value, "metadata", null) != null ? jsonencode(each.value.metadata) : null
}
