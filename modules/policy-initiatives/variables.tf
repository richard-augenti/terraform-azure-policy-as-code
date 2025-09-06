variable "policy_set_definitions" {
  description = "A map of policy set (initiative) definition objects"
  type = map(object({
    name                = string
    policy_type         = string
    display_name        = string
    description         = optional(string)
    metadata            = optional(map(string))
    parameters_path     = optional(string)
    management_group_id = optional(string)
    
    policy_definition_references = list(object({
      policy_definition_id = string
      parameter_values     = optional(map(any))
      policy_group_names   = optional(list(string))
      reference_id         = optional(string)
    }))
    
    policy_definition_groups = optional(list(object({
      name                            = string
      display_name                    = optional(string)
      category                        = optional(string)
      description                     = optional(string)
      additional_metadata_resource_id = optional(string)
    })), [])
  }))
  default = {}
}
