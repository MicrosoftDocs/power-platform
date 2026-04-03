### pac model genpage list examples

The following examples show common ways to use the `pac model genpage list` command.

- [List pages using app ID](#list-pages-using-app-id)
- [List pages using app name](#list-pages-using-app-name)

#### List pages using app ID

List all generative pages in the **Contoso Sales Hub** app using its app ID:

```bash
pac model genpage list --app-id "a1b2c3d4-1234-5678-abcd-000000000001"
```

#### List pages using app name

List generative pages by app name (the CLI looks up the app ID automatically):

```bash
pac model genpage list --app-id "Contoso Sales Hub"
```

#### pac model genpage sample output

```
Found 2 generated page(s):

  Account Dashboard
    Page ID: e5f6a7b8-abcd-ef01-2345-000000000010
    Description: Created: 2026-01-15T10:22:00Z

  Opportunity Tracker
    Page ID: e5f6a7b8-abcd-ef01-2345-000000000011
    Description: Created: 2026-02-03T14:05:00Z
```
