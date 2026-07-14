### Remarks

- **Run it inside a sync workspace.** The `pull` command works only in a folder created by [`pac copilot clone`](#pac-copilot-clone) or [`pac copilot init`](#pac-copilot-init). It reads the target environment and agent from the workspace's sync metadata, which is why there's no `--environment` argument. If you run it anywhere else, it fails with a "workspace not found" error.
- **It writes to your local files.** Pull merges remote changes into the workspace and downloads knowledge files. Commit or back up local work you care about before pulling.
- Sign in first with [`pac auth create`](../auth.md#pac-auth-create).