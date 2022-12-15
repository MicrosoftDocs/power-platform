### Examples

The following examples show the use of the `pac admin copy` command.

- [Copy an environment from a source environment to a target environment using a minimal copy](#copy-an-environment-from-a-source-environment-to-a-target-environment-using-a-minimal-copy)
- [Copy an environment from a source environment to a target environment using a full copy](#copy-an-environment-from-a-source-environment-to-a-target-environment-using-a-full-copy)

#### Copy an environment from a source environment to a target environment using a minimal copy

This example copies over customizations and schemas only from a source environment to a target environment.

```powershell
pac admin copy `
  --name "Environment Name" `
  --source-env 00000000-0000-0000-0000-000000000000 `
  --target-env 00000000-0000-0000-0000-000000000000 `
  --type MinimalCopy
```

#### Copy an environment from a source environment to a target environment using a full copy

This example copies the whole environment over from a source environment to a target environment.

```powershell
pac admin copy `
  --name "Environment Name" `
  --source-env 00000000-0000-0000-0000-000000000000 `
  --target-env 00000000-0000-0000-0000-000000000000 `
  --type FullCopy
```
