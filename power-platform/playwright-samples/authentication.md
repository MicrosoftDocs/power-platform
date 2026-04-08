---
title: Authentication overview for Power Platform Playwright Samples
description: Understand how Power Platform Playwright Samples manages authentication across the Maker Portal and Dynamics 365 domains using storage state files.
author: microsoft
ms.author: deepak.kamboj
ms.topic: conceptual
ms.date: 04/07/2025
ms.subservice: power-platform-playwright-samples
---

# Authentication overview

Power Platform apps span two distinct domains, each requiring a separate authenticated session:

- **Maker Portal domain** (`make.powerapps.com`) — used for canvas apps, Gen UX apps, and any test that navigates through the maker portal
- **Dynamics 365/CRM domain** (`<org>.crm.dynamics.com`) — used for model-driven apps and Dynamics 365

The framework handles both domains by acquiring a browser **storage state** once and reusing it across all test runs. This approach avoids logging in on every test, which significantly reduces test suite duration.

## How storage state works

Playwright's `storageState` feature captures all cookies and local storage (including MSAL tokens) from an authenticated browser session and saves them to a JSON file. When tests start, the browser context is initialized with this saved state, bypassing the interactive sign-in flow.

The framework stores two state files:

| File | Domain | Used by |
|---|---|---|
| `state-<email>.json` | Maker Portal | Canvas app tests, Gen UX tests |
| `state-mda-<email>.json` | Dynamics 365 | Model-driven app tests |

Default storage location: `packages/e2e-tests/.playwright-ms-auth/`

## Authentication providers

The framework supports three credential providers:

### Password authentication

Use for local development when certificate infrastructure isn't available.

```ini
MS_AUTH_CREDENTIAL_TYPE=password
MS_USER_PASSWORD=<password>
```

> [!IMPORTANT]
> Never commit passwords to source control. Use environment variables or a secrets manager.

### Certificate authentication

Use for CI/CD pipelines and shared environments. Avoids storing passwords and supports multi-factor scenarios.

```ini
MS_AUTH_CREDENTIAL_TYPE=certificate
MS_AUTH_CREDENTIAL_PROVIDER=local-file
MS_AUTH_LOCAL_FILE_PATH=../../cert/<cert-file>.pfx
MS_AUTH_CERTIFICATE_PASSWORD=<optional-pfx-password>
```

### Azure Key Vault

Use for production pipelines where certificates are managed centrally.

```ini
MS_AUTH_CREDENTIAL_TYPE=certificate
MS_AUTH_CREDENTIAL_PROVIDER=azure-keyvault
AZURE_KEYVAULT_URL=https://<vault>.vault.azure.net/
AZURE_CERTIFICATE_NAME=<certificate-name>
```

## Token validation and expiry

Before each test run, the framework validates the storage state file:

- **Maker Portal state:** Validates MSAL access token expiry from localStorage
- **MDA state:** Validates Dynamics 365 session cookies from the CRM domain

If a state file is expired, the framework removes it and prompts you to re-authenticate. In CI/CD, authentication runs in `globalSetup` to acquire fresh state before every pipeline run.

## Multiple test users

To run tests with different user accounts (for example, testing role-based access), create separate storage state files by setting `MS_AUTH_EMAIL` and running the auth scripts for each user:

```bash
MS_AUTH_EMAIL=user1@contoso.com npm run auth:headful
MS_AUTH_EMAIL=user2@contoso.com npm run auth:headful
```

Then reference the specific state file in your test:

```typescript
test.use({
  storageState: getStorageStatePath('user1@contoso.com'),
});
```

## Security considerations

- Storage state files contain session tokens. Add `.playwright-ms-auth/` to your `.gitignore`.
- Rotate test user credentials and re-authenticate regularly.
- Use dedicated test accounts with minimum required permissions.
- For production CI/CD, use certificate auth with certificates stored in Azure Key Vault.

## Next steps

- [Authentication guide](authentication-guide.md) — Step-by-step instructions for each credential provider

## See also

- [Environment variables](environment-variables.md)
- [CI/CD integration](cicd.md)
