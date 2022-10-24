---
title: "Limitations of the Power Virtual Agents preview (preview)"
description: "Existing features that aren't supported in Power Virtual Agents preview."
ms.date: 10/10/2022
ms.topic: overview
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Limitations (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

The Power Virtual Agents preview currently doesn't support some of the existing features you're used to in Power Virtual Agents, and available features have some limitations.

## Limitations of current features

- Preview bots are only available in English.
- When sharing a bot, any Power Automate flows used in the conversation logic will not be shared. You'll have to manually share those flows if desired.  
- [Message variations](authoring-send-message.md#use-message-variations) do not vary in a single conversation. You'll only see differences between different conversations.
- The **Track between topics** toggle in the [test bot pane](authoring-test-bot.md) doesn't work.
- While co-authoring a bot with another user is possible, it's not a fully supported feature and may lead to data loss.
- Default values in multiple-choice questions don't work.
- Passing uninitialized variables to [flows](advanced-flow.md) causes an error.
- Omnichannel for Customer Service isn't supported. This includes Omnichannel's voice capabilities.
- Globalization support in Power Fx is limited to English (en-US). This means:
  - Numbers must be in the US style format, for example, `12,345.678`.
  - Power Fx parameters must be separated by commas (,) and not semi-colons (;).

## Troubleshoot firewall or network issues

If you have trouble loading Power Virtual Agents, and see the message "Try checking your firewall or network connection before trying again", you may be experiencing a temporary network issue; try again in a few moments.

However, if the issue persists, consider the following:

- Your browser might not support WebAssembly (WASM). Make sure you're using a browser that supports it.
- If your machine has a firewall running, check if there’s a rule that’s blocking WASM binary files (.binary).
- If you have a corporate firewall running, you’ll need to work with your system administrator to bypass firewall rules to be able to download WASM binary assets (.binary).

## Upcoming releases

- Skills
- Security options for your bot
- Channels (including Teams and Facebook Messenger)
- Agent transfers
- AI capabilities
- Authoring in Teams app
- Bots setup with application lifecycle management (ALM)
- Importing and exporting bots
- Customization of system fallback topic
