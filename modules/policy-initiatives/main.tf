resource "azurerm_policy_set_definition" "this" {
  for_each     = var.policy_set_definitions
  
  name                = each.value.name
  policy_type         = each.value.policy_type
  display_name        = each.value.display_name
  
  description         = lookup(each.value, "description", null)
  metadata            = lookup(each.value, "metadata", null) != null ? jsonencode(each.value.metadata) : null
  parameters          = lookup(each.value, "parameters_path", null) != null ? file(each.value.parameters_path) : null
  management_group_id = lookup(each.value, "management_group_id", null)

  dynamic "policy_definition_reference" {
    for_each = each.value.policy_definition_references
    content {
      policy_definition_id = policy_definition_reference.value.policy_definition_id
      parameter_values     = lookup(policy_definition_reference.value, "parameter_values", null) != null ? jsonencode(policy_definition_reference.value.parameter_values) : null
      policy_group_names   = lookup(policy_definition_reference.value, "policy_group_names", null)
      reference_id         = lookup(policy_definition_reference.value, "reference_id", null)
    }
  }

  dynamic "policy_definition_group" {
    for_each = lookup(each.value, "policy_definition_groups", [])
    content {
      name                            = policy_definition_group.value.name
      display_name                    = lookup(policy_definition_group.value, "display_name", null)
      category                        = lookup(policy_definition_group.value, "category", null)
      description                     = lookup(policy_definition_group.value, "description", null)
      additional_metadata_resource_id = lookup(policy_definition_group.value, "additional_metadata_resource_id", null)
    }
  }
}
