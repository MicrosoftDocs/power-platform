### Example

This command lists all copilots in the current or target Dataverse environment.

```PowerShell
pac copilot list --environment 2e250e7a-5607-4fea-aa4e-1aeb7bf79118
```

The command returns output like the following:

```Text
Name                           Bot ID                               Component State Is Managed Solution ID                          Status Code State Code
Ask Me Anything Copilot       584e012c-dc95-46d6-af5a-1263b6a44342 Published       Unmanaged  285af946-6383-49a0-8615-4e2afafeaf38 Active      Provisioned
New Test Copilot               9ee3f7aa-ab79-4cf6-a726-d85c8c18cc3e Published       Unmanaged  285af946-6383-49a0-8615-4e2afafeaf38 Active      Provisioned
```
