---
title: Limitations of the Microsoft Copilot Studio preview (preview)
description: Learn which existing features aren't supported or have limitations in Microsoft Copilot Studio preview.
ms.date: 03/24/2023

ms.topic: overview
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
ms.custom: bap-template
---

# Limitations of the Microsoft Copilot Studio preview (preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

The Microsoft Copilot Studio preview doesn't yet support some of the features you're used to in Microsoft Copilot Studio. Available features have some limitations.

## Limitations of current features

- Preview bots are only available in English.
- The **Track between topics** toggle in the [Test bot pane](authoring-test-bot.md) doesn't work.
- Default values in multiple-choice questions don't work.
- Passing uninitialized variables to [flows](advanced-flow.md) causes an error.
- Preview bots can't be created in GCC or GCC High environments.

## Troubleshoot firewall or network issues

If you have trouble loading Microsoft Copilot Studio, and see the message "Try checking your firewall or network connection before trying again," you may be experiencing a temporary network issue. Try again in a few moments.

If the issue persists, try the following steps:

- Your browser might not support WebAssembly (WASM). Make sure you're using a browser that supports it.
- If your device has a firewall running, check for a rule that's blocking WASM binary files (.binary).
- If you have a corporate firewall running, you'll need to work with your system administrator to bypass firewall rules to be able to download WASM binary assets (.binary).

## Upcoming releases

We're planning to roll out the following features in upcoming releases of the Microsoft Copilot Studio preview:

- Skills
- Security options for your bot
- Channels (including Teams and Facebook Messenger)
- Agent transfers
- AI capabilities
- Authoring in the Teams app
- Bot setup with application lifecycle management (ALM)
- Importing and exporting bots
- Customization of the system fallback topic

[!INCLUDE[footer-include](includes/footer-banner.md)]
