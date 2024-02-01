### Example

This command merges files containing localized content for one or more copilots.

```PowerShell
pac copilot merge-translation `
   --environment 2e250e7a-5607-4fea-aa4e-1aeb7bf79118 `
   --file ms_store_newTestCopilot.de-DE.json `
   --solution SolutionName
```

The command returns output like the following when updating the German language:

```Text
Connected as user@contoso.org

Loading language German into bot 'ms_store_newTestCopilot' (New Test Copilot) from file 'C:\Users\user\ms_store_newTestCopilot'. 0 key(s) were missing, 0 value(s) were not used. Use the --verbose switch to get more details.

Updated 16 out of 16 components.
```

[Learn about how to manage errors from the merge-translation command ](#merge-translation-errors)
