The `init`, `clone`, `pull`, `push`, and `pack` commands let you keep a Copilot Studio agent as a set of files on disk, edit it locally, and synchronize it with a Dataverse environment.

A typical loop looks like this:

1. **Start a workspace.** Scaffold a brand-new agent with [`pac copilot init`](#pac-copilot-init), or download an existing one with [`pac copilot clone`](#pac-copilot-clone). Either way you get a local workspace that carries the sync metadata the other commands depend on.
1. **Pull before you edit.** [`pac copilot pull`](#pac-copilot-pull) brings remote changes down and merges them into your local files, so you start from the current server state.
1. **Push when you're done.** [`pac copilot push`](#pac-copilot-push) sends your local changes back. If the same item changed on the server in the meantime, push stops and asks you to pull first.
1. **Package for deployment.** [`pac copilot pack`](#pac-copilot-pack) turns a workspace into a solution `.zip` you can deploy with [`pac solution import`](../solution.md#pac-solution-import).

To go from nothing to a live agent in a single step, [`pac copilot init --environment`](#pac-copilot-init) scaffolds, packs, imports, and connects the workspace for you. The individual commands let you drive each part of the loop on its own.