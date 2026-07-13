### Remarks

- **It's a local operation.** Pack reads the workspace and writes a solution `.zip`. It needs no authentication and no environment, so it's safe to run in a build pipeline.
- **The publisher prefix must be valid.** `--publisher-prefix` must be a well-formed customization prefix, or pack stops before writing anything.
- **Solution name and output.** If you omit `--solution-name`, the solution's unique name is derived from the agent schema name. The `.zip` is written to the current directory unless you set `--output-path`.
- **Pack doesn't deploy.** It produces the solution but doesn't import it. Follow it with [`pac solution import`](../solution.md#pac-solution-import) to deploy the agent, then [`pac copilot clone`](#pac-copilot-clone) if you want a sync-connected workspace for it.