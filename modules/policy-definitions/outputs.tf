output "policy_definition_ids" {
  description = "The IDs of the created policy definitions"
  value       = { for k, v in azurerm_policy_definition.this : k => v.id }
}

output "policy_definition_names" {
  description = "The names of the created policy definitions"
  value       = { for k, v in azurerm_policy_definition.this : k => v.name }
}

output "policy_definitions" {
  description = "All policy definition resource attributes"
  value       = azurerm_policy_definition.this
}
