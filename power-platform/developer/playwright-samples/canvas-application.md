---
title: "Test Canvas Apps with Power Platform Playwright Samples"
description: Learn how to write end-to-end tests for Power Apps canvas apps using iframe scoping and data-control-name selectors.
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.reviewer: jdaly
---

# Test canvas apps

Canvas apps run inside an `iframe` within the Power Apps player. This guide explains how to launch a canvas app, scope your selectors to the correct frame, and interact with controls by using `data-control-name` attributes.

## How canvas app testing works

When a canvas app loads in play mode, the runtime hosts the app inside an `iframe`:

```
iframe[name="fullscreen-app-host"]
```

All controls inside the app have a `data-control-name` attribute that matches the control name you set in Power Apps Studio. Gallery items have `data-control-part="gallery-item"`.

You scope all locators to this frame before interacting with controls:

```typescript
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
```

## Launch a canvas app

Use [`AppProvider`](api-reference.md#appprovider) to launch the app and get the [`CanvasAppPage`](api-reference.md#canvasapppage) object:

```typescript
import { test, expect } from '@playwright/test';
import {
  AppProvider,
  AppType,
  AppLaunchMode,
  buildCanvasAppUrlFromEnv,
} from 'power-platform-playwright-toolkit';

const CANVAS_APP_URL = buildCanvasAppUrlFromEnv();

test.beforeEach(async ({ page, context }) => {
  const app = new AppProvider(page, context);

  await app.launch({
    app: 'Northwind Orders',
    type: AppType.Canvas,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,   // bypasses Power Apps navigation
    directUrl: CANVAS_APP_URL,
  });
});
```

> [!TIP]
> Setting `skipMakerPortal: true` and providing a `directUrl` saves 10–20 seconds per test by bypassing Power Apps navigation.

## Wait for the app to load

After launch, wait for a known control to appear before interacting:

```typescript
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

// Wait for gallery to confirm the app is loaded and data is present
await canvasFrame
  .locator('[data-control-name="Gallery1"] [data-control-part="gallery-item"]')
  .first()
  .waitFor({ state: 'visible', timeout: 60000 });
```

> [!NOTE]
> Canvas apps backed by Dataverse can take 30–60 seconds to load data into a gallery. Use a 60-second timeout for gallery selectors.

## Interact with controls

The following examples show how to interact with common canvas app controls using frame-scoped locators.

### Click a button

Locate a button by its `data-control-name` attribute, wait for it to be visible, and then click it.

```typescript
const addButton = canvasFrame.locator('[data-control-name="icon3"]');
await addButton.waitFor({ state: 'visible', timeout: 10000 });
await addButton.click();
```

### Fill a text input

Use the `fill()` method to set the value of a text input, targeting it by its `aria-label`.

```typescript
const orderNumberInput = canvasFrame.locator('input[aria-label="Order Number"]');
await orderNumberInput.fill('ORD-12345');
```

### Select a gallery item

Filter gallery items by their displayed text content to find and click a specific record.

```typescript
const galleryItem = canvasFrame
  .locator('[data-control-part="gallery-item"]')
  .filter({ has: canvasFrame.locator('[data-control-name="Title1"]').getByText('Order 001') });

await galleryItem.waitFor({ state: 'visible' });
await galleryItem.click();
```

### Count gallery items

Use the `count()` method to verify that the gallery contains the expected number of items.

```typescript
const galleryItems = canvasFrame.locator('[data-control-name="Gallery1"] [data-control-part="gallery-item"]');
const count = await galleryItems.count();
expect(count).toBeGreaterThan(0);
```

## Create a page object for your canvas app

For maintainability, encapsulate selectors and actions in a Page Object class:

```typescript
// pages/my-app/MyCanvasAppPage.ts
import { Page, FrameLocator } from '@playwright/test';

export class MyCanvasAppPage {
  private readonly frame: FrameLocator;

  constructor(private readonly page: Page) {
    this.frame = page.frameLocator('iframe[name="fullscreen-app-host"]');
  }

  get addButton() {
    return this.frame.locator('[data-control-name="AddButton"]');
  }

  get gallery() {
    return this.frame.locator('[data-control-name="Gallery1"]');
  }

  async waitForLoad(): Promise<void> {
    await this.gallery
      .locator('[data-control-part="gallery-item"]')
      .first()
      .waitFor({ state: 'visible', timeout: 60000 });
  }

  async clickAdd(): Promise<void> {
    await this.addButton.click();
  }

  async getItemCount(): Promise<number> {
    return this.gallery.locator('[data-control-part="gallery-item"]').count();
  }
}
```

## Full CRUD test example for canvas apps

This example combines app launch, gallery verification, and form interaction into a complete test suite.

```typescript
import { test, expect, FrameLocator } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

const CANVAS_APP_URL = buildCanvasAppUrlFromEnv();

test.describe('Canvas App - Orders', () => {
  let canvasFrame: FrameLocator;

  test.beforeEach(async ({ page, context }) => {
    const app = new AppProvider(page, context);
    await app.launch({
      app: 'Orders App',
      type: AppType.Canvas,
      mode: AppLaunchMode.Play,
      skipMakerPortal: true,
      directUrl: CANVAS_APP_URL,
    });

    canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
    await canvasFrame
      .locator('[data-control-part="gallery-item"]')
      .first()
      .waitFor({ state: 'visible', timeout: 60000 });
  });

  test('should display orders in gallery', async () => {
    const count = await canvasFrame
      .locator('[data-control-part="gallery-item"]')
      .count();
    expect(count).toBeGreaterThan(0);
  });

  test('should click Add and show form', async ({ page }) => {
    await canvasFrame.locator('[data-control-name="icon3"]').click();
    await page.waitForTimeout(2000);

    const input = canvasFrame.locator('input[type="text"]').first();
    await expect(input).toBeVisible();
  });
});
```

## Discover control names in canvas apps

To find the `data-control-name` values in your app:

1. Open the app in play mode in a browser.
1. Open browser developer tools (**F12**).
1. Use the **Inspector** to hover over controls and look for `data-control-name` attributes.

Alternatively, use the Playwright MCP server to ask an AI assistant to inspect the DOM and generate selectors for you. See [AI-assisted testing](ai-overview.md).

## Next steps

- [Test model-driven apps](model-driven-application.md)
- [Test custom pages](custom-pages.md)
- [Page Object Model](page-object-model.md)

## See also

- [Sample tests](samples.md)
- [AI-assisted test authoring](ai-authoring.md)
- [Environment variables](environment-variables.md)
