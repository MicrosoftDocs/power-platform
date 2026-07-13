### Remarks

- **Run it inside a sync workspace.** Like `pull`, `push` only works in a folder created by [`pac copilot clone`](#pac-copilot-clone) or [`pac copilot init`](#pac-copilot-init). It reads the target environment from the workspace's sync metadata. There's no `--environment` argument.
- **Pull first if there's a conflict.** If the same item changed both locally and on the server, push stops and asks you to run [`pac copilot pull`](#pac-copilot-pull) before trying again. This process keeps a push from silently overwriting a server-side change you didn't see.
- **No local changes is a no-op.** If push finds nothing to send, it reports that and exits without touching the environment.
- **A successful push mutates the live agent** in the target environment.
- Sign in first with [`pac auth create`](../auth.md#pac-auth-create).