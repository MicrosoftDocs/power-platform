### Examples

**Create a new model-driven app** in the active environment:

```bash
pac model create --name "Contoso Sales Hub"
```

**Create an app with a description and add it to a solution**, then publish immediately:

```bash
pac model create \
  --name "Contoso Sales Hub" \
  --description "Central hub for managing Contoso sales activities, accounts, and contacts." \
  --solution "ContosoSales" \
  --publish
```

**Create an app in a specific environment** by providing the environment URL:

```bash
pac model create \
  --name "Contoso Sales Hub" \
  --description "Central hub for managing Contoso sales activities, accounts, and contacts." \
  --environment "https://contoso.crm.dynamics.com" \
  --solution "ContosoSales" \
  --publish
```

> [!TIP]
> Use `pac model list` to verify the app was created and retrieve its app ID for use with other commands such as `pac model genpage upload`.
