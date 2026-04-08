---
title: Environment variables reference for Power Platform Playwright Samples
description: Complete reference for all environment variables used by Power Platform Playwright Samples, including authentication, app URLs, and configuration flags.
author: deepakkamboj
ms.author: dekamb
ms.topic: reference
ms.date: 04/07/2025
ms.subservice: developer
---

# Environment variables reference

All configuration is passed to tests through environment variables. For local development, set these in `packages/e2e-tests/.env`. In CI/CD, set them as pipeline secrets or variables. See [CI/CD integration](cicd.md) for pipeline-specific instructions.

## Authentication variables

| Variable | Required | Description |
|---|---|---|
| `MS_AUTH_EMAIL` | Yes | Email address of the test user account |
| `MS_AUTH_CREDENTIAL_TYPE` | Yes | Authentication method: `password` or `certificate` |
| `MS_USER_PASSWORD` | If `credential_type=password` | Password for the test user |
| `MS_AUTH_CREDENTIAL_PROVIDER` | If `credential_type=certificate` | Certificate source: `local-file` or `azure-keyvault` |
| `MS_AUTH_LOCAL_FILE_PATH` | If `provider=local-file` | Relative path to the `.pfx` certificate file |
| `MS_AUTH_CERTIFICATE_PASSWORD` | No | Password for the `.pfx` certificate (if protected) |

## Azure Key Vault variables

Required when `MS_AUTH_CREDENTIAL_PROVIDER=azure-keyvault`:

| Variable | Description |
|---|---|
| `AZURE_KEYVAULT_URL` | Key Vault URL, e.g., `https://<vault-name>.vault.azure.net/` |
| `AZURE_CERTIFICATE_NAME` | Name of the certificate stored in Key Vault |
| `AZURE_TENANT_ID` | Microsoft Entra tenant ID |
| `AZURE_CLIENT_ID` | (Optional) Service principal client ID for federated identity |

## App URL variables

| Variable | Required | Description |
|---|---|---|
| `CANVAS_APP_URL` | For canvas tests | Full play-mode URL of your canvas app, including `?tenantId=<id>` |
| `MODEL_DRIVEN_APP_URL` | For MDA tests | Full URL of your model-driven app (`/main.aspx?appid=<id>`) |
| `CUSTOM_PAGE_NAME` | For custom page tests | Display name of the custom page sitemap item, e.g., `AccountsCustomPage` |

### Build the canvas app URL

Use `buildCanvasAppUrlFromEnv()` from the toolkit to construct the URL from individual parts if needed:

```typescript
import { buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

const url = buildCanvasAppUrlFromEnv();
// Reads CANVAS_APP_URL from environment
```

Or set it explicitly in `.env`:

```ini
CANVAS_APP_URL=https://apps.powerapps.com/play/e/default-<tenant-id>/a/<app-id>?tenantId=<tenant-id>
```

### Get the model-driven app URL

1. Open the model-driven app in play mode.
2. Copy the URL from the browser address bar.
3. Remove query parameters after `appid=<guid>` that are session-specific.

```ini
MODEL_DRIVEN_APP_URL=https://<org>.crm.dynamics.com/main.aspx?appid=<app-guid>
```

## Storage state variables

These are computed by the toolkit from `MS_AUTH_EMAIL`. You don't set them directly.

| Path | Description |
|---|---|
| `.playwright-ms-auth/state-<email>.json` | Maker Portal auth state (canvas/Gen UX tests) |
| `.playwright-ms-auth/state-mda-<email>.json` | Dynamics 365 auth state (MDA tests) |

Override the storage state directory:

```ini
MS_AUTH_STORAGE_DIR=../../.auth
```

## CI/CD flag

| Variable | Default | Description |
|---|---|---|
| `CI` | `false` | Set to `true` in CI to enable `retries: 1`, `forbidOnly`, and stricter timeouts |

Playwright reads `CI` automatically. You don't need to set it in `.env` — pipeline environments set it by convention.

## Sample .env file

```ini
# Authentication
MS_AUTH_EMAIL=testuser@contoso.com
MS_AUTH_CREDENTIAL_TYPE=password
MS_USER_PASSWORD=<your-password>

# App URLs
CANVAS_APP_URL=https://apps.powerapps.com/play/e/default-<tenant-id>/a/<app-id>?tenantId=<tenant-id>
MODEL_DRIVEN_APP_URL=https://<org>.crm.dynamics.com/main.aspx?appid=<app-id>
CUSTOM_PAGE_NAME=AccountsCustomPage
```

For certificate authentication:

```ini
# Authentication (certificate)
MS_AUTH_EMAIL=testuser@contoso.com
MS_AUTH_CREDENTIAL_TYPE=certificate
MS_AUTH_CREDENTIAL_PROVIDER=local-file
MS_AUTH_LOCAL_FILE_PATH=../../cert/testuser.pfx
MS_AUTH_CERTIFICATE_PASSWORD=<pfx-password>

# App URLs
CANVAS_APP_URL=https://apps.powerapps.com/play/...
MODEL_DRIVEN_APP_URL=https://<org>.crm.dynamics.com/...
```

For Azure Key Vault:

```ini
# Authentication (Key Vault)
MS_AUTH_EMAIL=testuser@contoso.com
MS_AUTH_CREDENTIAL_TYPE=certificate
MS_AUTH_CREDENTIAL_PROVIDER=azure-keyvault
AZURE_KEYVAULT_URL=https://mykeyvault.vault.azure.net/
AZURE_CERTIFICATE_NAME=playwright-test-cert
AZURE_TENANT_ID=<tenant-guid>

# App URLs
CANVAS_APP_URL=https://apps.powerapps.com/play/...
MODEL_DRIVEN_APP_URL=https://<org>.crm.dynamics.com/...
```

## Security notes

- Never commit `.env` files to source control. The `.gitignore` in the repo excludes them.
- Never commit `.playwright-ms-auth/` state files. They contain session tokens.
- In CI/CD, set all secrets via the pipeline's secret store, not in checked-in YAML.

## Next steps

- [Authentication guide](authentication-guide.md)
- [CI/CD integration](cicd.md)
- [Configuration reference](configuration.md)

## See also

- [Authentication overview](authentication.md)
- [Get started](get-started.md)
