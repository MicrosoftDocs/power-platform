---
title: Global setup and teardown in Power Platform Playwright Samples
description: Understand how globalSetup and globalTeardown work in the Power Platform Playwright Samples project, and learn how to extend them for authentication, data seeding, environment validation, and cleanup.
author: deepakkamboj
ms.author: deepakkamboj
ms.topic: concept-article
ms.date: 04/07/2025
ms.subservice: developer
---

# Global setup and teardown

Playwright's `globalSetup` and `globalTeardown` hooks run **once** per test run — before the first test starts and after the last test finishes. They run in the main Node.js process, not inside a browser context. This makes them the right place for work that applies to the whole suite, such as validating credentials, seeding reference data, or cleaning up test artifacts.

This article explains how these hooks work in this project and walks through the scenarios where you should extend them.

## How they are wired up

The hooks are registered in `playwright.config.ts`:

```typescript
// packages/e2e-tests/playwright.config.ts
export default defineConfig({
  globalSetup: require.resolve('./globals/global-setup'),
  globalTeardown: require.resolve('./globals/global-teardown'),
  // ...
});
```

Each file exports a single `async` function. Playwright calls `globalSetup` before spawning any worker, and `globalTeardown` after all workers have finished.

## Current implementation

### global-setup.ts

```typescript
// packages/e2e-tests/globals/global-setup.ts
async function globalSetup() {
  console.log('===============================================');
  console.log('🚀 Setup Playwright Test Environment');
  console.log('===============================================');
}
export default globalSetup;
```

### global-teardown.ts

```typescript
// packages/e2e-tests/globals/global-teardown.ts
async function globalSetup() {
  console.log('===============================================');
  console.log('✅ Teardown Playwright Test Environment');
  console.log('===============================================');
}
export default globalSetup;
```

Both are currently minimal — they print a banner and exit. The actual pre-flight work, which is auth state validation, runs in `playwright.config.ts` before `globalSetup` is called:

```typescript
// playwright.config.ts — runs at config evaluation time
if (!process.argv.includes('list-files') && !process.env.CI && isMainProcess) {
  const validationResult = validateAuthState();
  if (!validationResult.valid) {
    console.error(`❌ ${validationResult.message}`);
    process.exit(1);
  }
}
```

This means **auth validation blocks the run before any test is collected** — a deliberate design to give fast, clear feedback when credentials are missing or expired.

## When to use globalSetup vs. other hooks

| Hook | Runs | Frequency | Use for |
|---|---|---|---|
| `playwright.config.ts` (top-level code) | Config eval | Once, before everything | Fail-fast validation (auth, env vars) |
| `globalSetup` | Before first test | Once per run | Headless auth, data seeding, external service checks |
| `test.beforeAll()` | Before first test in a file | Once per file | App launch, test-suite-level data creation |
| `test.beforeEach()` | Before each test | Once per test | Navigate to start state, reset per-test data |
| `test.afterEach()` | After each test | Once per test | Clean up records created by that test |
| `test.afterAll()` | After last test in a file | Once per file | Tear down suite-level data |
| `globalTeardown` | After last test | Once per run | Delete seeded data, archive reports, notify |

> [!IMPORTANT]
> `globalSetup` and `globalTeardown` do **not** share scope with test files. Any value you want to pass from `globalSetup` to tests must go through environment variables or a shared file on disk.

## Scenario 1: Headless authentication in CI

In CI, interactive browser windows are not available. `globalSetup` is the standard place to acquire storage state headlessly before any test needs it.

```typescript
// globals/global-setup.ts
import { chromium, FullConfig } from '@playwright/test';
import { AuthProvider } from 'power-platform-playwright-toolkit';
import path from 'path';

export default async function globalSetup(config: FullConfig) {
  console.log('🚀 Running global setup');

  if (process.env.CI) {
    console.log('🔐 Acquiring auth state headlessly...');

    const browser = await chromium.launch({ headless: true });
    const context = await browser.newContext();
    const page = await context.newPage();

    const auth = new AuthProvider(page);
    await auth.authenticate({
      email: process.env.MS_AUTH_EMAIL!,
      credentialType: process.env.MS_AUTH_CREDENTIAL_TYPE as 'password' | 'certificate',
      credentialProvider: process.env.MS_AUTH_CREDENTIAL_PROVIDER as 'local-file' | 'azure-keyvault',
    });

    await context.storageState({ path: getStorageStatePath(process.env.MS_AUTH_EMAIL!) });
    await browser.close();

    console.log('✅ Auth state acquired');
  }
}
```

> [!TIP]
> If your CI pipeline runs a separate auth step before `npx playwright test` (as shown in [CI/CD integration](cicd.md)), you don't need to authenticate inside `globalSetup`. Use `globalSetup` for auth only when you want a single self-contained pipeline step.

## Scenario 2: Validate environment before running tests

Catch misconfigured environments before wasting time on hundreds of test failures. Move `validateAuthState` calls into `globalSetup` to keep config evaluation clean:

```typescript
// globals/global-setup.ts
import { validateAuthState } from '../utils/validate-auth-state';

export default async function globalSetup() {
  console.log('🚀 Setup Playwright Test Environment');

  // Validate auth — fail fast before any test starts
  const result = validateAuthState();
  if (!result.valid) {
    throw new Error(result.message);
  }

  // Validate required environment variables
  const required = ['MS_AUTH_EMAIL', 'MODEL_DRIVEN_APP_URL'];
  const missing = required.filter((v) => !process.env[v]);
  if (missing.length > 0) {
    throw new Error(`Missing required environment variables: ${missing.join(', ')}`);
  }

  console.log('✅ Environment validated');
}
```

Throwing from `globalSetup` aborts the entire run with a clear error message, instead of letting tests fail with cryptic selector timeouts.

## Scenario 3: Seed reference data in Dataverse

If your tests rely on specific Dataverse records (lookup values, reference entities, configuration records), create them once in `globalSetup` and delete them in `globalTeardown`.

```typescript
// globals/global-setup.ts
import { chromium } from '@playwright/test';
import { getStorageStatePath } from 'power-platform-playwright-toolkit';

// Export constants so tests can reference the seeded record IDs
process.env.SEED_ACCOUNT_ID = '';

export default async function globalSetup() {
  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({
    storageState: getStorageStatePath(process.env.MS_AUTH_EMAIL!),
  });
  const page = await context.newPage();

  // Call Dataverse WebApi directly to create a reference account
  const response = await page.evaluate(async () => {
    const res = await fetch('/api/data/v9.2/accounts', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'OData-Version': '4.0' },
      body: JSON.stringify({ name: 'Playwright Test Reference Account' }),
    });
    return res.headers.get('OData-EntityId'); // returns the new record URL
  });

  // Extract the GUID and store it so tests can reference it
  const guid = response?.match(/\(([^)]+)\)/)?.[1];
  process.env.SEED_ACCOUNT_ID = guid ?? '';

  await browser.close();
  console.log(`✅ Seeded reference account: ${process.env.SEED_ACCOUNT_ID}`);
}
```

```typescript
// globals/global-teardown.ts
import { chromium } from '@playwright/test';
import { getStorageStatePath } from 'power-platform-playwright-toolkit';

export default async function globalTeardown() {
  const accountId = process.env.SEED_ACCOUNT_ID;
  if (!accountId) return;

  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({
    storageState: getStorageStatePath(process.env.MS_AUTH_EMAIL!),
  });
  const page = await context.newPage();

  await page.evaluate(async (id) => {
    await fetch(`/api/data/v9.2/accounts(${id})`, { method: 'DELETE' });
  }, accountId);

  await browser.close();
  console.log(`🗑️  Deleted seeded reference account: ${accountId}`);
}
```

> [!NOTE]
> `process.env` is the only reliable channel for passing values from `globalSetup` to test files, because workers are separate processes. Store IDs or flags as env vars and read them in tests with `process.env.SEED_ACCOUNT_ID`.

## Scenario 4: Check environment reachability

Before running a long test suite, verify the target environment is up:

```typescript
// globals/global-setup.ts
export default async function globalSetup() {
  const appUrl = process.env.MODEL_DRIVEN_APP_URL!;
  const orgHost = new URL(appUrl).origin; // e.g. https://<org>.crm.dynamics.com

  console.log(`🌐 Checking environment reachability: ${orgHost}`);

  const res = await fetch(orgHost, { method: 'HEAD' }).catch(() => null);
  if (!res || !res.ok) {
    throw new Error(
      `Environment not reachable: ${orgHost}\nCheck MODEL_DRIVEN_APP_URL and network connectivity.`
    );
  }

  console.log('✅ Environment is reachable');
}
```

This surfaces network or VPN issues immediately, saving the time of watching 30 tests fail on navigation timeouts.

## Scenario 5: Archive reports and notify on failure

`globalTeardown` runs even when tests fail, making it the right place for post-run notifications:

```typescript
// globals/global-teardown.ts
import { execSync } from 'child_process';
import fs from 'fs';

export default async function globalTeardown() {
  console.log('✅ Teardown Playwright Test Environment');

  // Merge blob reports (used when sharding across machines)
  if (process.env.CI && fs.existsSync('./test-results/blob-report')) {
    console.log('📊 Merging blob reports...');
    execSync('npx playwright merge-reports ./test-results/blob-report --reporter html', {
      stdio: 'inherit',
    });
  }

  // Post a summary to a webhook (Teams, Slack, etc.)
  const webhookUrl = process.env.TEAMS_WEBHOOK_URL;
  if (webhookUrl) {
    const passed = process.env.PLAYWRIGHT_PASSED_TESTS ?? '?';
    const failed = process.env.PLAYWRIGHT_FAILED_TESTS ?? '?';
    await fetch(webhookUrl, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        text: `Playwright run complete — ✅ ${passed} passed, ❌ ${failed} failed`,
      }),
    });
  }
}
```

## Scenario 6: Configure test IDs for traceability

When running in CI with a build number, stamp each test run with metadata so traces are traceable back to a specific pipeline build:

```typescript
// globals/global-setup.ts
export default async function globalSetup() {
  // Expose build metadata to all tests via env vars
  process.env.TEST_RUN_ID = process.env.BUILD_BUILDID ?? `local-${Date.now()}`;
  process.env.TEST_RUN_URL = process.env.BUILD_BUILDURI ?? '';

  console.log(`🆔 Test run ID: ${process.env.TEST_RUN_ID}`);
}
```

Tests can then include the run ID in test data names:

```typescript
const accountName = `Test Account ${process.env.TEST_RUN_ID}-${Date.now()}`;
```

This makes it easy to find exactly which CI build created a record in Dataverse.

## Pass data from globalSetup to tests

Because workers run in separate processes, you cannot export variables from `globalSetup` and import them in test files. Use one of these patterns:

### Pattern 1: Environment variables

```typescript
// global-setup.ts
process.env.MY_SHARED_VALUE = 'hello';

// test file
const value = process.env.MY_SHARED_VALUE; // 'hello'
```

Simple, works for strings and GUIDs. Doesn't survive serialization for complex objects.

### Pattern 2: Write to a JSON file

```typescript
// global-setup.ts
import fs from 'fs';

const sharedData = { accountId: '...', orderIds: ['...'] };
fs.writeFileSync('./.playwright-shared/setup-data.json', JSON.stringify(sharedData));

// test file
import setupData from '../.playwright-shared/setup-data.json';
const { accountId } = setupData;
```

Use for structured data that multiple test files need. Add `.playwright-shared/` to `.gitignore`.

## Extend the current project setup

The current `globals/global-setup.ts` is a stub. To add a new behavior without replacing the existing banner logging:

```typescript
// globals/global-setup.ts
export default async function globalSetup() {
  console.log('===============================================');
  console.log('🚀 Setup Playwright Test Environment');
  console.log('===============================================');

  // Add your extensions here:
  await validateEnvironment();
  await seedReferenceData();
}

async function validateEnvironment() {
  // ...
}

async function seedReferenceData() {
  // ...
}
```

The same pattern applies to `globals/global-teardown.ts`.

## Troubleshoot global setup failures

| Symptom | Likely cause | Fix |
|---|---|---|
| `Error thrown in globalSetup` — all tests skipped | Setup threw an exception | Read the error message; fix the underlying issue (auth, network, env var) |
| Tests pass locally, fail in CI with auth error | `globalSetup` auth logic not running in CI | Check `process.env.CI` condition; ensure CI secrets are set |
| Seeded data not visible in tests | Worker process isolation | Pass IDs via `process.env`, not module-level variables |
| `globalTeardown` didn't delete test data | Teardown threw before delete ran | Wrap each cleanup step in `try/catch` so one failure doesn't skip others |
| Setup runs twice | Two `require.resolve()` paths pointing to different files | Use a single canonical path in `playwright.config.ts` |

## Next steps

- [Configuration reference](configuration.md)
- [Write, debug, and run tests locally](local-development.md)
- [CI/CD integration](cicd.md)

## See also

- [Authentication guide](authentication-guide.md)
- [Environment variables](environment-variables.md)
- [Playwright globalSetup documentation](https://playwright.dev/docs/test-global-setup-teardown)
