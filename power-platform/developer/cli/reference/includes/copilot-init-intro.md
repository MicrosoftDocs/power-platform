`pac copilot init` scaffolds a new Copilot Studio agent workspace from a template. It runs in one of two modes, and the presence of `--environment` decides which mode to use:

- **Local scaffold** — no `--environment`. Writes the template files into the project directory and stops. The command doesn't create anything in Dataverse and doesn't require sign-in. Use this mode when you want to author locally and connect to an environment later.
- **Bootstrap** — `--environment` supplied. Scaffolds the files, packages them into a solution, imports that solution into the environment, and connects the workspace to the newly created agent. This mode is the one-step path from nothing to a live, sync-ready agent, and it requires an authenticated profile.

### Examples

Scaffold a workspace locally:

```PowerShell
pac copilot init `
   --name "Contoso Support Agent" `
   --publisher-prefix contoso
```

Scaffold and bootstrap a live agent in an environment in a single step:

```PowerShell
pac copilot init `
   --name "Contoso Support Agent" `
   --publisher-prefix contoso `
   --environment 22222222-2222-2222-2222-222222222222
```

Scaffold a CLI-authored (CliCopilot) agent into a specific folder:

```PowerShell
pac copilot init `
   --name "Contoso Support Agent" `
   --publisher-prefix contoso `
   --authoring-mode cli-copilot `
   --project-dir contoso-support
```