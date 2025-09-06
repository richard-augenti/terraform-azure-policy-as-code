variable "policy_exemptions" {
  description = "A map of policy exemption objects"
  type = map(object({
    name                            = string
    policy_assignment_id            = string
    exemption_scope                 = string  # "resource", "resource_group", "subscription", "management_group"
    exemption_category              = string
    display_name                    = optional(string)
    description                     = optional(string)
    expires_on                      = optional(string)
    policy_definition_reference_ids = optional(list(string))
    metadata                        = optional(map(string))
    
    # Scope-specific required fields (use only the one matching exemption_scope)
    resource_id         = optional(string)  # Required when exemption_scope = "resource"
    resource_group_id   = optional(string)  # Required when exemption_scope = "resource_group"
    subscription_id     = optional(string)  # Required when exemption_scope = "subscription"
    management_group_id = optional(string)  # Required when exemption_scope = "management_group"
  }))
  default = {}
  
  validation {
    condition = alltrue([
      for k, v in var.policy_exemptions : 
      contains(["Waiver", "Mitigated"], v.exemption_category)
    ])
    error_message = "exemption_category must be either 'Waiver' or 'Mitigated'."
  }
  
  validation {
    condition = alltrue([
      for k, v in var.policy_exemptions : 
      contains(["resource", "resource_group", "subscription", "management_group"], v.exemption_scope)
    ])
    error_message = "exemption_scope must be one of: 'resource', 'resource_group', 'subscription', 'management_group'."
  }
}