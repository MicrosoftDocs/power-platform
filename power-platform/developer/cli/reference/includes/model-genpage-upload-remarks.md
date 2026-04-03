### `model genpage upload` examples

The following examples show common ways to use the `pac model genpage upload` command.

#### Publish a new generative page

Publish a new generative page to the Contoso Sales Hub app and add it to the app sitemap:

```bash
pac model genpage upload \
  --app-id "a1b2c3d4-1234-5678-abcd-000000000001" \
  --code-file ./pages/account-dashboard.tsx \
  --name "Account Dashboard" \
  --data-sources "account,contact" \
  --prompt "A dashboard showing Account records as interactive cards with contact count and revenue metrics." \
  --model "claude-sonnet-4-6" \
  --agent-message "Created account dashboard with card grid, revenue chart, and contact list. Uses account and contact tables." \
  --add-to-sitemap
```
#### Update an existing generative page

Update an existing generative page by providing its page ID (omit `--add-to-sitemap` to avoid creating a duplicate sitemap entry):

```bash
pac model genpage upload \
  --app-id "a1b2c3d4-1234-5678-abcd-000000000001" \
  --page-id "e5f6a7b8-abcd-ef01-2345-000000000010" \
  --code-file ./pages/account-dashboard.tsx \
  --data-sources "account,contact" \
  --prompt "A dashboard showing Account records as interactive cards with contact count and revenue metrics." \
  --model "claude-sonnet-4-6" \
  --agent-message "Updated card layout to use a two-column grid; added revenue sparkline chart."
```

#### Publish a page that uses mock data

Publish a page that uses mock data (no Dataverse tables — omit `--data-sources`):

```bash
pac model genpage upload \
  --app-id "Contoso Sales Hub" \
  --code-file ./pages/welcome-screen.tsx \
  --name "Welcome" \
  --prompt "A branded welcome screen with Contoso logo, quick-action tiles, and a news feed placeholder." \
  --model "claude-sonnet-4-6" \
  --agent-message "Welcome page with static mock data. No Dataverse queries." \
  --add-to-sitemap
```

> [!TIP]
> The `--app-id` parameter accepts either the app's GUID or its display name.
> If multiple apps share the same display name, use the GUID to avoid ambiguity.
> Run `pac model list` to look up app IDs.

### `model genpage upload` parameter quick-reference

| Parameter | Required | Description |
|---|---|---|
| `--app-id` | Yes | App GUID or display name. Run `pac model list` to find it. |
| `--code-file` | Yes | Path to the `.tsx` source file to deploy. |
| `--name` | New pages only | Display name shown in the app sitemap. |
| `--page-id` | Updates only | GUID of the existing page to replace. |
| `--data-sources` | Dataverse pages | Comma-separated list of Dataverse table logical names (e.g. `"account,contact"`). |
| `--prompt` | Recommended | Natural language summary of what the page does. Stored for regeneration context. |
| `--model` | Recommended | Model ID used to generate the page (e.g. `claude-sonnet-4-6`). |
| `--agent-message` | Recommended | Description of what was built or changed. Stored as change history. |
| `--add-to-sitemap` | New pages only | Adds the page to the app navigation automatically. Omit when updating. |
