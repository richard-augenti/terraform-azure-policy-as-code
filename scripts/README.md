# scripts/

This folder contains utility scripts designed to simplify common tasks for Azure Policy and Terraform projects.

## Purpose

- Provide tools for policy file manipulation, conversion, and maintenance
- Help visualize, compare, or validate policy JSON files
- Enable bulk operations, such as exporting policy definitions, describing content, or searching for specific rules or metadata
- Assist with repository hygiene (e.g., linting, formatting, or cleanup scripts)

## Example Utility Script Types

- **Conversion scripts:** Convert policies between formats (e.g., JSON to CSV for reports)
- **Validation scripts:** Check for schema compliance, required fields, or duplicate definitions
- **Exploration scripts:** Generate summaries, graphs, or cross-references of policy definitions
- **Bulk operations:** Rename files, update metadata, or reorganize policy folders

## How to Use

- Scripts should be standalone, well-documented, and require minimal dependencies
- Usage guidelines and expected input/output should be described in comments at the top of each script
- Examples: `lint_policies.py`, `summarize_policies.sh`, `convert_json_to_csv.py`

## Best Practices

- Keep scripts focused and simple—avoid embedding business logic belonging in modules or pipelines
- Document script functionality, usage, and examples for discoverability
- Store only scripts useful for local developer and policy author workflows—not automation or deployment

## Example

A simple Python utility script to summarize policy definitions:

```
# summarize_policies.py
import json, glob

for file in glob.glob('../policies/**/*.json', recursive=True):
    with open(file) as f:
        data = json.load(f)
    print(f"{file}: {data['properties']['displayName']} ({data['properties']['metadata'].get('lastUpdated', 'N/A')})")
```

## Reference

- [Azure Policy Definition Structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-basics)
- [Python JSON documentation](https://docs.python.org/3/library/json.html)

---

_Utility scripts here help analyze, maintain, and improve policy files and repository hygiene for all contributors._
```
