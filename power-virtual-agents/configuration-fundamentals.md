---
title: "Configuration of advanced features"
description: "Incorporate advanced features into your bot, such as sign-in, live agent transfer, and custom appearances."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "configuration, fundamentals, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Key concepts - Configure Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio has many advanced features that let you extend the capabilities of what bot conversations can do.

These features allow you to personalize the look and feel of your bot and give you more flexibility in what your users can ask your bot to do.

> [!NOTE] 
> With the Web app version, you can use single sign-in (SSO) to backend systems, seamlessly integrate between virtual support conversations, and customize the look and feel of your bot.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


## Related topics

# [Web app](#tab/web)

| Topic                                                                                           | Description                                                                                                                            |
| ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| [Assign access and change security options](configuration-end-user-authentication.md)           | Determine who can use the bot in Microsoft Teams                                                                                       |
| [Configure end-user authentication](configuration-end-user-authentication.md)                   | Allow users to sign in with any OAuth2 identity provider directly in a bot conversation.                                               |
| [Configure single sign-on](configure-sso.md)                                                    | Retain a user's authentication to use other signed-in products.                                                                        |
| [Configure hand off to a generic engagement hub](configure-generic-handoff.md)                  | Hand off conversations to any engagement hub.                                                                                          |
| [Configure hand off to Omnichannel for Customer Service](configuration-hand-off-omnichannel.md) | Seamlessly and contextually hand off bot conversations to live (human) agents using Omnichannel for Customer Service.     |
| [Configure your bot to automatically start the conversation](configure-bot-greeting.md)         | Make your bot start the conversation automatically whenever the bot is loaded.                                                         |
| [Customize the look and feel of your bot](customize-default-canvas.md)                          | Send and receive dynamic responses (such as adaptive cards and carousels) that you can custom render directly in the bot conversation. |


# [Teams](#tab/teams)

| Topic                                                                                       | Description                                                                                       |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| [Assign access and change security options](configuration-end-user-authentication.md) | Determine who can use the bot in Microsoft Teams                                                  |
| [Configure end-user authentication](configuration-end-user-authentication.md)         | Allow users to sign in with any OAuth2 identity provider directly in a bot conversation.          |
| [Configure how the bot starts the conversation](configure-bot-greeting.md)            | Change what the bot says when it starts a conversation.                                           |
| [Customize the look and feel of your bot](customize-default-canvas.md)                | Change the bot's icon, name, and description so it looks unique in the Microsoft Teams app store. |
| [Enable and configure Azure Bot Framework skills](configuration-add-skills.md)        | Extend your bot with Bot Framework skills.                                                        |

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
