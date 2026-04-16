---
title: Authentication guide for Power Platform Playwright Samples
description: Step-by-step instructions to set up password, certificate, and Azure Key Vault authentication for local development and CI/CD pipelines.
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.subservice: developer
ms.reviewer: jdaly
---

# Authentication guide

This guide walks you through configuring authentication for local development and CI/CD pipelines.

## Authenticate for local development (password)

Password authentication is the quickest way to get started on a local machine.

1. Set the following variables in your `.env` file:

   ```ini
   MS_AUTH_EMAIL=testuser@contoso.com
   MS_AUTH_CREDENTIAL_TYPE=password
   MS_USER_PASSWORD=<password>
   ```

2. Run the authentication script. A browser window opens:

   ```bash
   npm run auth:headful
   ```

3. Complete the sign-in flow. The storage state is saved automatically.

4. If you're testing model-driven apps, authenticate to the CRM domain:

   ```bash
   npm run auth:mda:headful
   ```

## Authenticate with a certificate (local-file)

Certificate authentication is more secure than passwords and works well for both local development and CI/CD.

1. Obtain a `.pfx` certificate file for your test user from your Microsoft Entra ID administrator.

2. Place the certificate file in the `cert/` directory at the repository root.

3. Set the following variables in your `.env` file:

   ```ini
   MS_AUTH_EMAIL=testuser@contoso.com
   MS_AUTH_CREDENTIAL_TYPE=certificate
   MS_AUTH_CREDENTIAL_PROVIDER=local-file
   MS_AUTH_LOCAL_FILE_PATH=../../cert/<cert-file>.pfx
   MS_AUTH_CERTIFICATE_PASSWORD=<optional-password>
   ```

4. Run the authentication scripts:

   ```bash
   npm run auth:headful       # https://make.powerapps.com
   npm run auth:mda:headful   # Model-driven app (if needed)
   ```

## Authenticate with Azure Key Vault

Use Azure Key Vault to manage certificates centrally in shared or production environments.

1. Upload the certificate to an Azure Key Vault.

2. Grant the pipeline service principal the **Key Vault Certificate User** role on the vault.

3. Set the following variables in your `.env` or pipeline secrets:

   ```ini
   MS_AUTH_EMAIL=testuser@contoso.com
   MS_AUTH_CREDENTIAL_TYPE=certificate
   MS_AUTH_CREDENTIAL_PROVIDER=azure-keyvault
   AZURE_KEYVAULT_URL=https://<vault-name>.vault.azure.net/
   AZURE_CERTIFICATE_NAME=<certificate-name>
   AZURE_TENANT_ID=<tenant-id>
   ```

## Configure CI/CD authentication

In CI/CD, authentication runs in `globalSetup` before the test suite starts. The script acquires fresh storage state headlessly using the configured credential provider.

### GitHub Actions example

```yaml
- name: Authenticate to Power Platform
  env:
    MS_AUTH_EMAIL: ${{ secrets.MS_AUTH_EMAIL }}
    MS_AUTH_CREDENTIAL_TYPE: certificate
    MS_AUTH_CREDENTIAL_PROVIDER: azure-keyvault
    AZURE_KEYVAULT_URL: ${{ secrets.AZURE_KEYVAULT_URL }}
    AZURE_CERTIFICATE_NAME: ${{ secrets.AZURE_CERTIFICATE_NAME }}
    AZURE_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
    MODEL_DRIVEN_APP_URL: ${{ secrets.MODEL_DRIVEN_APP_URL }}
  run: |
    cd packages/e2e-tests
    npm run auth
    npm run auth:mda

- name: Run tests
  run: |
    cd packages/e2e-tests
    npx playwright test
```

### Azure Pipelines example

```yaml
- task: Bash@3
  displayName: Authenticate to Power Platform
  env:
    MS_AUTH_EMAIL: $(MS_AUTH_EMAIL)
    MS_AUTH_CREDENTIAL_TYPE: certificate
    MS_AUTH_CREDENTIAL_PROVIDER: azure-keyvault
    AZURE_KEYVAULT_URL: $(AZURE_KEYVAULT_URL)
    AZURE_CERTIFICATE_NAME: $(AZURE_CERTIFICATE_NAME)
    AZURE_TENANT_ID: $(AZURE_TENANT_ID)
    MODEL_DRIVEN_APP_URL: $(MODEL_DRIVEN_APP_URL)
  script: |
    cd packages/e2e-tests
    npm run auth
    npm run auth:mda

- task: Bash@3
  displayName: Run Playwright tests
  script: |
    cd packages/e2e-tests
    npx playwright test
```

## Verify authentication

After authenticating, verify the storage state files exist:

```bash
ls packages/e2e-tests/.playwright-ms-auth/
# state-testuser@contoso.com.json
# state-mda-testuser@contoso.com.json
```

Check token validity:

```typescript
import { ConfigHelper } from 'power-platform-playwright-toolkit';

const check = ConfigHelper.checkStorageStateExpiration(
  '.playwright-ms-auth/state-testuser@contoso.com.json'
);

if (check.expired) {
  console.log('Token expired, please re-authenticate');
} else {
  const expiryDate = new Date(check.expiresOn! * 1000);
  console.log(`Token valid until: ${expiryDate.toLocaleString()}`);
}
```

## Troubleshoot authentication failures

| Symptom | Likely cause | Resolution |
|---|---|---|
| `Authentication tokens have expired` | Storage state file expired | Re-run `npm run auth:headful` |
| `Storage state file does not exist` | Auth was never run | Run `npm run auth:headful` |
| `Certificate file not found` | Wrong path in `MS_AUTH_LOCAL_FILE_PATH` | Check path is relative to `packages/e2e-tests/` |
| `ERR_ABORTED` during MDA auth | [Power Apps](https://make.powerapps.com) state expired | Run `npm run auth:headful` before `npm run auth:mda:headful` |
| Browser closes unexpectedly | Previous browser process still running | Wait a few seconds and retry |

## Next steps

- [CI/CD integration](cicd.md) — Full pipeline configuration for GitHub Actions and Azure Pipelines
- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)

## See also

- [Authentication overview](authentication.md)
- [Environment variables](environment-variables.md)
