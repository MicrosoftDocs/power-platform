---
title: Write, debug, and run tests locally with Power Platform Playwright Samples
description: Set up your local development environment to write, run, and debug Power Platform Playwright tests using VS Code, Claude Code, and GitHub Copilot.
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.subservice: developer
ms.reviewer: jdaly
---

# Write, debug, and run tests locally

This article covers the full local development loop: writing tests in your editor, running them against a live Power Platform environment, and debugging failures using Playwright's built-in tools — with AI assistance from Claude Code and GitHub Copilot.

## Prerequisites

- Node.js 18 or later
- VS Code (recommended) or any TypeScript-capable editor
- A Power Platform environment with your app deployed
- Authentication configured — see [Authentication guide](authentication-guide.md)

## Set up your workspace

1. Clone the repository:

   ```bash
   git clone https://github.com/microsoft/power-platform-playwright-samples.git
   cd power-platform-playwright-samples
   ```

2. Install dependencies:

   ```bash
   node common/scripts/install-run-rush.js install
   ```

3. Install the recommended VS Code extensions:

   - **Playwright Test for VS Code** (`ms-playwright.playwright`) — run and debug tests from the sidebar
   - **GitHub Copilot** (`GitHub.copilot`) — AI test authoring in-editor
   - **ESLint** (`dbaeumer.vscode-eslint`) — inline linting

4. Open the workspace:

   ```bash
   code power-platform-playwright-samples.code-workspace
   ```

---

## Write tests

### File naming and location

Place test files in `packages/e2e-tests/tests/`. Use the naming pattern `<feature>.test.ts`:

```
packages/e2e-tests/
└── tests/
    └── northwind/
        ├── canvas/
        │   └── canvas-app-crud.test.ts
        └── mda/
            ├── model-driven-crud.test.ts
            └── custom-page-crud.test.ts
```

### Basic test structure

```typescript
import { test, expect } from '@playwright/test';
import {
  AppProvider,
  AppType,
  AppLaunchMode,
  buildCanvasAppUrlFromEnv,
} from 'power-platform-playwright-toolkit';

test.describe('Feature name', () => {
  test.beforeEach(async ({ page, context }) => {
    const app = new AppProvider(page, context);
    await app.launch({
      app: 'My App',
      type: AppType.Canvas,
      mode: AppLaunchMode.Play,
      skipMakerPortal: true,
      directUrl: buildCanvasAppUrlFromEnv(),
    });
  });

  test('should do something', async ({ page }) => {
    const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
    await canvasFrame
      .locator('[data-control-part="gallery-item"]')
      .first()
      .waitFor({ state: 'visible', timeout: 60000 });

    // your assertions here
  });
});
```

### Find control names in your app

You need `data-control-name` values to write selectors for canvas controls:

1. Open your app in play mode in a browser.
2. Press **F12** to open DevTools.
3. Click the **Inspector** (Elements) tab.
4. Hover over a control — the attribute `data-control-name="Button1"` appears.

Alternatively, ask Claude Code or GitHub Copilot to inspect the DOM for you using the [Playwright MCP server](ai-mcp.md).

---

## Run tests

### Run all tests

```bash
cd packages/e2e-tests
npx playwright test
```

### Run a specific file

```bash
npx playwright test tests/northwind/canvas/canvas-app-crud.test.ts
```

### Run a specific test by name

```bash
npx playwright test --grep "should create an account"
```

### Run a specific project (canvas or MDA)

```bash
npx playwright test --project=canvas
npx playwright test --project=mda
```

### Run with the Playwright UI (recommended for local development)

The Playwright UI gives you a visual test runner with time-travel debugging:

```bash
npx playwright test --ui
```

Use the UI to:

- See each test listed with pass/fail status
- Click a test to replay it step by step
- View screenshots, traces, and network requests at each step
- Re-run a single test with one click

### Run in headed mode (see the browser)

```bash
npx playwright test --headed
```

Headed mode lets you watch the browser as tests execute. Useful for understanding what the app looks like at each step.

### Run with slow motion

```bash
npx playwright test --headed --slow-mo=500
```

Each action is delayed by 500 ms, making it easy to follow the test execution visually.

---

## Debug tests

### Debug with the Playwright Inspector

The Inspector pauses execution and lets you step through actions:

```bash
npx playwright test --debug
```

Or add `await page.pause()` inside your test at the point you want to break:

```typescript
test('should do something', async ({ page }) => {
  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
  await canvasFrame.locator('[data-control-part="gallery-item"]').first()
    .waitFor({ state: 'visible', timeout: 60000 });

  await page.pause(); // <-- execution pauses here; Inspector opens

  await canvasFrame.locator('[data-control-name="MyButton"]').click();
});
```

When paused, the Inspector shows:
- The current locator highlighted in the browser
- A locator picker tool to click any element and get its selector
- Step forward/back controls

### Debug in VS Code

The **Playwright Test for VS Code** extension adds a **Testing** sidebar (beaker icon). From there you can:

1. Click the play button next to any test to run it.
2. Click the bug icon to run it in debug mode — VS Code breakpoints work.
3. Set a breakpoint on any line of your test, hit **Debug Test**, and VS Code pauses there.

To configure the VS Code debugger manually, add to `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug Playwright Test",
      "type": "node",
      "request": "launch",
      "program": "${workspaceFolder}/node_modules/.bin/playwright",
      "args": ["test", "--project=canvas", "--headed", "--debug"],
      "cwd": "${workspaceFolder}/packages/e2e-tests",
      "console": "integratedTerminal",
      "env": {
        "PWDEBUG": "1"
      }
    }
  ]
}
```

### Read the HTML report

After a test run, open the HTML report:

```bash
npx playwright show-report
```

The report shows:
- Pass/fail status for each test
- Screenshots captured on failure
- Full trace for each test (if `trace: 'on-first-retry'` is set)

### Read the trace viewer

Traces are recorded zip files that let you replay a test execution step by step:

```bash
npx playwright show-trace test-results/<test-folder>/trace.zip
```

Or drag the zip file onto [trace.playwright.dev](https://trace.playwright.dev).

The trace viewer shows:
- Every Playwright action with timing
- DOM snapshots before and after each action
- Network requests
- Console logs and errors

> [!TIP]
> Set `trace: 'on'` in `playwright.config.ts` during debugging to capture traces for all runs, not just retries.

---

## Write and debug with Claude Code

[Claude Code](https://claude.ai/code) is an AI coding assistant that runs in your terminal with full access to your project files, shell, and browser (via the Playwright MCP server).

### Set up Claude Code for this project

1. Install Claude Code:

   ```bash
   npm install -g @anthropic-ai/claude-code
   ```

2. Create `packages/e2e-tests/CLAUDE.md` with your project conventions — see [Custom instructions for AI agents](ai-custom-instructions.md).

3. Add the Playwright MCP server to `~/.claude/settings.json`:

   ```json
   {
     "mcpServers": {
       "playwright": {
         "command": "npx",
         "args": ["@playwright/mcp"]
       }
     }
   }
   ```

4. Start Claude Code from the repo root:

   ```bash
   claude
   ```

### Write a new test with Claude Code

In the Claude Code session, describe the test you want:

> "Write a Playwright test for the Accounts canvas app. It should open the gallery, click Add, fill in the account name with a unique value, save, then verify the new item appears in the gallery. Put it in `packages/e2e-tests/tests/accounts/accounts.test.ts`."

Claude Code reads your `CLAUDE.md` conventions, writes the test file, and confirms. Review the file before running.

### Ask Claude Code to inspect your app

With the Playwright MCP server connected:

> "Navigate to `<your-canvas-app-url>`. Inspect the DOM inside `iframe[name='fullscreen-app-host']` and find the `data-control-name` values for the gallery, the Add button, and the account name input. Then write selectors for each."

Claude Code opens a browser, navigates, inspects the DOM, and returns precise selectors.

### Fix a failing test with Claude Code

Paste the test output into Claude Code:

> "This test is failing with the following error: [paste error]. Here is the test file: [paste or reference the file]. Diagnose the issue and fix it."

Claude Code reads the file, understands the error, and suggests a fix — often catching issues like wrong selectors, missing `waitFor`, or data conflicts.

### Run tests from Claude Code

Claude Code can run tests directly:

> "Run `npx playwright test tests/accounts/accounts.test.ts --headed` and tell me if it passes."

Claude Code executes the command, reads the output, and reports results. If the test fails, it can immediately propose a fix.

---

## Write and debug with GitHub Copilot

GitHub Copilot integrates directly into VS Code and JetBrains IDEs, providing inline completions and a chat panel.

### Enable Copilot for this project

1. Install the **GitHub Copilot** extension in VS Code.
2. Create `.github/copilot-instructions.md` with your project conventions — see [Custom instructions for AI agents](ai-custom-instructions.md).
3. Open a test file — Copilot reads existing tests and learns the pattern.

### Use inline completions

As you type, Copilot completes test code based on context. Start typing a `test()` block and press **Tab** to accept:

```typescript
test('should filter orders by keyword', async ({ page }) => {
  // Copilot suggests: await mda.grid.filterByKeyword('ORD-001');
```

The more existing tests it can see, the better the suggestions.

### Use Copilot Chat to generate tests

Open Copilot Chat (`Ctrl+Shift+I`) and ask:

> "@workspace Write a test that navigates to the Orders model-driven app, filters the grid by 'ORD-001', opens the first record, updates the notes field, saves, and verifies the form is no longer dirty."

Copilot reads your codebase via `@workspace` and generates a test that matches your existing style.

### Fix a failing test with Copilot

1. Open the failing test file.
2. Select the failing test function.
3. Open Copilot Chat and ask:

   > "Fix this test. It's failing because the gallery selector times out. The gallery takes up to 60 seconds to load Dataverse data."

Copilot updates the `waitFor` timeout and may suggest other improvements.

### Use Copilot to explain an error

Paste the error message into Copilot Chat:

> "Explain this Playwright error and how to fix it in the context of a Power Platform canvas app test: `TimeoutError: locator.waitFor: Timeout 30000ms exceeded`"

Copilot explains the error and gives specific advice about canvas iframe scoping and timeout settings.

### Generate selectors with Copilot

With DevTools open in your browser showing the canvas DOM, copy the relevant HTML and ask Copilot:

> "Given this HTML from a Power Apps canvas app, write the Playwright locator to click the Save button scoped to `iframe[name='fullscreen-app-host']`."

---

## Recommended local development workflow

1. **Set up once:** Configure `.env`, run `auth:headful`, verify the sample tests pass.
2. **Inspect first:** Open your app, use DevTools or the Playwright MCP server to find control names.
3. **Write with AI:** Use Claude Code or Copilot Chat to scaffold the test from a description.
4. **Run with UI:** `npx playwright test --ui` gives immediate visual feedback.
5. **Debug with Inspector:** `await page.pause()` at the failure point to inspect state live.
6. **Read the trace:** If a test is flaky in CI, open the trace zip to see exactly what happened.
7. **Commit selectively:** Stage only the test files — never commit `.env` or `.playwright-ms-auth/`.

---

## Troubleshoot common local issues

| Symptom | Likely cause | Fix |
|---|---|---|
| `Storage state file does not exist` | Auth never run | `npm run auth:headful` |
| `Authentication tokens have expired` | Session expired (>1 hour) | Re-run `npm run auth:headful` |
| `TimeoutError` on gallery | Dataverse load time | Increase timeout to `60000` |
| `Strict mode violation` — N elements | Selector too broad | Add `.filter()` or `.first()` |
| Test passes locally, fails in CI | Timing or environment diff | Add `await page.waitForLoadState()`, check retries |
| `ERR_ABORTED` during MDA auth | Previous browser process alive | Wait a few seconds and retry `npm run auth:mda:headful` |
| VS Code Playwright extension not finding tests | Wrong `testDir` | Check `playwright.config.ts` → `testDir: './tests'` |

## Next steps

- [Page Object Model](page-object-model.md)
- [AI-assisted testing overview](ai-overview.md)
- [CI/CD integration](cicd.md)

## See also

- [Playwright MCP server](ai-mcp.md)
- [Custom instructions for AI agents](ai-custom-instructions.md)
- [Playwright VS Code extension](https://playwright.dev/docs/getting-started-vscode)
- [Playwright debugging documentation](https://playwright.dev/docs/debug)
