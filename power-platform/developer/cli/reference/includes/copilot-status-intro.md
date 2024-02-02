### Example

This command polls the deployment status of a specified copilot in the current or target Dataverse environment.

```PowerShell
pac copilot status `
   --environment 2e250e7a-5607-4fea-aa4e-1aeb7bf79118 `
   --bot-id 9ee3f7aa-ab79-4cf6-a726-d85c8c18cc3e
```

The command returns output like the following:

```Text
Connected as user@contoso.org
Connected to... Contoso Organization
Virtual Agent New Bot German with ID 9ee3f7aa-ab79-4cf6-a726-d85c8c18cc3e has been provisioned.
```
