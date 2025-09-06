resource "azurerm_policy_definition" "this" {
  for_each     = var.policy_definitions
  
  name         = each.value.name
  policy_type  = each.value.policy_type
  mode         = each.value.mode
  display_name = each.value.display_name
  policy_rule  = file(each.value.policy_rule_path)
  
  description     = lookup(each.value, "description", null)
  metadata        = lookup(each.value, "metadata", null) != null ? jsonencode(each.value.metadata) : null
  parameters      = lookup(each.value, "parameters_path", null) != null ? file(each.value.parameters_path) : null
  management_group_id = lookup(each.value, "management_group_id", null)
}
