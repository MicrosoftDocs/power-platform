---
title: Migrate from Power Apps Test Engine to Power Platform Playwright samples
description: Step-by-step guide to migrate existing Power Apps Test Engine YAML tests to Playwright TypeScript tests using the Power Platform Playwright samples toolkit.
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.reviewer: jdaly
---

# Migrate from Power Apps Test Engine

Power Apps Test Engine uses YAML-based test definitions that run against a specialized test host. Power Platform Playwright samples use TypeScript and the standard Playwright test runner, giving you access to the full Playwright API, ecosystem tooling, and CI/CD integrations.

This guide maps Test Engine concepts to their Playwright equivalents and walks through a concrete migration example.

## Concept mapping

The following table shows how Test Engine concepts map to their Playwright equivalents.

| Test Engine concept | Playwright equivalent |
|---|---|
| YAML test file | TypeScript test file (`*.test.ts`) |
| `testSuite.testCases` | `test.describe()` blocks |
| `testStep` | `test()` function |
| `appLogicalName` | `directUrl` in `AppProvider.launch()` |
| `onTestCaseStart` | `test.beforeEach()` |
| `Assert` | `expect()` from `@playwright/test` |
| `Select` (control interaction) | `canvasFrame.locator('[data-control-name="..."]').click()` |
| `SetProperty` | `canvasFrame.locator('input[...]').fill()` |
| `Screenshot` | `page.screenshot()` or `toHaveScreenshot()` |
| `environmentVariables` | `.env` file variables |
| Power Fx formulas in YAML | TypeScript expressions |

## Before you begin

Complete these prerequisites before starting the migration.

1. Clone the repository and install dependencies:

   ```bash
   git clone https://github.com/microsoft/power-platform-playwright-samples.git
   cd power-platform-playwright-samples
   node common/scripts/install-run-rush.js install
   ```

1. Copy your app URL from the Test Engine YAML `appLogicalName` or the Power Apps make portal.

1. Set up authentication - see [Authentication guide](authentication-guide.md).

## Step 1: Identify your app type

Test Engine supports canvas apps. If you're migrating:

- **Canvas app tests** → Follow [Test canvas apps](canvas-application.md).
- **Custom page tests** → Follow [Test custom pages](custom-pages.md).
- **Model-driven app tests** → Follow [Test model-driven apps](model-driven-application.md).

## Step 2: Map your test structure

### Test Engine YAML

A typical Test Engine test definition looks like this.

```yaml
testSuite:
  testSuiteName: OrdersTests
  testCases:
    - testCaseName: CreateOrder
      testSteps: |
        Select(AddButton);
        SetProperty(OrderNumberInput, "ORD-TEST");
        Select(SaveButton);
        Assert(Label1.Text = "Saved");
```

### Playwright TypeScript equivalent

Here's the same test rewritten by using Playwright and the Power Platform toolkit.

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

test.describe('OrdersTests', () => {
  test('CreateOrder', async ({ page, context }) => {
    const app = new AppProvider(page, context);
    await app.launch({
      app: 'Orders App',
      type: AppType.Canvas,
      mode: AppLaunchMode.Play,
      skipMakerPortal: true,
      directUrl: buildCanvasAppUrlFromEnv(),
    });

    const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

    // Wait for app to load
    await canvasFrame
      .locator('[data-control-part="gallery-item"]')
      .first()
      .waitFor({ state: 'visible', timeout: 60000 });

    // Select(AddButton)
    await canvasFrame.locator('[data-control-name="AddButton"] [role="button"]').click();

    // SetProperty(OrderNumberInput, "ORD-TEST")
    await canvasFrame.locator('input[aria-label="Order Number"]').fill('ORD-TEST');

    // Select(SaveButton)
    await canvasFrame.locator('[data-control-name="SaveButton"] [role="button"]').click();

    // Assert(Label1.Text = "Saved")
    await expect(canvasFrame.locator('[data-control-name="Label1"]')).toHaveText('Saved');
  });
});
```

## Step 3: Map control selectors

Test Engine uses control names from Power Apps Studio directly in YAML. In Playwright, use `data-control-name` attributes with the same values:

| Test Engine | Playwright |
|---|---|
| `Select(MyButton)` | `canvasFrame.locator('[data-control-name="MyButton"] [role="button"]').click()` |
| `SetProperty(MyInput, "text")` | `canvasFrame.locator('input[aria-label="My Label"]').fill("text")` |
| `Assert(MyLabel.Text = "x")` | `expect(canvasFrame.locator('[data-control-name="MyLabel"]')).toHaveText("x")` |
| `Select(GalleryItem)` | `canvasFrame.locator('[data-control-part="gallery-item"]').filter({ hasText: 'x' }).click()` |

> [!TIP]
> To find the `data-control-name` value for a control, open the app in play mode, open DevTools (**F12**), and inspect the element. The value matches the control name you set in Power Apps Studio.

## Step 4: Map environment variables

Test Engine uses an `environmentVariables` section in YAML. Move these values to your `.env` file:

```yaml
# Test Engine YAML
environmentVariables:
  - name: appUrl
    value: https://apps.powerapps.com/play/...
```

```ini
# packages/e2e-tests/.env
CANVAS_APP_URL=https://apps.powerapps.com/play/...
```

## Step 5: Map setup and teardown

Convert Test Engine lifecycle hooks to Playwright's built-in `beforeEach` and `afterEach` functions.

```yaml
# Test Engine
testSuite:
  onTestCaseStart: |
    Navigate(HomeScreen);
```

```typescript
// Playwright
test.beforeEach(async ({ page, context }) => {
  // Re-launch the app for each test (equivalent to onTestCaseStart navigation)
  const app = new AppProvider(page, context);
  await app.launch({ ... });
});
```

## Step 6: Replace Power Fx assertions

Test Engine uses Power Fx expressions in `Assert()`. Replace with Playwright `expect()` assertions:

| Power Fx | Playwright |
|---|---|
| `Assert(Label1.Text = "Done")` | `expect(frame.locator('[data-control-name="Label1"]')).toHaveText('Done')` |
| `Assert(CountRows(Gallery1.AllItems) > 0)` | `expect(await frame.locator('[data-control-part="gallery-item"]').count()).toBeGreaterThan(0)` |
| `Assert(IsVisible(ErrorLabel))` | `expect(frame.locator('[data-control-name="ErrorLabel"]')).toBeVisible()` |
| `Assert(!IsVisible(Spinner))` | `expect(frame.locator('[data-control-name="Spinner"]')).not.toBeVisible()` |

## Key differences to be aware of

Keep these behavioral differences in mind as you migrate your tests.

| Area | Test Engine | Playwright |
|---|---|---|
| **Waits** | Automatic (Test Engine handles timing) | Explicit `waitFor()` required |
| **Gallery timeouts** | Handled internally | Use 60-second timeout for Dataverse galleries |
| **Test isolation** | Each test resets app state | Use `beforeEach` to re-launch or navigate home |
| **Screenshots** | Built-in `Screenshot` step | `page.screenshot()` or `toHaveScreenshot()` |
| **Error reporting** | YAML-level | Playwright HTML report + trace viewer |

## Run your migrated tests

After migrating your tests, authenticate and run them by using these commands.

```bash
cd packages/e2e-tests
npm run auth:headful      # authenticate
npx playwright test       # run all tests
npx playwright test --ui  # run with interactive UI
```

## Troubleshoot migration issues

Refer to the following table for common migration problems and their solutions.

| Symptom | Resolution |
|---|---|
| Gallery doesn't load | Add `waitFor({ timeout: 60000 })` before interacting |
| Control not found | Verify `data-control-name` in DevTools - it might differ from Power Fx name |
| Selector matches multiple elements | Use `.filter()` or `.nth(0)` to narrow selection |
| Tests run but assertion fails immediately | Add explicit `waitFor` or `toBeVisible` before asserting |

## Next steps

- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)
- [Sample tests](samples.md)

## See also

- [Get started](get-started.md)
- [Authentication guide](authentication-guide.md)
- [Page Object Model](page-object-model.md)
