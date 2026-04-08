---
title: Configuration reference for Power Platform Playwright Samples
description: Reference for playwright.config.ts settings, project structure, and reporter configuration for Power Platform Playwright tests.
author: microsoft
ms.author: deepak.kamboj
ms.topic: reference
ms.date: 04/07/2025
ms.subservice: power-platform-playwright-samples
---

# Configuration reference

This article documents the Playwright configuration used by the sample tests and explains how to adapt it for your own environment.

## playwright.config.ts

The configuration file is at `packages/e2e-tests/playwright.config.ts`:

```typescript
import { defineConfig, devices } from '@playwright/test';
import path from 'path';
import { getStorageStatePath } from 'power-platform-playwright-toolkit';
import dotenv from 'dotenv';

dotenv.config();

const storageStatePath = getStorageStatePath(process.env.MS_AUTH_EMAIL!);
const mdaStorageStatePath = path.join(
  path.dirname(storageStatePath),
  `state-mda-${process.env.MS_AUTH_EMAIL}.json`
);

export default defineConfig({
  testDir: './tests',
  fullyParallel: false,         // Power Platform tests share a single org; run serially
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 1 : 0,
  workers: 1,                   // Single worker prevents auth conflicts
  reporter: [
    ['html', { outputFolder: 'playwright-report' }],
    ['junit', { outputFile: 'test-results/results.xml' }],
  ],
  use: {
    baseURL: process.env.CANVAS_APP_URL,
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
  },
  projects: [
    {
      name: 'canvas',
      use: {
        ...devices['Desktop Chrome'],
        storageState: storageStatePath,
      },
      testMatch: '**/canvas/**/*.test.ts',
    },
    {
      name: 'mda',
      use: {
        ...devices['Desktop Chrome'],
        storageState: mdaStorageStatePath,
      },
      testMatch: '**/mda/**/*.test.ts',
    },
  ],
  globalSetup: './global-setup.ts',
});
```

## Key configuration options

### fullyParallel and workers

Power Platform tests share a single Dataverse environment. Running tests in parallel creates data conflicts — for example, two tests deleting the same record. Set both to serialize execution:

```typescript
fullyParallel: false,
workers: 1,
```

> [!NOTE]
> If you have multiple environments, you can increase `workers` and isolate each project to a different environment using separate `.env` files or environment-level variables.

### retries

Retries mask flakiness in CI. Use `retries: 1` in CI to handle transient network issues, but set `retries: 0` locally to get immediate feedback:

```typescript
retries: process.env.CI ? 1 : 0,
```

### trace, screenshot, video

Capture diagnostics only on failure to save disk space:

```typescript
trace: 'on-first-retry',
screenshot: 'only-on-failure',
video: 'retain-on-failure',
```

In CI, artifacts are uploaded after the test run. See [CI/CD integration](cicd.md).

### projects

Use Playwright projects to separate canvas and model-driven test suites. Each project can have a different storage state:

```typescript
projects: [
  {
    name: 'canvas',
    use: { storageState: storageStatePath },
    testMatch: '**/canvas/**/*.test.ts',
  },
  {
    name: 'mda',
    use: { storageState: mdaStorageStatePath },
    testMatch: '**/mda/**/*.test.ts',
  },
],
```

Run a single project:

```bash
npx playwright test --project=canvas
npx playwright test --project=mda
```

## globalSetup

The global setup script runs once before all tests. It validates authentication state and runs headless auth if storage state is expired or missing:

```typescript
// global-setup.ts
import { validateAndRefreshAuthState } from './utils/validate-auth-state';

export default async function globalSetup() {
  await validateAndRefreshAuthState();
}
```

The validation checks:

- Storage state file exists
- MSAL access token is not expired (canvas/Gen UX tests)
- CRM session cookies are present and valid (MDA tests)

## tsconfig.json

TypeScript configuration for the test package:

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "strict": true,
    "esModuleInterop": true,
    "resolveJsonModule": true,
    "outDir": "dist",
    "rootDir": "."
  },
  "include": ["**/*.ts"],
  "exclude": ["node_modules", "dist"]
}
```

## .env file

The `.env` file at `packages/e2e-tests/.env` sets environment variables for local runs. See [Environment variables](environment-variables.md) for the complete reference.

```ini
MS_AUTH_EMAIL=testuser@contoso.com
MS_AUTH_CREDENTIAL_TYPE=password
MS_USER_PASSWORD=<your-password>

CANVAS_APP_URL=https://apps.powerapps.com/play/<app-id>?tenantId=<tenant-id>
MODEL_DRIVEN_APP_URL=https://<org>.crm.dynamics.com/main.aspx?appid=<app-id>
CUSTOM_PAGE_NAME=AccountsCustomPage
```

## package.json scripts

Scripts available in `packages/e2e-tests/package.json`:

| Script | Command | Description |
|---|---|---|
| `auth:headful` | `ts-node auth/auth-maker-portal.ts` | Interactive auth for Maker Portal (canvas tests) |
| `auth:mda:headful` | `ts-node auth/auth-mda.ts` | Interactive auth for model-driven apps |
| `auth` | `ts-node auth/auth-maker-portal.ts --headless` | Headless auth (CI) |
| `auth:mda` | `ts-node auth/auth-mda.ts --headless` | Headless MDA auth (CI) |
| `test` | `playwright test` | Run all tests |
| `test:ui` | `playwright test --ui` | Run with Playwright UI |
| `test:debug` | `playwright test --debug` | Run with debug inspector |

## Next steps

- [Environment variables](environment-variables.md)
- [CI/CD integration](cicd.md)
- [Page Object Model](page-object-model.md)

## See also

- [Authentication guide](authentication-guide.md)
- [Get started](get-started.md)
