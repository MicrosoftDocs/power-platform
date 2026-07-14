`pac copilot push` sends the changes in your local workspace back to the agent in Dataverse. It compares your files against the last-known server state, uploads only what changed - including knowledge files, cloud flows, and connection references - and reports what it pushed.

### Example

Run it from inside the workspace folder:

```PowerShell
pac copilot push
```

Or point it at a workspace elsewhere on disk:

```PowerShell
pac copilot push --project-dir contoso-support
```