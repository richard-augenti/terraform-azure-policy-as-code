resource "azurerm_policy_assignment" "this" {
  for_each             = var.policy_assignments
  
  name                 = each.value.name
  policy_definition_id = each.value.policy_definition_id
  scope                = each.value.scope
  
  display_name         = lookup(each.value, "display_name", null)
  description          = lookup(each.value, "description", null)
  parameters           = lookup(each.value, "parameters_path", null) != null ? file(each.value.parameters_path) : null
  metadata             = lookup(each.value, "metadata", null) != null ? jsonencode(each.value.metadata) : null
  not_scopes           = lookup(each.value, "not_scopes", null)
  enforce              = lookup(each.value, "enforce", true)
  location             = lookup(each.value, "location", null)

  dynamic "identity" {
    for_each = lookup(each.value, "identity_type", null) != null ? [1] : []
    content {
      type         = each.value.identity_type
      identity_ids = lookup(each.value, "identity_ids", null)
    }
  }

  dynamic "non_compliance_message" {
    for_each = lookup(each.value, "non_compliance_messages", [])
    content {
      content                        = non_compliance_message.value.content
      policy_definition_reference_id = lookup(non_compliance_message.value, "policy_definition_reference_id", null)
    }
  }

  dynamic "overrides" {
    for_each = lookup(each.value, "overrides", [])
    content {
      kind  = overrides.value.kind
      value = overrides.value.value
      
      dynamic "selectors" {
        for_each = lookup(overrides.value, "selectors", [])
        content {
          kind = selectors.value.kind
          in   = lookup(selectors.value, "in", null)
          not_in = lookup(selectors.value, "not_in", null)
        }
      }
    }
  }

  dynamic "resource_selectors" {
    for_each = lookup(each.value, "resource_selectors", [])
    content {
      name = lookup(resource_selectors.value, "name", null)
      
      dynamic "selectors" {
        for_each = lookup(resource_selectors.value, "selectors", [])
        content {
          kind = selectors.value.kind
          in   = lookup(selectors.value, "in", null)
          not_in = lookup(selectors.value, "not_in", null)
        }
      }
    }
  }
}
