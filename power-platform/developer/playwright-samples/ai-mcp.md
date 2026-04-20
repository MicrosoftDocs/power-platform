---
title: Playwright MCP server for Power Platform Playwright samples
description: "Learn how to connect AI coding assistants to a live Power Platform browser session to inspect the DOM, generate selectors, and write Playwright tests automatically."
author: deepakkamboj
ms.author: dekamb
ms.topic: how-to
ms.date: 04/17/2026
ms.reviewer: jdaly
---

# Playwright MCP server for Power Platform testing

The [Playwright MCP server](https://github.com/microsoft/playwright-mcp) is a [Model Context Protocol](https://modelcontextprotocol.io/) server that gives AI coding assistants direct access to a live browser session. Instead of guessing selectors from screenshots or documentation, the AI can inspect the real DOM, click elements, and observe navigation – then generate precise Playwright tests from what it finds.

## Why use Playwright MCP for Power Platform testing

Power Platform apps present specific challenges for test authoring:

- Canvas controls have `data-control-name` attributes that are app-specific and not documented.
- Gallery items nest multiple locatable elements, so the right selector depends on the exact structure.
- You must cross the iframe boundary (`iframe[name="fullscreen-app-host"]`) before any control interaction.
- Dataverse-backed views might take 30–60 seconds to populate.

By using Playwright MCP, the AI assistant can:

- Navigate to your canvas or model-driven app.
- Inspect control names and ARIA labels on the actual rendered DOM.
- Generate selectors that are correctly scoped to the iframe.
- Time interactions with appropriate waits based on observed behavior.

## Install the Playwright MCP server

Install the Playwright MCP server globally by using npm so your AI coding assistant can connect to a live browser session.

```bash
npm install -g @playwright/mcp
```

Or use `npx` to run it without a global install:

```bash
npx @playwright/mcp
```

> [!NOTE]
> The Playwright MCP server requires Node.js 18 or later and a Chromium-compatible browser installed through `npx playwright install chromium`.

## Configure your AI assistant to use MCP

After installing the server, configure your AI coding assistant to connect to it. The following sections show the setup for popular editors.

### VS Code (GitHub Copilot)

Add the following code to your `.vscode/settings.json` or user settings:

```json
{
  "github.copilot.chat.experimental.mcp.servers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp"]
    }
  }
}
```

### Claude (claude.ai or Claude Code)

Create or update your `CLAUDE.md` or `.claude/settings.json` to include the MCP server. In Claude Code, add the server through the `/mcp` command or by editing `~/.claude/settings.json`:

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

### Cursor / Windsurf

In Cursor, add the server under **Settings → AI → MCP Servers**:

```json
{
  "name": "playwright",
  "command": "npx @playwright/mcp"
}
```

## Connect the AI to your Power Platform app

1. Start your Power Platform app in a browser (play mode or make portal).
1. Tell your AI assistant to connect to the running browser:

   > "Connect to the browser and navigate to `https://apps.powerapps.com/play/<your-app-id>`"

1. Ask the AI to inspect the app and generate a test:

   > "Inspect the canvas app and write a Playwright test that opens the Orders gallery, clicks the first item, and verifies the order number field."

The AI inspects the DOM through the MCP server, identifies the `data-control-name` values, notes the iframe boundary, and generates scoped locators - all without you opening DevTools.

## Example: Generate a canvas app test

Prompt your AI assistant:

> "Using the Playwright MCP server, connect to the running canvas app at `<url>`. Find the gallery control name and the title label control name. Then write a Playwright test that:
> 1. Waits for the gallery to load
> 1. Filters items to find one titled 'Northwind Traders'
> 1. Clicks that item
> 1. Verifies a details panel appears"

The AI uses the MCP server's `browser_navigate`, `browser_snapshot`, and `browser_click` tools, then emits test code like:

```typescript
import { test, expect } from '@playwright/test';
import { AppProvider, AppType, AppLaunchMode, buildCanvasAppUrlFromEnv } from 'power-platform-playwright-toolkit';

test('find and click Northwind Traders in gallery', async ({ page, context }) => {
  const app = new AppProvider(page, context);
  await app.launch({
    app: 'Orders App',
    type: AppType.Canvas,
    mode: AppLaunchMode.Play,
    skipMakerPortal: true,
    directUrl: buildCanvasAppUrlFromEnv(),
  });

  const canvasFrame = page.frameLocator('iframe[name="fullscreen-app-host"]');

  // Wait for gallery (control name found via MCP inspection)
  await canvasFrame
    .locator('[data-control-name="Gallery1"] [data-control-part="gallery-item"]')
    .first()
    .waitFor({ state: 'visible', timeout: 60000 });

  // Click item by title (control name found via MCP inspection)
  const item = canvasFrame
    .locator('[data-control-part="gallery-item"]')
    .filter({
      has: canvasFrame
        .locator('[data-control-name="Title1"]')
        .getByText('Northwind Traders', { exact: true }),
    });

  await item.click();

  // Verify details panel
  await expect(canvasFrame.locator('[data-control-name="DetailPanel1"]')).toBeVisible();
});
```

## Example: Generate a model-driven app test

Prompt:

> "Navigate to `<model-driven-app-url>`. Inspect the [AG Grid](https://www.ag-grid.com/) and find the column header for order numbers. Write a test that filters by 'ORD-001', reads the first cell, and verifies the value."

The AI navigates, inspects the grid structure, identifies the column schema name, and generates:

```typescript
await mda.grid.filterByKeyword('ORD-001');
await mda.grid.waitForGridLoad();
const orderNumber = await mda.grid.getCellValue(0, 'nwind_ordernumber');
expect(orderNumber).toContain('ORD-001');
```

## Available MCP tools

The [Playwright MCP server](https://github.com/microsoft/playwright-mcp) exposes the following tools to AI assistants:

| Tool | What it does |
|---|---|
| `browser_navigate` | Go to a URL |
| `browser_snapshot` | Capture the accessibility tree (DOM structure) |
| `browser_click` | Click an element |
| `browser_type` | Type text into an input |
| `browser_select_option` | Select a dropdown option |
| `browser_wait_for` | Wait for an element or network |
| `browser_screenshot` | Capture a screenshot |
| `browser_evaluate` | Run JavaScript in the page |
| `browser_network_requests` | Inspect network traffic |

> [!TIP]
> The `browser_snapshot` tool returns the accessibility tree, not raw HTML. It produces a compact, AI-readable representation that highlights roles, labels, and names – exactly what you need to find good selectors.

## Troubleshoot MCP connection issues

| Symptom | Resolution |
|---|---|
| AI can't connect to browser | Ensure `npx @playwright/mcp` is running and your AI client has MCP configured. |
| Snapshot shows empty iframe | Navigate into the canvas frame by asking the AI to switch frame context. |
| Selectors don't match | App might have reloaded; ask AI to re-snapshot. |
| Timeout on gallery | Instruct AI to wait 60 seconds before asserting gallery items. |

## Next steps

- [AI test authoring with Copilot](ai-authoring.md)
- [Custom instructions for AI agents](ai-custom-instructions.md)
- [Sample tests](samples.md)

## See also

- [Playwright MCP server on GitHub](https://github.com/microsoft/playwright-mcp)
- [AI-assisted testing overview](ai-overview.md)
- [Test canvas apps](canvas-application.md)
