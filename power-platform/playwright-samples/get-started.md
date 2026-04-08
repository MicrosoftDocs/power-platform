---
title: Get started with Power Platform Playwright Samples
description: Clone the repository, configure your environment, authenticate, and run your first end-to-end test against a Power Platform app in under 15 minutes.
author: deepakkamboj
ms.author: deepakkamboj
ms.topic: get-started
ms.date: 04/07/2025
ms.subservice: developer
---

# Get started with Power Platform Playwright Samples

In this guide, you clone the repository, configure your environment variables, authenticate to Power Platform, and run your first end-to-end test.

## Prerequisites

Before you begin, make sure you have:

- [Node.js 20 or later](https://nodejs.org/)
- [Git](https://git-scm.com/)
- A Power Platform environment with at least one app deployed
- A user account with access to the app you want to test

> [!NOTE]
> The sample tests in this repository target the **Northwind Traders** solution. You can use your own app by following the same patterns. See [Sample tests](samples.md) for setup instructions.

## Step 1: Clone the repository

```bash
git clone https://github.com/microsoft/power-platform-playwright-samples.git
cd power-platform-playwright-samples
```

## Step 2: Install dependencies

The repository uses [Rush](https://rushjs.io/) to manage the monorepo. Install dependencies with:

```bash
node common/scripts/install-run-rush.js install
```

If you prefer to work directly with the `e2e-tests` package:

```bash
cd packages/e2e-tests
npm install
```

## Step 3: Install browsers

Install Microsoft Edge (the default browser for Power Platform tests):

```bash
cd packages/e2e-tests
npx playwright install msedge
```

## Step 4: Configure your environment

Copy the environment template and fill in your values:

```bash
cp .env.example .env
```

Open `.env` and set the required variables:

```ini
# Power Apps maker portal
POWER_APPS_BASE_URL=https://make.powerapps.com
POWER_APPS_ENVIRONMENT_ID=<your-environment-guid>

# Model-driven app (for MDA tests)
MODEL_DRIVEN_APP_URL=https://<org>.crm.dynamics.com/main.aspx?appid=<app-guid>

# Canvas app (for canvas tests)
CANVAS_APP_ID=<canvas-app-guid>
CANVAS_APP_TENANT_ID=<tenant-guid>

# Authentication
MS_AUTH_EMAIL=<your-test-user@domain.com>
MS_AUTH_CREDENTIAL_TYPE=password
MS_USER_PASSWORD=<password>
```

> [!TIP]
> For CI/CD pipelines, use certificate-based authentication instead of passwords. See the [authentication guide](authentication-guide.md) for details.

For the full list of environment variables, see [Environment variables reference](environment-variables.md).

## Step 5: Authenticate

Authentication runs once to capture a browser storage state that all tests reuse.

### Authenticate to the Maker Portal

Run the following command. A browser window opens for you to sign in:

```bash
npm run auth:headful
```

The storage state is saved to `.playwright-ms-auth/state-<email>.json`.

### Authenticate to the model-driven app (optional)

If you're testing model-driven apps, run a second authentication against the Dynamics 365 domain:

```bash
npm run auth:mda:headful
```

The MDA storage state is saved to `.playwright-ms-auth/state-mda-<email>.json`.

> [!NOTE]
> Authentication storage states expire with the session. Repeat these steps when tests start failing with authentication errors, or configure [CI/CD authentication](authentication-guide.md#cicd) to renew state automatically.

## Step 6: Run the tests

Run all tests:

```bash
npx playwright test
```

Run only canvas app tests:

```bash
npx playwright test tests/northwind/canvas --project=default
```

Run only model-driven app tests:

```bash
npx playwright test tests/northwind/mda --project=model-driven-app
```

View the HTML report after the run:

```bash
npx playwright show-report
```

## Step 7: Write your first test

The following example shows a minimal canvas app test. Create a file at `tests/my-app/my-app.test.ts`:

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode } from 'power-platform-playwright-toolkit';

const CANVAS_APP_URL = process.env.CANVAS_APP_URL!;

test('should load the app and display the gallery', async ({ page, context }) => {
  const app = new AppProvider(page, context);

  await app.launch({
    app: 'My Canvas App',
    type: AppType.Canvas,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: CANVAS_APP_URL,
  });

  const canvasApp = app.getCanvasAppPage();
  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

  await expect(canvasFrame.locator('[data-control-name="Gallery1"]')).toBeVisible();
});
```

Run the test:

```bash
npx playwright test tests/my-app/my-app.test.ts --project=default
```

## Next steps

- [Authentication guide](authentication-guide.md) — Set up certificate auth for CI/CD
- [Test canvas apps](canvas-application.md) — Full guide to canvas app testing patterns
- [Test model-driven apps](model-driven-application.md) — Grid, form, and command bar testing
- [AI-assisted testing](ai-overview.md) — Use Playwright MCP to generate tests with AI

## See also

- [Configuration reference](configuration.md)
- [Environment variables](environment-variables.md)
- [Sample tests](samples.md)
