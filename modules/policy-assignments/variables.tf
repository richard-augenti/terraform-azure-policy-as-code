variable "policy_assignments" {
  description = "A map of policy assignment objects"
  type = map(object({
    name                 = string
    policy_definition_id = string
    scope                = string
    display_name         = optional(string)
    description          = optional(string)
    parameters_path      = optional(string)
    metadata             = optional(map(string))
    not_scopes           = optional(list(string))
    enforce              = optional(bool, true)
    location             = optional(string)
    identity_type        = optional(string)
    identity_ids         = optional(list(string))
    
    non_compliance_messages = optional(list(object({
      content                        = string
      policy_definition_reference_id = optional(string)
    })), [])
    
    overrides = optional(list(object({
      kind  = string
      value = string
      selectors = optional(list(object({
        kind   = string
        in     = optional(list(string))
        not_in = optional(list(string))
      })), [])
    })), [])
    
    resource_selectors = optional(list(object({
      name = optional(string)
      selectors = list(object({
        kind   = string
        in     = optional(list(string))
        not_in = optional(list(string))
      }))
    })), [])
  }))
  default = {}
}
