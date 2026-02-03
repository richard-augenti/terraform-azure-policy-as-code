variable "scope" {
  description = "The scope at which to assign the policy (subscription, resource group, or management group)"
  type        = string
}

variable "enforce" {
  description = "Whether to enforce the policy (true) or only audit (false)"
  type        = bool
  default     = true
}
