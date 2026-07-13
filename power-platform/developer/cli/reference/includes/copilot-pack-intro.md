`pac copilot pack` packages an agent workspace into a Dataverse solution `.zip` that you can deploy with [`pac solution import`](../solution.md#pac-solution-import). It's the standalone form of the packaging step that [`pac copilot init --environment`](#pac-copilot-init) runs for you, so you can produce the deployable solution as a separate step — for example, in a build pipeline. It works for both classic and CLI-authored (CliCopilot) agent workspaces.

### Example

```PowerShell
pac copilot pack `
   --publisher-prefix contoso `
   --project-dir contoso-support `
   --output-path out
```