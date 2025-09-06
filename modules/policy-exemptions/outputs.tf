output "resource_policy_exemption_ids" {
  description = "The IDs of the created resource-level policy exemptions"
  value       = { for k, v in azurerm_resource_policy_exemption.resource : k => v.id }
}

output "resource_group_policy_exemption_ids" {
  description = "The IDs of the created resource group-level policy exemptions"
  value       = { for k, v in azurerm_resource_group_policy_exemption.resource_group : k => v.id }
}

output "subscription_policy_exemption_ids" {
  description = "The IDs of the created subscription-level policy exemptions"
  value       = { for k, v in azurerm_subscription_policy_exemption.subscription : k => v.id }
}

output "management_group_policy_exemption_ids" {
  description = "The IDs of the created management group-level policy exemptions"
  value       = { for k, v in azurerm_management_group_policy_exemption.management_group : k => v.id }
}

output "all_policy_exemption_ids" {
  description = "All policy exemption IDs grouped by scope"
  value = {
    resource         = { for k, v in azurerm_resource_policy_exemption.resource : k => v.id }
    resource_group   = { for k, v in azurerm_resource_group_policy_exemption.resource_group : k => v.id }
    subscription     = { for k, v in azurerm_subscription_policy_exemption.subscription : k => v.id }
    management_group = { for k, v in azurerm_management_group_policy_exemption.management_group : k => v.id }
  }
}