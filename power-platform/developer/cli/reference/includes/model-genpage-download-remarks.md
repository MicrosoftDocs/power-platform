### pac model genpage download examples

The following examples show common ways to use the `pac model genpage download` command.

- [Download a single generative page by its page ID to a local folder for editing](#download-a-single-generative-page-by-its-page-id-to-a-local-folder-for-editing)
- [Download all generative pages in an app at once](#download-all-generative-pages-in-an-app-at-once)
- [Create a subdirectory named after the page ID and writes the following files](#create-a-subdirectory-named-after-the-page-id-and-writes-the-following-files)

#### Download a single generative page by its page ID to a local folder for editing

```bash
pac model genpage download \
  --app-id "a1b2c3d4-1234-5678-abcd-000000000001" \
  --page-id "e5f6a7b8-abcd-ef01-2345-000000000010" \
  --output-directory ./pages/account-dashboard
```

#### Download all generative pages in an app at once

```bash
pac model genpage download \
  --app-id "Contoso Sales Hub" \
  --output-directory ./pages
```

#### Create a subdirectory named after the page ID and writes the following files

```
./pages/account-dashboard/
  e5f6a7b8-abcd-ef01-2345-000000000010/
    page.tsx          ← TypeScript source code
    page.js           ← Transpiled JavaScript
    RuntimeTypes.ts   ← Dataverse type definitions
    config.json       ← Page metadata
    prompt.txt        ← Original generation prompt
```
