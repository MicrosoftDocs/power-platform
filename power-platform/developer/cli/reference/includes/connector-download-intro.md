### Examples

The following examples show the use of the `pac connector download` command.

- [Basic connector download](#basic-connector-download)
- [Basic connector download from specified environment](#basic-connector-download-from-specified-environment)
- [Basic connector download from specified environment to the specified directory](#basic-connector-download-from-specified-environment-to-the-specified-directory)

#### Basic connector download

This example downloads the specified connector to the current directory.

```powershell
pac connector download `
  --connector-id 00000000-0000-0000-0000-000000000000 
```

#### Basic connector download from specified environment

This example downloads the specified connector from the specified environment to the current directory.

```powershell
pac connector download `
  --connector-id 00000000-0000-0000-0000-000000000000 `
  --environment 00000000-0000-0000-0000-000000000000 
```

#### Basic connector download from specified environment to the specified directory

This example downloads the specified connector from the specified environment to the specified directory.

```powershell
pac connector download `
  --connector-id 00000000-0000-0000-0000-000000000000 `
  --environment 00000000-0000-0000-0000-000000000000 `
  --outputDirectory "contoso_Connector"
```
