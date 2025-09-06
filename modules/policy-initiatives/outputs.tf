output "policy_set_definition_ids" {
  description = "The IDs of the created policy set definitions"
  value       = { for k, v in azurerm_policy_set_definition.this : k => v.id }
}

output "policy_set_definition_names" {
  description = "The names of the created policy set definitions"
  value       = { for k, v in azurerm_policy_set_definition.this : k => v.name }
}

output "policy_set_definitions" {
  description = "All policy set definition resource attributes"
  value       = azurerm_policy_set_definition.this
}
