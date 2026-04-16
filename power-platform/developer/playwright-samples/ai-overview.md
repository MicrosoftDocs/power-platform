---
title: AI-assisted testing overview for Power Platform Playwright Samples
description: Use generative AI tools — Playwright MCP server, codegen, and test agents — to author, inspect, and maintain Playwright tests for Power Platform apps.
author: deepakkamboj
ms.author: dekamb
ms.topic: overview
ms.date: 04/17/2026
ms.subservice: developer
ms.reviewer: jdaly
---

# AI-assisted testing overview

Modern AI coding assistants can dramatically accelerate Playwright test authoring. Instead of manually inspecting the DOM to find selectors, you can describe what you want to test in natural language and let AI generate the test code. This section explains how to integrate generative AI tools into your Power Platform testing workflow.

## Available AI integrations

| Tool | What it does | Best for |
|---|---|---|
| [Playwright MCP server](ai-mcp.md) | Gives AI assistants live access to your running browser | Generating selectors, writing tests with live inspection |
| [AI test authoring with Copilot](ai-authoring.md) | Uses Playwright codegen and AI chat to scaffold tests | First-time test creation, unfamiliar apps |
| [Custom instructions for AI agents](ai-custom-instructions.md) | Teaches your AI assistant your project conventions | Consistent code style, toolkit API usage |

## How generative AI accelerates Power Platform testing

Writing tests for Power Platform apps requires knowing:

- The correct iframe to scope locators to (`iframe[name="fullscreen-app-host"]`)
- The `data-control-name` attribute values for controls in your specific app
- Which toolkit class and method to call (`GridComponent`, `FormComponent`, etc.)
- The right timeouts for Dataverse-backed galleries (30–60 seconds)

AI tools reduce the knowledge needed by:

1. **Inspecting the live DOM** — The Playwright MCP server lets AI assistants see exactly what's on screen, find attributes, and generate accurate selectors without you having to open DevTools.
2. **Recording interactions** — Playwright codegen records your clicks and form fills as test code, which AI can then clean up and annotate.
3. **Applying conventions** — Custom instruction files teach AI assistants your project's patterns, so generated tests use the right toolkit APIs instead of raw Playwright.

## Recommended workflow

The most productive workflow combines all three tools:

```
1. Start the app in play mode in a browser
2. Run Playwright MCP server (connects AI assistant to that browser)
3. Ask AI: "Write a test that opens the Orders gallery and verifies the first row"
4. AI inspects DOM → finds selectors → generates test using your toolkit conventions
5. Review and commit the generated test
```

For complex scenarios:

```
1. Use Playwright codegen to record the happy path
2. Paste the recording into your AI chat
3. Ask AI to rewrite it using AppProvider and ModelDrivenAppPage
4. AI applies your custom instructions → produces toolkit-idiomatic test
```

## Supported AI assistants

The Playwright MCP server and custom instructions work with any MCP-compatible AI assistant:

- **GitHub Copilot** (VS Code, Visual Studio)
- **Claude** (Anthropic, Claude Code)
- **Cursor**
- **Windsurf**
- Any assistant with MCP client support

## Next steps

- [Set up the Playwright MCP server](ai-mcp.md)
- [Author tests with AI and Copilot](ai-authoring.md)
- [Write custom instructions for your AI agent](ai-custom-instructions.md)

## See also

- [Test canvas apps](canvas-application.md)
- [Test model-driven apps](model-driven-application.md)
- [Sample tests](samples.md)
