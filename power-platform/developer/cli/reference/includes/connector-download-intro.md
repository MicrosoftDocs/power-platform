### Examples

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
