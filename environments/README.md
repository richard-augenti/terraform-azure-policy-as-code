# environments/

This folder contains environment-specific configuration and policy assignments, enabling separate control and customization for development, staging, and production scenarios.

## Purpose

- Organize all Terraform files, parameter overrides, and assignment logic by environment (e.g., `dev`, `staging`, `prod`)
- Allow safe, isolated experimentation and progressive rollout of policy changes
- Provide a logical separation for team workflows and CI/CD automation (if used)

## Structure

- **dev/**  
  Assignments, parameters, and overrides for the development environment  
- **staging/**  
  Assignments and configuration files for pre-production validation  
- **prod/**  
  Assignments for live, production usage (use branch protection and reviews!)

Inside each environment folder, you may find:
- Terraform `.tf` files for policy/initiative assignments scoped by environment
- Parameter files (`.tfvars` or JSON) for assignment-specific configuration
- Documentation and onboarding tips for environment-specific operations

## Best Practices

- Keep core policy definitions in the `/policies` folder; use `/environments` only for assignments and real-world parameters[web:15].
- Review and test changes in `dev` or `staging` before promoting to `prod`.
- Store only environment-specific overrides and assignments here—not the actual policy definitions.
- Use descriptive variable naming and comments to clarify environment and scope differences.

## Example

A typical environment folder may look like:

```
dev/
├── assignments.tf
├── parameters.tfvars
└── README.md

staging/
├── assignments.tf
└── parameters.tfvars

prod/
├── assignments.tf
└── parameters.tfvars
```

## Reference

- [Azure Policy as Code workflows](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/policy-as-code)
- [Terraform environment strategies](https://learn.microsoft.com/en-us/azure/developer/terraform/)

---

_Use this folder to keep environment assignments clean, modular, and ready for smooth, auditable deployments._
```
