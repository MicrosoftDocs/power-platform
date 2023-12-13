---
title: "Add no authentication for anyone to chat with Microsoft Copilot Studio bot"
description: "Add no authentication for anyone to chat with Microsoft Copilot Studio bot with out authentication."
keywords: "User Authentication, Authentication, Microsoft Entra ID, MSA, Identity Provider, PVA"
ms.date: 03/24/2023

ms.topic: article
author: digantak
ms.author: iawilt
manager: leeclontz
ms.reviewer: clmori
ms.custom: authentication, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Add no authentication for anyone to chat with Microsoft Copilot Studio bot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can configure anyone with the link to chat with the bot without authentication within a Microsoft Copilot Studio bot. 

>[!NOTE]
> Bots created in Web app and Microsoft Teams come with authentication pre-configured to use Teams authentication.

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Configure end-user authentication](configuration-end-user-authentication.md).

# [Web app](#tab/web)

The bot comes with the **Only for Teams and Power Apps** authentication option turned on. The bot automatically uses Microsoft Entra ID authentication for Teams and Power Apps without requiring any manual setup and only lets you chat with your bot on Teams. If you want to allow anyone to chat with your bot, select **No authentication** authentication. If you want to use other channels and still have authentication for your bot, select **Manual** authentication.

:::image type="content" source="media/publication-fundamentals-publish-channels/CopilotDefaultAuthenticationOptions.jpg" alt-text="Screenshot of the Authentication pane showing the three authentication options.":::

Add user authentication to a topic to allow your customers to sign in right in the conversation. You can then personalize the conversation with user variables and access back-end systems on the user's behalf.


# [Classic](#tab/classic)

### Authentication variables

Classic bot comes with the **No authentication** authentication option turned on. Anyone can chat with the bot without authenticating. 

If your bot is configured with either **Only for Teams and Power Apps** or **Manual** authentication options, you will have a set of authentication variables available in your topics. Check the [authentication configuration documentation](configuration-end-user-authentication.md) for more information on how to configure authentication in your bot.

---

## Related topics

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
