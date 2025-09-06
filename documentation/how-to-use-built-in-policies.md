# Using Azure Built-In Policies with Terraform

This guide shows how to use **built-in Azure Policy definitions** in Terraform, so you can assign policies provided by Microsoft for governance or security controls—without needing to author custom definitions.

---

## Overview

Azure provides many built-in policy definitions to enforce standards such as allowed resource locations, resource types, or security configurations. Terraform allows you to **assign** these built-in policies by referencing their definition IDs and passing parameters, avoiding the need to re-create their definitions in your IaC code.

---

## Steps

### 1. Find Built-In Policy Definition ID

- Browse the [Azure Policy built-in policy list].
- Copy the `policyDefinitionId` for the policy you want, e.g.:
  ```
  /providers/Microsoft.Authorization/policyDefinitions/<policy-guid>
  ```

### 2. Retrieve Built-In Policy in Terraform

Use the `azurerm_policy_definition_built_in` data source to get the built-in policy’s ID:

```
data "azurerm_policy_definition_built_in" "policy" {
  name = "Allowed locations"
}
```
- The policy’s name must match the built-in policy name.

### 3. Assign the Built-In Policy

Assign the policy to your desired scope (subscription, resource group, etc.):

```
resource "azurerm_policy_assignment" "allowed_locations_assignment" {
  name                 = "allowed-locations-assignment"
  policy_definition_id = data.azurerm_policy_definition_built_in.policy.id
  scope                = "/subscriptions/<subscription-id>"
  parameters           = jsonencode({
    "listOfAllowedLocations" = { "value" = ["eastus"] }
  })
}
```

You can use [azurerm_policy_assignment] for subscriptions or resource groups.

---

## Key Points

- **No need to re-create built-in definitions.** Reference their IDs using the data source or use the ID directly.
- **Scopes:** Assignment can be at management group, subscription, resource group, or specific resource.
- **Parameters:** Pass any required parameters for the policy in the assignment configuration.

---

## References

- [Quickstart: Assign policies with Terraform - Microsoft](https://learn.microsoft.com/en-us/azure/governance/policy/assign-policy-terraform)
- [List of Built-In Azure Policies](https://learn.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies)
- [azurerm_policy_definition_built_in Data Source](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/policy_definition_built_in)
- [azurerm_policy_assignment Resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_assignment)

All information is accurate as of September 2025 and leverages official Azure and Terraform documentation.
```

You can now copy and paste this directly—everything is preserved for easy transfer.
