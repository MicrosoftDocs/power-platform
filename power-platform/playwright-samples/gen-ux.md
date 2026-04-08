---
title: Test AI-generated apps (Gen UX) with Power Platform Playwright Samples
description: Write end-to-end tests for AI-generated Power Apps using the GenUxPage class and its canvas iframe testing patterns.
author: deepakkamboj
ms.author: deepakkamboj
ms.topic: how-to
ms.date: 04/07/2025
ms.subservice: developer
---

# Test AI-generated apps (Gen UX)

Gen UX apps are AI-generated Power Apps created through the natural-language experience in the Power Apps maker portal. They use the same canvas runtime as hand-authored canvas apps, so the same iframe-scoping and `data-control-name` patterns apply. The `GenUxPage` class provides helpers tuned for the generated control structure.

## How Gen UX apps differ from canvas apps

Gen UX apps share the canvas runtime and the `iframe[name="fullscreen-app-host"]` host frame. The main differences are:

- Control names are auto-generated (e.g., `Button1`, `TextInput1`) and may change when the app is regenerated.
- The app layout is driven by the AI prompt, so structure varies between apps.
- The `GenUxPage` class exposes helpers that work against semantic roles and ARIA labels rather than control names, making tests more resilient to regeneration.

## Launch a Gen UX app

```typescript
import { test, expect } from '@playwright/test';
import {
  AppProvider,
  AppType,
  AppLaunchMode,
  buildCanvasAppUrlFromEnv,
} from 'power-platform-playwright-toolkit';

const GEN_UX_APP_URL = buildCanvasAppUrlFromEnv();

test.beforeEach(async ({ page, context }) => {
  const app = new AppProvider(page, context);

  await app.launch({
    app: 'My AI App',
    type: AppType.Canvas,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: GEN_UX_APP_URL,
  });
});
```

> [!TIP]
> Use `skipMakerPortal: true` with `directUrl` to bypass the maker portal and reduce startup time by 10–20 seconds.

## Scope locators to the canvas frame

All interactions must be scoped to the canvas iframe:

```typescript
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
```

## Wait for the app to load

Gen UX apps can take 30–60 seconds to load Dataverse data. Wait for a known element before interacting:

```typescript
// Wait for a gallery or any visible UI element
await canvasFrame
  .locator('[data-control-part="gallery-item"]')
  .first()
  .waitFor({ state: 'visible', timeout: 60000 });
```

## Interact with controls by ARIA label

Gen UX apps generate controls with ARIA labels derived from your prompt. Use ARIA-label selectors for resilience:

### Fill a text input

```typescript
await canvasFrame.locator('input[aria-label="Name"]').fill('Contoso Ltd');
await canvasFrame.locator('input[aria-label="Phone"]').fill('555-9000');
```

### Click a button

```typescript
await canvasFrame.locator('[role="button"][aria-label="Save"]').click();
await canvasFrame.locator('[role="button"][aria-label="New record"]').click();
```

### Select from a dropdown

```typescript
const dropdown = canvasFrame.locator('[aria-label="Category"]');
await dropdown.click();
await canvasFrame.locator('[role="option"]:has-text("Enterprise")').click();
```

## Work with galleries

Gen UX galleries use the same attributes as canvas app galleries:

```typescript
const gallery = canvasFrame.locator('[data-control-part="gallery-item"]');

// Count items
const count = await gallery.count();
expect(count).toBeGreaterThan(0);

// Filter by text content
const item = gallery.filter({ hasText: 'Contoso Ltd' });
await item.waitFor({ state: 'visible', timeout: 30000 });
await item.click();
```

## Full test example: create and find a record

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

const GEN_UX_APP_URL = buildCanvasAppUrlFromEnv();

test('should create a new record and find it in the list', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({
    app: 'My AI App',
    type: AppType.Canvas,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: GEN_UX_APP_URL,
  });

  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

  // Wait for the gallery to load
  await canvasFrame
    .locator('[data-control-part="gallery-item"]')
    .first()
    .waitFor({ state: 'visible', timeout: 60000 });

  // Click New record
  await canvasFrame.locator('[role="button"][aria-label="New record"]').click();

  // Fill the form
  const accountName = `AI Test ${Date.now()}`;
  await canvasFrame.locator('input[aria-label="Name"]').fill(accountName);
  await canvasFrame.locator('input[aria-label="Phone"]').fill('555-1234');

  // Save
  await canvasFrame.locator('[role="button"][aria-label="Save"]').click();
  await page.waitForTimeout(3000); // allow Dataverse write

  // Verify the new record appears in the gallery
  const newItem = canvasFrame
    .locator('[data-control-part="gallery-item"]')
    .filter({ hasText: accountName });

  await expect(newItem).toBeVisible({ timeout: 30000 });
});
```

## Discover generated control names

Gen UX control names change when the app is regenerated. To find current control names:

1. Open the app in play mode in a browser.
2. Open browser DevTools (**F12**).
3. Use the **Inspector** to hover over a control.
4. Look for `data-control-name` in the element's attributes.

> [!TIP]
> Prefer ARIA-label and role-based selectors over `data-control-name` for Gen UX apps. ARIA labels are set from your Dataverse column display names and don't change when the app is regenerated.

## Authentication

Gen UX apps use the Maker Portal domain. Use the standard storage state:

```typescript
import { getStorageStatePath } from 'power-platform-playwright-toolkit';

test.use({
  storageState: getStorageStatePath(process.env.MS_AUTH_EMAIL!),
});
```

## Next steps

- [Sample tests](samples.md)
- [AI-assisted testing overview](ai-overview.md)
- [Page Object Model](page-object-model.md)

## See also

- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)
- [Authentication overview](authentication.md)
