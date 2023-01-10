### Examples

The following examples show the use of the `pac connector create` command.

- [Basic connector creation in current environment](#basic-connector-creation-in-current-environment)
- [Basic connector creation in specified environment](#basic-connector-creation-in-specified-environment)

#### Basic connector creation in current environment

This example creates a connector in the environment of your currently active auth profile.

```powershell
pac connector create `
  --api-definition-file ./apiDefinition.json `
  --api-properties-file ./apiProperties.json
```

#### Basic connector creation in specified environment

This example creates a connector in the specified environment.

```powershell
pac connector create `
  --api-definition-file ./apiDefinition.json `
  --api-properties-file ./apiProperties.json
  --environment 00000000-0000-0000-0000-000000000000
```
