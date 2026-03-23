### Examples

Download a single generative page by its page ID to a local folder for editing:

```bash
pac model genpage download \
  --app-id "a1b2c3d4-1234-5678-abcd-000000000001" \
  --page-id "e5f6a7b8-abcd-ef01-2345-000000000010" \
  --output-directory ./pages/account-dashboard
```

Download all generative pages in an app at once:

```bash
pac model genpage download \
  --app-id "Contoso Sales Hub" \
  --output-directory ./pages
```

The command creates a subdirectory named after the page ID and writes the following files:

```
./pages/account-dashboard/
  e5f6a7b8-abcd-ef01-2345-000000000010/
    page.tsx          ← TypeScript source code
    page.js           ← Transpiled JavaScript
    RuntimeTypes.ts   ← Dataverse type definitions
    config.json       ← Page metadata
    prompt.txt        ← Original generation prompt
```
