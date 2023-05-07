---
title: "Use DLP to require chatbot users to be authenticated"
description: "Block unauthenticated end users from interacting with chatbots."
keywords: "PVA"
ms.date: 10/07/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: admin, dlp
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Data loss prevention example 3 - Require end-user authentication for Power Virtual Agents chatbots (Preview)

[!INCLUDE [Preview documentation notice](includes/cc-beta-prerelease-disclaimer.md)]

If a Power Virtual Agents chatbot isn't configured to require end-user authentication, then anyone on the internet can chat with the bot.

You can use data loss prevention (DLP) policies to block your bot makers from configuring and publishing chatbots that aren't configured for authentication to help prevent data exfiltration.

Bot makers will need to [configure end-user authentication with Teams or Azure AD v2 in Power Virtual Agents](configuration-end-user-authentication.md)if you use this connector in an enforced DLP policy.

See the [Configure data loss prevention for Power Virtual Agents chatbots](admin-data-loss-prevention.md) topic for information about other DLP-related connectors.

## Configure DLP to require authentication in the Power Platform admin center

[!INCLUDE [Preview documentation notice](includes/dlp-basic-config.md)]

### Add the connector

1. Use the search box to find the **Chat without Azure AD authentication in Power Virtual Agents** connector.

    :::image type="content" source="media/dlp-example-3/chat-connector.png" alt-text="Screenshot of the Chat without Azure AD authentication in Power Virtual Agents connector.":::

1. Select the connector's **More actions** menu (**&vellip;**), and then select **Block**.

    :::image type="content" source="media/dlp-example-3/block-connector.png" alt-text="Screenshot of the Power Platform admin center showing the contextual menu for a connector available from the menu icon.":::

1. Select **Next**.

1. If you're a tenant admin, or an environment admin for multiple environments, you'll see the **Scope** step. Choose one or more environments that your DLP policy will apply to.

    :::image type="content" source="media/dlp-example-3/scope-step.png" alt-text="Screenshot of the scope step where one or more environments are chosen.":::

    > [!NOTE]
    > If the policy has a tenant scope, DLP policy will apply to all bots.

1. Review your policy, then select **Update policy** to apply the DLP changes.

    :::image type="content" source="media/dlp-example-3/update-policy.png" alt-text="Screenshot of the review screen when creating a DLP policy.":::

## Confirm policy enforcement in Power Virtual Agents

You can confirm that this connector is being used in the DLP policy from the Power Virtual Agents web app.

First, open your bot from the environment where the DLP policy is applied.

If the policy is enforced, you'll see an error banner with a **Go to Authentication** button, and a message advising you to contact an admin or configure authentication.

:::image type="content" source="media/dlp-example-3/policy-enforcement-banner.png" alt-text="Screenshot of the banner that indicates DLP policies are in effect  and that authentication must be configured.":::

The bot maker can select the **Go to Authentication** button to be taken directly to the **Authentication** configuration panel. Here, they'll need to configure **Only for Teams** or **Manual** (**Azure Active Directory** or **Azure Active Directory v2**) for the end-user to chat with the bot.

:::image type="content" source="media/dlp-example-3/update-auth.png" alt-text="Screenshot of the authentication configuration panel with the 'Only for Teams' and 'Manual' options highlighted.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
