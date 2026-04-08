---
title: Custom instructions for AI agents in Power Platform Playwright Samples
description: Write CLAUDE.md, copilot-instructions.md, and agents.md files that teach AI coding assistants your project conventions for generating Power Platform Playwright tests.
author: microsoft
ms.author: deepak.kamboj
ms.topic: how-to
ms.date: 04/07/2025
ms.subservice: power-platform-playwright-samples
---

# Custom instructions for AI agents

AI coding assistants learn from context. When you provide a custom instructions file that describes your project conventions, the AI generates test code that matches your style, uses the right toolkit APIs, and avoids common mistakes — without you having to explain the same patterns every session.

This article shows how to write custom instruction files for different AI assistants and what to include for Power Platform Playwright testing.

## Why custom instructions matter

Without custom instructions, AI assistants may:

- Use raw `page.locator()` instead of `ModelDrivenAppPage` grid and form methods
- Forget to scope locators to `iframe[name="fullscreen-app-host"]`
- Use short timeouts that fail on Dataverse-backed galleries
- Generate brittle `nth-child` selectors instead of `[row-index]` attributes
- Use hardcoded test data that causes conflicts between runs

Custom instructions solve this by giving the AI an always-available reference for your toolkit's API and patterns.

## CLAUDE.md for Claude (Anthropic)

Claude Code reads a `CLAUDE.md` file at the repository root (and in subdirectories). Create `packages/e2e-tests/CLAUDE.md`:

```markdown
# Power Platform Playwright Tests

## Project structure

- Toolkit: `power-platform-playwright-toolkit` (local package)
- Tests: `packages/e2e-tests/tests/`
- Page objects: `packages/e2e-tests/pages/`
- Auth state: `packages/e2e-tests/.playwright-ms-auth/`

## Key conventions

### Always use AppProvider to launch apps

```typescript
const app = new AppProvider(page, context);
await app.launch({
  app: 'App Name',
  type: AppType.Canvas,           // or AppType.ModelDriven
  mode: AppLaunchMode.Play,
  skipMakerPortal: true,
  directUrl: process.env.CANVAS_APP_URL!,
});
```

### Canvas apps: always scope to the iframe

```typescript
const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');
```

### Canvas apps: use 60s timeout for gallery waitFor

```typescript
await canvasFrame.locator('[data-control-part="gallery-item"]').first()
  .waitFor({ state: 'visible', timeout: 60000 });
```

### Model-driven apps: use GridComponent and FormComponent

```typescript
const mda = app.getModelDrivenAppPage();
await mda.grid.filterByKeyword('ORD-001');
await mda.grid.waitForGridLoad();
await mda.grid.openRecord({ rowNumber: 0 });
await mda.form.getAttribute('nwind_ordernumber');
await mda.form.save();
```

### Use unique test data to avoid conflicts

```typescript
const accountName = `Test Account ${Date.now()}`;
```

### MDA grid: use [row-index] not nth-child

The GridComponent handles this internally — do not write raw nth-child selectors.

### Auth: use getStorageStatePath for storageState

```typescript
import { getStorageStatePath } from 'power-platform-playwright-toolkit';
test.use({ storageState: getStorageStatePath(process.env.MS_AUTH_EMAIL!) });
```

## Imports

Always import from the toolkit package:

```typescript
import {
  AppProvider,
  AppType,
  AppLaunchMode,
  buildCanvasAppUrlFromEnv,
  getStorageStatePath,
} from 'power-platform-playwright-toolkit';
```
```

### Advanced Claude Code configuration

For per-session context, use the `/init` slash command to load project context, or add agent-level memory under `.claude/` in the repo root:

```
.claude/
  settings.json      # MCP server config, permissions
  commands/          # Custom slash commands
```

Example `.claude/settings.json`:

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp"]
    }
  },
  "permissions": {
    "allow": [
      "Bash(npx playwright *)",
      "Bash(npm run auth*)"
    ]
  }
}
```

## .github/copilot-instructions.md for GitHub Copilot

GitHub Copilot reads `.github/copilot-instructions.md` in your repository. Create this file:

```markdown
# Copilot instructions for Power Platform Playwright tests

## Tech stack
- Playwright test runner with TypeScript
- Custom toolkit: `power-platform-playwright-toolkit`
- Rush monorepo (use `node common/scripts/install-run-rush.js build` not `npm run build`)

## Test file conventions
- Tests live in `packages/e2e-tests/tests/`
- Page objects live in `packages/e2e-tests/pages/`
- Import from `'power-platform-playwright-toolkit'`, not from relative paths

## App launch
Always use `AppProvider` with `skipMakerPortal: true` and `directUrl`.

## Canvas apps
- Scope all locators to `page.frameLocator('iframe[name="fullscreen-app-host"]')`
- Use 60 second timeouts for gallery `waitFor` calls
- Identify controls via `data-control-name` attribute (inspect in DevTools)

## Model-driven apps
- Use `app.getModelDrivenAppPage()` to get `ModelDrivenAppPage`
- Use `mda.grid.*` for grid interactions, `mda.form.*` for form interactions
- After `filterByKeyword`, always call `mda.grid.waitForGridLoad()`

## Test data
- Always use unique names: `\`Test ${Date.now()}\``
- Never hardcode strings that could clash across parallel test runs
```

## agents.md for Cursor and Windsurf

Cursor reads `.cursorrules` and Windsurf reads `.windsurfrules` at the repository root. Create either file with the same content:

```markdown
# Power Platform Playwright test conventions

You are helping write end-to-end tests for Power Platform apps using Playwright and a custom toolkit.

## Framework
- Test runner: Playwright (`@playwright/test`)
- Toolkit: `power-platform-playwright-toolkit` (workspace package)
- App types: Canvas, ModelDriven, CustomPage (canvas embedded in MDA)

## Critical rules

1. **Canvas apps always use an iframe**
   - Frame: `page.frameLocator('iframe[name="fullscreen-app-host"]')`
   - All canvas locators must be scoped to this frame

2. **Gallery timeouts must be 60 seconds**
   - Dataverse galleries take 30–60s to load
   - Use `waitFor({ state: 'visible', timeout: 60000 })`

3. **Model-driven grids use GridComponent**
   - Never use raw `page.locator('[role="row"]')` for grid rows
   - Use `mda.grid.filterByKeyword()`, `mda.grid.getCellValue()`, `mda.grid.openRecord()`

4. **Always use unique test data**
   - Pattern: `` `Test Name ${Date.now()}` ``

5. **Import only from the toolkit**
   - `import { AppProvider, AppType, AppLaunchMode } from 'power-platform-playwright-toolkit'`
```

## Playwright test agents

[Playwright test agents](https://playwright.dev/docs/test-agents) are long-running AI processes that can execute and fix tests autonomously. Configure an agent to understand your toolkit by passing your custom instructions as system context:

```typescript
// playwright.config.ts
import { defineConfig } from '@playwright/test';

export default defineConfig({
  // ...
  use: {
    // Agent context: pass custom instructions to the test agent
    agentContext: {
      systemPrompt: `
        You are testing Power Platform apps using the power-platform-playwright-toolkit.
        Canvas apps render in iframe[name="fullscreen-app-host"].
        Always scope canvas locators to the frame.
        Gallery waitFor timeouts should be 60000ms.
        Use mda.grid.* and mda.form.* for model-driven apps.
      `,
    },
  },
});
```

> [!NOTE]
> Playwright test agents are available in Playwright 1.50 and later. The feature is experimental. See [playwright.dev/docs/test-agents](https://playwright.dev/docs/test-agents) for the latest API.

## What to include in custom instructions

A good custom instructions file for this project covers:

| Topic | What to document |
|---|---|
| Project structure | Where tests live, where page objects live |
| App launch | `AppProvider` pattern with `skipMakerPortal` and `directUrl` |
| Canvas apps | Iframe selector, control name discovery, gallery timeout |
| Model-driven apps | `ModelDrivenAppPage`, `GridComponent`, `FormComponent` methods |
| Auth | Storage state file naming and `getStorageStatePath` |
| Test data | Uniqueness convention (`Date.now()`) |
| Imports | Toolkit package name, what to import |
| Avoid | Raw nth-child selectors, hardcoded test data, missing waitFor |

## Validate your instructions

Test your custom instructions by asking the AI to:

1. Write a test for a canvas gallery — verify it uses the iframe and 60s timeout
2. Write a model-driven CRUD test — verify it uses `GridComponent` methods
3. Rewrite a codegen recording — verify it uses `AppProvider`

If the AI still produces raw Playwright code instead of toolkit code, add a more explicit rule to your instructions file.

## Next steps

- [Playwright MCP server](ai-mcp.md)
- [AI test authoring with Copilot](ai-authoring.md)
- [Get started](get-started.md)

## See also

- [AI-assisted testing overview](ai-overview.md)
- [Sample tests](samples.md)
- [Playwright test agents documentation](https://playwright.dev/docs/test-agents)
