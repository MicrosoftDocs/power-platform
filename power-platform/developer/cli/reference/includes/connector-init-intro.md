### Examples

The following example show the use of the `pac connector init` command.

#### Connector init with output directory and connection template for OAuth AAD authentication

In this example, we'll init a connector in the current directory.

```powershell
pac connector init `
  --connection-template "OAuthAAD" `
  --generate-script-file "contoso_script_file" `
  --generate-settings-file "contoso_settings_file" `
  --outputDirectory "contoso_Connector"
```
