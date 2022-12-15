### Examples

The following examples show the use of the `pac connector init` command.

- [Basic connector init](#basic-connector-init)
- [Basic connector init with output directory](#basic-connector-init-with-output-directory)
- [Advanced connector init with output directory and connection template for anonymous authentication](#advanced-connector-init-with-output-directory-and-connection-template-for-anonymous-authentication)
- [Advanced connector init with output directory and connection template for OAuth AAD authentication](#advanced-connector-init-with-output-directory-and-connection-template-for-oauth-aad-authentication)

#### Basic connector init

In this example, we'll init a connector in the current directory.

```powershell
pac connector init `
  --display-name "Connector Name" `
  --name "contoso_Connector"
```

#### Basic connector init with output directory

In this example, we'll init a connector in a new directory called `contoso_Connector`.

```powershell
pac connector init `
  --display-name "Connector Name" `
  --name "contoso_Connector" `
  --outputDirectory "contoso_Connector"
```

#### Advanced connector init with output directory and connection template for anonymous authentication

```powershell
pac connector init `
  --display-name "Connector Name" `
  --name "contoso_Connector" `
  --outputDirectory "contoso_Connector" `
  --connection-template "NoAuth"
```

#### Advanced connector init with output directory and connection template for OAuth AAD authentication

```powershell
pac connector init `
  --display-name "Connector Name" `
  --name "contoso_Connector" `
  --outputDirectory "contoso_Connector" `
  --connection-template "OAuthAAD"
```
