variable "policy_definitions" {
  description = "A map of policy definition objects"
  type = map(object({
    name                = string
    policy_type         = string
    mode               = string
    display_name       = string
    policy_rule_path   = string
    description        = optional(string)
    metadata           = optional(map(string))
    parameters_path    = optional(string)
    management_group_id = optional(string)
  }))
  default = {}
}

