---
title: Test custom pages in model-driven apps with Power Platform Playwright Samples
description: Write end-to-end tests for canvas custom pages embedded in Power Apps model-driven apps using iframe scoping and the AppProvider class.
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.subservice: developer
ms.reviewer: jdaly
---

# Test custom pages

Custom pages are canvas apps embedded inside a model-driven app. They render in an iframe within the model-driven app shell. Testing them requires navigating to the model-driven app, selecting the custom page from the sitemap, and then scoping all control interactions to the inner iframe.

## How custom page testing works

When a custom page loads, the model-driven app shell remains on the Dynamics 365 domain. The custom page canvas runtime loads inside:

```
iframe[name="fullscreen-app-host"]
```

This is the same iframe used by standalone canvas apps. Once you have the frame locator, all canvas app testing patterns apply.

## Navigate to a custom page

1. Launch the model-driven app using `AppProvider`.
2. Click the custom page item in the sitemap.
3. Wait for the canvas runtime to initialize.

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode } from 'power-platform-playwright-toolkit';

const MODEL_DRIVEN_APP_URL = process.env.MODEL_DRIVEN_APP_URL!;
const CUSTOM_PAGE_NAME = process.env.CUSTOM_PAGE_NAME ?? 'AccountsCustomPage';

test.beforeAll(async ({ browser }) => {
  const context = await browser.newContext({ storageState: mdaStorageStatePath });
  const page = await context.newPage();

  const app = new AppProvider(page, context);
  await app.launch({
    app: 'My App',
    type: AppType.ModelDriven,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: MODEL_DRIVEN_APP_URL,
  });

  // Navigate to the custom page via the sitemap
  const sidebarItem = page
    .locator(`[role="presentation"][title="${CUSTOM_PAGE_NAME}"]`)
    .first();
  await sidebarItem.waitFor({ state: 'visible', timeout: 30000 });
  await sidebarItem.click();
  await page.waitForTimeout(3000);
});
```

## Interact with custom page controls

After navigating to the custom page, scope locators to the canvas iframe:

```typescript
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

// Wait for gallery to appear
await canvasFrame
  .locator('[data-control-part="gallery-item"]')
  .first()
  .waitFor({ state: 'visible', timeout: 30000 });
```

### Click buttons

```typescript
await canvasFrame.locator('[data-control-name="IconButton_Accept1"] [role="button"]').click();
await canvasFrame.locator('[data-control-name="IconButton_Edit1"] [role="button"]').click();
```

### Fill form fields

```typescript
const accountNameInput = canvasFrame.locator('input[aria-label="Account Name"]');
await accountNameInput.fill('Contoso Ltd');
```

### Filter gallery by title

```typescript
const galleryItem = canvasFrame
  .locator('[role="listitem"][data-control-part="gallery-item"]')
  .filter({
    has: canvasFrame
      .locator('[data-control-name="Title1"]')
      .getByText('Contoso Ltd', { exact: true }),
  });

await galleryItem.waitFor({ state: 'visible', timeout: 30000 });
```

## Refresh the custom page after a save

When you save a new record in a custom page backed by Dataverse, the gallery doesn't refresh automatically unless you trigger a full reload. The recommended approach is to navigate to the app root and back:

```typescript
// Navigate to app root to force gallery refresh
await page.goto(MODEL_DRIVEN_APP_URL, { waitUntil: 'load', timeout: 60000 });
await page.locator('[role="menuitem"]').first().waitFor({ state: 'visible', timeout: 30000 });

// Navigate back to the custom page
const sidebarItem = page.locator(`[role="presentation"][title="${CUSTOM_PAGE_NAME}"]`).first();
await sidebarItem.waitFor({ state: 'visible', timeout: 30000 });
await sidebarItem.click();

// Wait for the new record to appear in the gallery
const specificItem = page
  .locator('[data-control-part="gallery-item"]')
  .filter({ has: page.locator('[data-control-name="Title1"]').getByText(accountName, { exact: true }) });
await specificItem.waitFor({ state: 'visible', timeout: 60000 });
```

## Full test example: create and verify a record

```typescript
test('should create an account and verify it in the gallery', async ({ page }) => {
  const ACCOUNT_NAME = `Test Account ${Date.now()}`;
  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

  // Click New record
  await page.locator('[title="New record"]').click();

  // Fill the form
  await canvasFrame.locator('input[aria-label="Account Name"]').fill(ACCOUNT_NAME);
  await canvasFrame.locator('input[aria-label="Main Phone"]').fill('555-1234');

  // Save
  await canvasFrame
    .locator('[data-control-name="IconButton_Accept1"] [role="button"]')
    .click();

  // Refresh and verify
  await page.waitForTimeout(5000); // wait for Dataverse write
  await page.goto(MODEL_DRIVEN_APP_URL, { waitUntil: 'load', timeout: 60000 });
  await page.locator('[role="menuitem"]').first().waitFor({ timeout: 30000 });
  await page.locator(`[role="presentation"][title="${CUSTOM_PAGE_NAME}"]`).first().click();

  await expect(
    page
      .locator('[data-control-part="gallery-item"]')
      .filter({ has: page.locator('[data-control-name="Title1"]').getByText(ACCOUNT_NAME, { exact: true }) })
  ).toBeVisible({ timeout: 60000 });
});
```

## Authentication for custom pages

Custom pages run on the Dynamics 365 domain. Use the MDA storage state:

```typescript
test.use({
  storageState: path.join(
    path.dirname(getStorageStatePath(process.env.MS_AUTH_EMAIL!)),
    `state-mda-${process.env.MS_AUTH_EMAIL}.json`
  ),
});
```

## Next steps

- [Test Gen UX apps](gen-ux.md)
- [Page Object Model](page-object-model.md)
- [Sample tests](samples.md)

## See also

- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)
- [Authentication overview](authentication.md)
