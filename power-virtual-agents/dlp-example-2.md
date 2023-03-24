---
title: "Use DLP to block HTTP requests in chatbots"
description: "Block HTTP requests from being used by Power Virtual Agents chatbots."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: admin, dlp
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Data loss prevention example 2 - Block HTTP requests from Power Virtual Agents chatbots (Preview)

[!INCLUDE [Preview documentation notice](includes/cc-beta-prerelease-disclaimer.md)]

Bot makers in your organization can [extend their bots with Bot Framework Composer](advanced-bot-framework-composer.md) and use HTTP requests.

You can use data loss prevention policies to prevent bot makers from configuring HTTP requests to help prevent data exfiltration.

See the [Configure data loss prevention for Power Virtual Agents chatbots](admin-data-loss-prevention.md) topic for information about other DLP-related connectors.

## Configure DLP to block HTTP requests in the Power Platform admin center

[!INCLUDE [Preview documentation notice](includes/dlp-basic-config.md)]

### Add the connector

1. Use the search box to find the **HTTP** connector.

    :::image type="content" source="media/dlp-example-2/http-connector.png" alt-text="Screenshot of the HTTP connector.":::

1. Select the connector's **More actions** menu (**&vellip;**), and then select **Block**.

    :::image type="content" source="media/dlp-example-2/block-connector.png" alt-text="Screenshot of the Power Platform admin center showing the contextual menu for a connector available from the menu icon.":::

1. Select **Next**.

1. Review your policy, then select **Update policy** to apply the DLP changes.

    :::image type="content" source="media/dlp-example-2/update-policy.png" alt-text="Screenshot of the review screen when creating a DLP policy ":::

## Confirm policy enforcement in Power Virtual Agents

You can confirm that this connector is being used in the DLP policy from the Power Virtual Agents web app.

First, open your bot from the environment where the DLP policy is applied. Go to the authoring canvas, and open (or create) a topic that includes a custom Bot Framework Trigger that uses an HTTP request.

If the policy is enforced, you'll see an error in the [**Topic checker**](authoring-topic-management.md) that says DLP policies are blocking HTTP requests for the affected node. The error is titled "HTTP requests blocked" and includes a message advising you to remove the HTTP request or contact an admin.

:::image type="content" source="media/dlp-example-2/test-bot.png" alt-text="Screenshot of the Topic checker in Power Virtual Agents with an error message saying HTTP requests are blocked.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
