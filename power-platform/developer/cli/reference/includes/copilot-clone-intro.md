`pac copilot clone` downloads an existing Copilot Studio agent into a local workspace directory, together with the sync metadata that [`pac copilot pull`](#pac-copilot-pull) and [`pac copilot push`](#pac-copilot-push) rely on. The agent's files are written to a subfolder named after its display name.

### Example

```PowerShell
pac copilot clone `
   --bot 11111111-1111-1111-1111-111111111111 `
   --environment 22222222-2222-2222-2222-222222222222 `
   --output-dir contoso-support
```