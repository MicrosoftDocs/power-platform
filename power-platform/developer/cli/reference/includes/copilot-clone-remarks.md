### Remarks

- **`--bot` accepts a Copilot ID or schema name.** Pass either the Copilot ID (a GUID) or the agent's schema name. The command resolves a schema name against the target environment.
- **The destination subfolder must be empty.** Clone writes into a folder named after the agent's (sanitized) display name under `--output-dir`. If that folder already contains files, clone stops rather than overwrites them. Use `--display-name` to choose a different folder name.
- **Cloning component collections.** To bring component collections down alongside the agent, pass one or more collection IDs with `--component-collection`, separated by semicolons.
- Clone requires an authenticated profile ([`pac auth create`](../auth.md#pac-auth-create)) and resolves the environment from `--environment`, or from the active profile's organization when you omit it.