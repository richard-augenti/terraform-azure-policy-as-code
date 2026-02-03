# Enforce MFA Policy

This folder contains a Terraform configuration that creates and assigns an Azure Policy to enforce Multi-Factor Authentication (MFA).

## Usage

This configuration uses the repository's modules to:
1. Create a custom policy definition for MFA enforcement
2. Assign that policy to a specified scope

## Prerequisites

- Azure subscription with appropriate permissions
- Terraform >= 1.0
- Azure CLI configured and authenticated

## Configuration

Update the `scope` variable to target your desired Azure scope:
- Subscription: `/subscriptions/{subscription-id}`
- Resource Group: `/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}`
- Management Group: `/providers/Microsoft.Management/managementGroups/{management-group-id}`

## Example Usage

```hcl
module "enforce_mfa" {
  source = "./demo/enforce-mfa"
  
  scope   = "/subscriptions/00000000-0000-0000-0000-000000000000"
  enforce = true
}
```

## Policy Definition

The policy definition is stored in `policy-definition.json`. You may need to customize this based on your specific MFA enforcement requirements.

## Notes

- The example policy definition is a template and may need adjustment for your specific use case
- Azure Policy for MFA typically works with Azure AD Conditional Access policies
- Review the policy effect (audit vs deny) before applying to production
