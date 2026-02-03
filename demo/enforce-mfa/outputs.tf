output "policy_definition_id" {
  description = "ID of the created MFA policy definition"
  value       = module.mfa_policy_definition.policy_definition_ids["enforce-mfa"]
}

output "policy_assignment_id" {
  description = "ID of the MFA policy assignment"
  value       = module.mfa_policy_assignment.policy_assignment_ids["enforce-mfa-assignment"]
}
