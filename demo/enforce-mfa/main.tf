# MFA Enforcement Policy Configuration
# This configuration creates and assigns a policy to enforce MFA

module "mfa_policy_definition" {
  source = "../../modules/policy-definitions"

  policy_definitions = {
    "enforce-mfa" = {
      name                = "enforce-mfa"
      policy_type         = "Custom"
      mode               = "All"
      display_name       = "Enforce Multi-Factor Authentication"
      description        = "Enforces multi-factor authentication for resource access"
      policy_rule_path   = "${path.module}/policy-definition.json"
      metadata = {
        category = "Security"
        version  = "1.0.0"
      }
    }
  }
}

module "mfa_policy_assignment" {
  source = "../../modules/policy-assignments"

  policy_assignments = {
    "enforce-mfa-assignment" = {
      name                 = "enforce-mfa-assignment"
      policy_definition_id = module.mfa_policy_definition.policy_definition_ids["enforce-mfa"]
      scope                = var.scope
      display_name         = "Enforce MFA Assignment"
      description          = "Assigns the MFA enforcement policy"
      enforce              = var.enforce
    }
  }
}
