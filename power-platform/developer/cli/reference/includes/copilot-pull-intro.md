The `pac copilot pull` command fetches the current server state of the agent and merges it into your local workspace by using a three-way merge. This process ensures that server-side edits and your untouched local files both stay intact. Run it before you start editing, and run it again before you push your changes.

### Example

Run the command from inside the workspace folder:

```PowerShell
pac copilot pull
```

Or point it at a workspace elsewhere on disk:

```PowerShell
pac copilot pull --project-dir contoso-support
```