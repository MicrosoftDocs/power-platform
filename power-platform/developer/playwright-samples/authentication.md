---
title: "Authentication Overview for Power Platform Playwright Samples"
description: "Learn how Power Platform Playwright samples manage authentication across Power Apps and Dynamics 365 domains using storage state files. Explore credential providers and setup steps."
author: deepakkamboj
ms.author: dekamb
ms.topic: conceptual
ms.date: 04/17/2026
ms.reviewer: jdaly
---

# Authentication overview

Power Platform apps span two distinct domains, each requiring a separate authenticated session:

| Domain | URL | Used for |
|---|---|---|
| Power Apps | `make.powerapps.com` | Canvas apps, Gen UX apps, and any test that navigates through [Power Apps](https://make.powerapps.com) |
| Dynamics 365/CRM | `<org>.crm.dynamics.com` | Model-driven apps and Dynamics 365 |

The framework handles both domains by acquiring a browser **storage state** once and reusing it across all test runs. This approach avoids logging in on every test, which significantly reduces test suite duration.

## How storage state works in Playwright

Playwright's `storageState` feature captures all cookies and local storage (including MSAL tokens) from an authenticated browser session and saves them to a JSON file. When tests start, the browser context is initialized with this saved state, bypassing the interactive sign-in flow.

The framework stores two state files:

| File | Domain | Used by |
|---|---|---|
| `state-<email>.json` | [Power Apps](https://make.powerapps.com) | Canvas app tests, Gen UX tests |
| `state-mda-<email>.json` | Dynamics 365 | Model-driven app tests |

Default storage location: `packages/e2e-tests/.playwright-ms-auth/`

## Authentication providers

The framework supports three credential providers:

### Password authentication

Use password authentication for local development when certificate infrastructure isn't available.

```ini
MS_AUTH_CREDENTIAL_TYPE=password
MS_USER_PASSWORD=<password>
```

> [!IMPORTANT]
> Never commit passwords to source control. Use environment variables or a secrets manager.

### Certificate authentication

Use certificate authentication for CI/CD pipelines and shared environments. This method avoids storing passwords and supports multifactor scenarios.

```ini
MS_AUTH_CREDENTIAL_TYPE=certificate
MS_AUTH_CREDENTIAL_PROVIDER=local-file
MS_AUTH_LOCAL_FILE_PATH=../../cert/<cert-file>.pfx
MS_AUTH_CERTIFICATE_PASSWORD=<optional-pfx-password>
```

### Azure Key Vault

Use Azure Key Vault for production pipelines where you manage certificates centrally.

```ini
MS_AUTH_CREDENTIAL_TYPE=certificate
MS_AUTH_CREDENTIAL_PROVIDER=azure-keyvault
AZURE_KEYVAULT_URL=https://<vault>.vault.azure.net/
AZURE_CERTIFICATE_NAME=<certificate-name>
```

## Token validation and expiry for authentication state

Before each test run, the framework validates the storage state file:

- **[Power Apps](https://make.powerapps.com) state:** Validates MSAL access token expiry from localStorage
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

- [Authentication guide](authentication-guide.md)  Step-by-step instructions for each credential provider

## See also

- [Environment variables](environment-variables.md)
- [CI/CD integration](cicd.md)
