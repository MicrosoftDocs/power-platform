### Examples

The following examples show the use of the `pac connector update` command.

- [Basic connector update in current environment](#basic-connector-update-in-current-environment)
- [Basic connector update in specified environment](#basic-connector-update-in-specified-environment)

#### Basic connector update in current environment

This example updates a connector in the environment of your currently active auth profile.

```powershell
pac connector update `
  --api-definition-file ./apiDefinition.json
```

#### Basic connector update in specified environment

This example updates a connector in the specified environment.

```powershell
pac connector update `
  --api-definition-file ./apiDefinition.json `
  --environment 00000000-0000-0000-0000-000000000000
```
