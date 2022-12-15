### Examples

The following examples show the use of the `pac connector list` command.

- [List connectors in current environment](#list-connectors-in-current-environment)
- [List connectors in specified environment](#list-connectors-in-specified-environment)

#### List connectors in current environment

This example lists all the connectors in the environment of your currently active auth profile.

```powershell
pac connector list
```

#### List connectors in specified environment

This example lists all the connectors in the specified environment.

```powershell
pac connector list `
  --environment 00000000-0000-0000-0000-000000000000
```
