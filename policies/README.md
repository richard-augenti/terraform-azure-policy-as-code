# policies/

This folder contains all Azure Policy definitions used across environments, organized by domain for clarity and modularity.

## Structure

- **security/**  
  Security-related policy definitions (e.g. network security, encryption, access control).

- **compliance/**  
  Regulatory and data protection policies, such as GDPR, HIPAA, or company-specific controls.

- **governance/**  
  Organizational standards, such as resource tagging, structure, cost management, or naming conventions.

Each subfolder should group policy JSON files by logical theme, making it easy to discover, curate, and update definitions.

## Authoring Guidelines

- All policies are defined as JSON files, using the standard Azure Policy definition schema.  
- Each policy should include metadata describing its purpose, maintainer, and last updated date.
- Use descriptive filenames that reflect the policy function (e.g. `network_security.json`, `regulatory_controls.json`).

## Best Practices

- Version control every policy change. Use clear commit messages and review with stakeholders for compliance-related policies.
- Keep policy logic separated from environment-specific assignments—policies here should be "pure" definition files.
- Reference policies in Terraform modules using local file paths and avoid embedding logic in HCL.

## Example

A security policy might look like:

```
{
  "properties": {
    "displayName": "Enforce HTTPS for Web Apps",
    "policyType": "Custom",
    "mode": "All",
    "description": "Ensures that HTTPS is enabled for all Azure Web Apps.",
    "metadata": {
      "category": "App Service",
      "version": "1.0",
      "lastUpdated": "2025-09-06"
    },
    "parameters": {},
    "policyRule": {
      "if": {
        "field": "Microsoft.Web/sites/httpsOnly",
        "equals": "false"
      },
      "then": {
        "effect": "deny"
      }
    }
  }
}
```

## Reference

- For Azure Policy definition schema and samples, see [Microsoft's documentation](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-basics).
- For guidance on policy authoring, see [Azure Policy documentation](https://learn.microsoft.com/en-us/azure/governance/policy/).

---

_Maintain policies here with care, as they drive organization-wide security, compliance, and governance._

```
