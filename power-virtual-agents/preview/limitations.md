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
- Omnichannel isn't supported.
- Telephony isn't support.
 
## Troubleshooting firewall or network issues

If you have trouble loading PVA, and see a page saying "Try checking your firewall or network connection before trying again." 

1. This might be a transient network issue, try again in a few moments.
2. Your browser might not support WebAssembly. Make sure you're using a browser that supports it.
3. If your machine has a firewall running, check if there’s a rule that’s blocking file (.binary files) downloads.
4. If you have a corporate firewall running, you’ll need to talk to your company’s IT to bypass firewall rules to be able to download WASM assets (.binary files).

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
