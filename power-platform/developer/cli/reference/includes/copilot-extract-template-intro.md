### Example

This command extracts a template file from an existing copilot in an environment.

```PowerShell
pac copilot extract-template `
   --environment 2e250e7a-5607-4fea-aa4e-1aeb7bf79118 `
   --bot 9ee3f7aa-ab79-4cf6-a726-d85c8c18cc3e `
   --templateFileName NewTestCopilot.yaml
```

The command returns output like the following for a copilot using the English and German languages:

```Text
Connected as user@contoso.org

Loaded 34 components for bot 'New Test Copilot ' with id 9ee3f7aa-ab79-4cf6-a726-d85c8c18cc3e. Primary language: English, supported languages: German

New Test Copilot -> C:\Users\user\NewTestCopilot.yaml
```
