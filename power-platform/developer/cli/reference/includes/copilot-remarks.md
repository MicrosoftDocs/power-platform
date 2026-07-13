## Authentication and environment for the sync commands

The `clone`, `pull`, `push`, and `init --environment` commands all talk to a Dataverse environment, so they need an authentication profile. Sign in first with [`pac auth create`](../auth.md#pac-auth-create).

- `clone`, `pull`, and `push` require an active profile. `pac copilot init` only needs one when you pass `--environment`; without it, `init` scaffolds files locally and needs no sign-in.
- `pull` and `push` read the target environment from the workspace's sync metadata, so they don't take an `--environment` argument. `clone` and `init` do.
- `pac copilot pack` is purely local. It reads and writes files only, so it needs no authentication and no environment.

`pull` and `push` only work inside a workspace created by `clone` or `init`. The sync metadata written when the workspace is created is what tells them which agent and environment to talk to, so running them anywhere else fails fast with a "workspace not found" error.