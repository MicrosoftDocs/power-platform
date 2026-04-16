---
title: Advanced testing capabilities for Power Platform Playwright Samples
description: Visual comparisons, network mocking, and accessibility testing for Power Platform canvas and model-driven apps using Playwright.
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.subservice: developer
ms.reviewer: jdaly
---

# Advanced testing capabilities

Beyond functional tests, Playwright provides built-in support for visual regression testing, network request mocking, and accessibility auditing. This article shows how to apply each to Power Platform app tests.

## Visual comparison testing

Playwright's `toHaveScreenshot()` assertion captures a baseline screenshot on the first run and compares subsequent runs against it. Pixel-level differences fail the test.

### Capture a canvas app baseline

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

test('gallery matches visual baseline', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({
    app: 'Orders App',
    type: AppType.Canvas,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: buildCanvasAppUrlFromEnv(),
  });

  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
  await canvasFrame
    .locator('[data-control-part="gallery-item"]')
    .first()
    .waitFor({ state: 'visible', timeout: 60000 });

  // Capture the canvas frame only (not the MDA shell chrome)
  const galleryLocator = canvasFrame.locator('[data-control-name="Gallery1"]');
  await expect(galleryLocator).toHaveScreenshot('orders-gallery.png');
});
```

> [!NOTE]
> On the first run, Playwright writes the baseline screenshot to `tests/__screenshots__/`. Commit these files to source control. Subsequent runs diff against them.

### Update baselines

When the UI intentionally changes, update the baselines:

```bash
npx playwright test --update-snapshots
```

### Configure screenshot thresholds

Allow a small pixel difference to accommodate font rendering across environments:

```typescript
// playwright.config.ts
export default defineConfig({
  expect: {
    toHaveScreenshot: {
      maxDiffPixelRatio: 0.01,  // allow 1% pixel difference
      threshold: 0.2,           // per-pixel color difference threshold
    },
  },
});
```

### Compare model-driven app views

For model-driven apps, scope the screenshot to avoid capturing dynamic timestamps:

```typescript
test('order grid matches visual baseline', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({ ... });
  const mda = app.getModelDrivenAppPage();

  await mda.navigateToGridView('nwind_orders');
  await mda.grid.waitForGridLoad();

  // Capture only the grid container, not the full page
  const grid = page.locator('[ref="eBodyContainer"]');
  await expect(grid).toHaveScreenshot('orders-grid.png', {
    mask: [page.locator('[col-id="modifiedon"]')],  // mask dynamic columns
  });
});
```

## Network request mocking

Playwright's `page.route()` intercepts HTTP requests. Use it to mock Dataverse API responses, simulate error conditions, or speed up tests that don't need live data.

### Mock a Dataverse WebApi response

```typescript
test('gallery shows mocked orders', async ({ page, context }) => {
  // Intercept Dataverse API calls before launching the app
  await page.route('**/api/data/v9.2/nwind_orders*', async (route) => {
    await route.fulfill({
      status: 200,
      contentType: 'application/json',
      body: JSON.stringify({
        value: [
          { nwind_ordernumber: 'ORD-MOCK-001', nwind_name: 'Mocked Order 1' },
          { nwind_ordernumber: 'ORD-MOCK-002', nwind_name: 'Mocked Order 2' },
        ],
      }),
    });
  });

  const app = new AppProvider(page, context);
  await app.launch({ ... });

  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
  await expect(
    canvasFrame.locator('[data-control-part="gallery-item"]').first()
  ).toBeVisible({ timeout: 30000 });

  // Verify mocked data appears
  await expect(
    canvasFrame.locator('[data-control-name="Title1"]').getByText('Mocked Order 1')
  ).toBeVisible();
});
```

### Simulate an API error

```typescript
test('shows error state when API fails', async ({ page, context }) => {
  await page.route('**/api/data/v9.2/nwind_orders*', (route) => {
    route.fulfill({ status: 500, body: 'Internal Server Error' });
  });

  const app = new AppProvider(page, context);
  await app.launch({ ... });

  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

  // Verify the app shows an error or empty state
  await expect(canvasFrame.locator('[data-control-name="ErrorLabel1"]')).toBeVisible();
});
```

### Intercept and observe requests (without mocking)

```typescript
test('save triggers a POST to Dataverse', async ({ page, context }) => {
  const apiRequests: string[] = [];

  page.on('request', (req) => {
    if (req.url().includes('/api/data/v9.2/') && req.method() === 'POST') {
      apiRequests.push(req.url());
    }
  });

  // ... perform save action ...

  expect(apiRequests.some((url) => url.includes('nwind_orders'))).toBe(true);
});
```

> [!TIP]
> Combine request observation with mock fulfillment to validate that the correct OData query is sent to Dataverse — useful for verifying that filters and expands are constructed correctly.

## Accessibility testing

Playwright integrates with [axe-core](https://github.com/dequelabs/axe-core) via the `@axe-core/playwright` package to audit pages for WCAG compliance.

### Install axe-core for Playwright

```bash
cd packages/e2e-tests
npm install --save-dev @axe-core/playwright
```

### Audit a canvas app for accessibility violations

```typescript
import { test, expect } from '@playwright/test';
import AxeBuilder from '@axe-core/playwright';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

test('canvas app has no critical accessibility violations', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({
    app: 'Orders App',
    type: AppType.Canvas,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: buildCanvasAppUrlFromEnv(),
  });

  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
  await canvasFrame
    .locator('[data-control-part="gallery-item"]')
    .first()
    .waitFor({ state: 'visible', timeout: 60000 });

  // Audit the canvas iframe content
  const frame = page.frame({ name: 'fullscreen-app-host' });
  if (!frame) throw new Error('Canvas frame not found');

  const results = await new AxeBuilder({ page })
    .withTags(['wcag2a', 'wcag2aa'])
    .include('iframe[name="fullscreen-app-host"]')
    .analyze();

  expect(results.violations).toEqual([]);
});
```

### Audit a model-driven app form

```typescript
test('order form has no accessibility violations', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({ ... });
  const mda = app.getModelDrivenAppPage();

  await mda.navigateToGridView('nwind_orders');
  await mda.grid.waitForGridLoad();
  await mda.grid.openRecord({ rowNumber: 0 });

  const results = await new AxeBuilder({ page })
    .withTags(['wcag2a', 'wcag2aa'])
    .exclude('.ms-Spinner')  // exclude loading spinners
    .analyze();

  // Filter to critical and serious violations only
  const critical = results.violations.filter(
    (v) => v.impact === 'critical' || v.impact === 'serious'
  );

  expect(critical).toEqual([]);
});
```

### Report accessibility violations

To get readable output when violations are found, format them in the test output:

```typescript
if (results.violations.length > 0) {
  const summary = results.violations
    .map((v) => `[${v.impact}] ${v.id}: ${v.description}`)
    .join('\n');

  throw new Error(`Accessibility violations found:\n${summary}`);
}
```

### Exclude known violations

If your app has known violations that are accepted or being tracked separately:

```typescript
const results = await new AxeBuilder({ page })
  .withTags(['wcag2a', 'wcag2aa'])
  .disableRules(['color-contrast'])  // Known issue tracked in #123
  .analyze();
```

> [!IMPORTANT]
> Disabling rules should be temporary. Track each disabled rule with a work item reference so it gets fixed.

## Combine capabilities

You can combine visual, network, and accessibility tests in the same test file. A common pattern is a **smoke test suite** that runs all three:

```typescript
test.describe('Canvas app smoke tests', () => {
  test('loads successfully (visual)', async ({ page, context }) => {
    // ... launch app ...
    await expect(canvasFrame.locator('[data-control-name="Gallery1"]'))
      .toHaveScreenshot('gallery-baseline.png');
  });

  test('Dataverse API is called on load (network)', async ({ page, context }) => {
    const calls: string[] = [];
    page.on('request', (req) => {
      if (req.url().includes('/api/data/')) calls.push(req.url());
    });
    // ... launch app ...
    expect(calls.length).toBeGreaterThan(0);
  });

  test('has no accessibility violations (a11y)', async ({ page, context }) => {
    // ... launch app ...
    const results = await new AxeBuilder({ page }).withTags(['wcag2aa']).analyze();
    expect(results.violations.filter((v) => v.impact === 'critical')).toEqual([]);
  });
});
```

## Next steps

- [API testing through form context](api-testing.md)
- [Page Object Model](page-object-model.md)
- [CI/CD integration](cicd.md)

## See also

- [Playwright visual comparisons](https://playwright.dev/docs/screenshots)
- [Playwright network mocking](https://playwright.dev/docs/mock)
- [axe-core Playwright integration](https://github.com/dequelabs/axe-core-npm/tree/develop/packages/playwright)
- [Sample tests](samples.md)
