output "policy_assignment_ids" {
  description = "The IDs of the created policy assignments"
  value       = { for k, v in azurerm_policy_assignment.this : k => v.id }
}

output "policy_assignment_names" {
  description = "The names of the created policy assignments"
  value       = { for k, v in azurerm_policy_assignment.this : k => v.name }
}

output "policy_assignments" {
  description = "All policy assignment resource attributes"
  value       = azurerm_policy_assignment.this
}
