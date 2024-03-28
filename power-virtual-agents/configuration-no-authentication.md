---
title: "Disable default authentication for Microsoft Copilot Studio copilots"
description: Microsoft Copilot Studio enables user authentication for copilots by default. When you create a copilot, authentication is configured automatically for the "Only for Teams and Power Apps" scope to help manage and protect your data. You can remove or change the type of authentication directly within Copilot Studio for any of your copilots you created.
keywords: "User Authentication, Authentication, Microsoft Entra ID, MSA, Identity Provider, PVA"
ms.date: 12/13/2023
ms.topic: article
author: iaan
ms.author: digantak
manager: leeclontz
ms.reviewer: clmori
ms.custom: authentication, ceX

---

# Disable default authentication for Microsoft Copilot Studio copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can configure anyone to chat with your copilot by removing or changing the default authentication configuration, which is automatically enabled when copilots are created.

>[!NOTE]
> Copilots created in the web app and in Microsoft Teams come with authentication pre-configured to use **Only for Teams and Power Apps** authentication.

You can also configure single sign-on (SSO) so your users don't need to sign in manually. For more information, see [Configure SSO for web](configure-sso.md).

Read more about authentication options for when people interact with your copilot in the [Configure end-user authentication](configuration-end-user-authentication.md) article.

# [Web app](#tab/web)

The copilot comes with the **Only for Teams and Power Apps** authentication option turned on. The copilot automatically uses Microsoft Entra ID authentication for Teams and Power Apps without requiring any manual setup, and only lets you chat with your copilot on Teams. 

If you want to allow anyone to chat with your copilot, select **No authentication** in the **Security** settings for your copilot. If you want to use other channels and still have authentication for your copilot, select **Manual** authentication.

[!INCLUDE[no-auth-warning-note](includes/blocks/no-auth-warning.md)]

:::image type="content" source="media/dlp-example-3/CopilotDefaultAuthenticationOptions.png" alt-text="Screenshot of the Authentication pane showing the three authentication options.":::

You can further configure user authentication within a topic to [allow your copilot users to sign in right in the conversation](advanced-end-user-authentication.md). You can then personalize the conversation with user variables and access back-end systems on the user's behalf.


# [Classic](#tab/classic)

### Authentication variables

Classic bots have the **No authentication** authentication option turned on by default, so anyone can chat with the classic bot without authenticating.

If your classic bot is configured with either **Only for Teams and Power Apps** or **Manual** authentication options, you have a set of authentication variables available in your topics. For more information on how to configure authentication in your classic bot, see the [authentication configuration documentation](configuration-end-user-authentication.md).

---
