### Example

The following example shows the use of the `pac connector init` command.

#### Connector init with output directory and connection template for Microsoft Entra ID OAuth authentication

This example initializes a connector in the current directory.

```powershell
pac connector init `
  --connection-template "OAuthAAD" `
  --generate-script-file "contoso_script_file" `
  --generate-settings-file "contoso_settings_file" `
  --outputDirectory "contoso_Connector"
```
