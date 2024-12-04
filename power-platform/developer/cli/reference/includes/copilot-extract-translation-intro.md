### Example

This command extracts a file containing localized content for one or more copilots.

```PowerShell
pac copilot extract-translation `
   --environment 2e250e7a-5607-4fea-aa4e-1aeb7bf79118 `
   --bot 9ee3f7aa-ab79-4cf6-a726-d85c8c18cc3e `
   --all `
   --outdir . `
   --format json
```

The command returns output like the following:

```Text
Connected as user@contoso.org

Loaded 32 components for bot 'New Test Copilot' with id 9ee3f7aa-ab79-4cf6-a726-d85c8c18cc3e. Primary language: English, supported languages: German
```
