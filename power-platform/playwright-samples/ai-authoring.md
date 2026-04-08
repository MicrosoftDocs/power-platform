---
title: AI test authoring with Copilot for Power Platform Playwright Samples
description: Use Playwright codegen and AI coding assistants to record interactions and generate Playwright tests for Power Platform canvas and model-driven apps.
author: microsoft
ms.author: deepak.kamboj
ms.topic: how-to
ms.date: 04/07/2025
ms.subservice: power-platform-playwright-samples
---

# AI test authoring with Copilot

Playwright's built-in code generator ([codegen](https://playwright.dev/docs/codegen-intro)) records your browser interactions as TypeScript test code. Combine it with an AI coding assistant to clean up the recording, apply Power Platform Playwright toolkit conventions, and produce production-ready tests without writing selectors by hand.

## How the workflow works

1. **Record** — Run `playwright codegen` against your Power Platform app. Playwright captures every click, fill, and navigation as raw test code.
2. **Paste** — Drop the recorded code into your AI chat alongside the toolkit API docs or your custom instructions.
3. **Rewrite** — Ask the AI to rewrite the recording using `AppProvider`, `ModelDrivenAppPage`, `GridComponent`, and other toolkit classes.
4. **Review** — Check the generated test for correctness, adjust timeouts, and commit.

This workflow is especially useful when you're new to the toolkit API or working with an unfamiliar app.

## Step 1: Record with Playwright codegen

### Install Playwright browsers

```bash
cd packages/e2e-tests
npx playwright install chromium
```

### Run codegen against your app

```bash
npx playwright codegen --save-storage=.playwright-ms-auth/state-record.json \
  "https://apps.powerapps.com/play/<your-app-id>"
```

This opens a browser and a Playwright Inspector side-by-side. Interact with your app — click buttons, fill forms, navigate. The Inspector records every action as TypeScript.

> [!TIP]
> If your app requires authentication, authenticate first and pass the storage state:
> ```bash
> npx playwright codegen --load-storage=.playwright-ms-auth/state-<email>.json \
>   "https://apps.powerapps.com/play/<your-app-id>"
> ```

### Copy the generated code

When done, copy the generated test from the Playwright Inspector. It will look something like:

```typescript
import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('https://apps.powerapps.com/play/...');
  await page.frameLocator('iframe[name="fullscreen-app-host"]')
    .locator('[data-control-name="icon3"]').click();
  await page.frameLocator('iframe[name="fullscreen-app-host"]')
    .locator('input[aria-label="Account Name"]').fill('Contoso');
  // ...
});
```

## Step 2: Rewrite with AI

Paste the recording into your AI chat. Then ask:

> "Rewrite this Playwright codegen recording as a proper test using the Power Platform Playwright toolkit. Use `AppProvider` to launch the app, scope the frame locator to a variable, add appropriate `waitFor` calls before interactions, and use `expect` assertions from `@playwright/test`."

If you have a [custom instructions file](ai-custom-instructions.md) configured, the AI applies your project conventions automatically. Otherwise, share the relevant code snippet from [canvas-application.md](canvas-application.md) or [model-driven-application.md](model-driven-application.md) as context.

### Example: AI-rewritten canvas test

**Before (codegen output):**

```typescript
test('test', async ({ page }) => {
  await page.goto('https://apps.powerapps.com/play/<app-id>');
  await page.frameLocator('iframe[name="fullscreen-app-host"]')
    .locator('[data-control-name="icon3"]').click();
  await page.frameLocator('iframe[name="fullscreen-app-host"]')
    .locator('input[aria-label="Account Name"]').fill('Contoso');
  await page.frameLocator('iframe[name="fullscreen-app-host"]')
    .locator('[data-control-name="IconButton_Accept1"] [role="button"]').click();
});
```

**After (AI rewrite):**

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

test('should add a new account', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({
    app: 'Accounts App',
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

  // Click Add
  await canvasFrame.locator('[data-control-name="icon3"]').click();

  // Fill form
  await canvasFrame.locator('input[aria-label="Account Name"]').fill('Contoso');

  // Save
  await canvasFrame
    .locator('[data-control-name="IconButton_Accept1"] [role="button"]')
    .click();

  // Verify record appears
  const newItem = canvasFrame
    .locator('[data-control-part="gallery-item"]')
    .filter({ hasText: 'Contoso' });

  await expect(newItem).toBeVisible({ timeout: 30000 });
});
```

## Step 3: Use codegen in headed mode for model-driven apps

For model-driven apps, record the grid navigation and form interactions:

```bash
npx playwright codegen --load-storage=.playwright-ms-auth/state-mda-<email>.json \
  "https://<org>.crm.dynamics.com/main.aspx?appid=<app-id>"
```

Then ask AI to rewrite using `ModelDrivenAppPage`:

> "Rewrite this codegen recording to use `ModelDrivenAppPage`. Replace raw `page.locator()` grid clicks with `mda.grid.filterByKeyword()`, `mda.grid.openRecord()`, `mda.form.getAttribute()`, and `mda.form.save()`."

## Use GitHub Copilot Chat for test authoring

In VS Code with GitHub Copilot, you can author tests directly in the chat panel without codegen:

1. Open the relevant test file in the editor.
2. Open Copilot Chat (`Ctrl+Shift+I`).
3. Ask:

   > "@workspace Write a test in `tests/northwind/canvas/canvas-app-crud.test.ts` that opens the gallery, finds the item titled 'Northwind Traders', clicks it, edits the phone field, and saves."

Copilot reads your existing test file and toolkit imports to produce contextually accurate test code.

> [!NOTE]
> For best results, keep a well-written reference test in the same file or folder. Copilot uses it as a pattern to match your style.

## Use Claude for larger test suites

Claude (via Claude Code or Claude.ai) excels at generating multiple related tests at once:

> "Given this canvas app structure [paste canvas-application.md content], generate a full test suite covering: (1) gallery loads with items, (2) search filters results, (3) create new record, (4) edit existing record, (5) delete record."

Claude generates all five tests in a single response, following the patterns in your context.

## Playwright CLI for quick test generation

The [Playwright CLI](https://github.com/microsoft/playwright-cli) provides additional utilities for test management:

```bash
# Install
npm install -g @playwright/cli

# Generate test stubs for a URL
playwright-cli generate --url "https://apps.powerapps.com/play/<app-id>"

# List all tests in a project
playwright-cli list

# Show test tree
playwright-cli show-tree packages/e2e-tests
```

> [!NOTE]
> The Playwright CLI is a separate package from the Playwright test runner. It adds convenience commands for test discovery and scaffolding.

## Best practices for AI-generated tests

- **Always review generated selectors** — AI may produce selectors that are too brittle or too broad. Verify `data-control-name` values against the actual DOM.
- **Check timeouts** — AI doesn't know your app's load time. Add 60-second timeouts for gallery `waitFor` calls on Dataverse-backed apps.
- **Use unique test data** — AI-generated tests often use hardcoded strings. Replace with `Date.now()` suffixes to avoid conflicts between test runs.
- **Validate with `expect`** — Codegen recordings often lack assertions. Ask AI to add meaningful `expect` calls after each action.

## Next steps

- [Custom instructions for AI agents](ai-custom-instructions.md)
- [Playwright MCP server](ai-mcp.md)
- [Sample tests](samples.md)

## See also

- [Playwright codegen documentation](https://playwright.dev/docs/codegen-intro)
- [AI-assisted testing overview](ai-overview.md)
- [Canvas app testing guide](canvas-application.md)
