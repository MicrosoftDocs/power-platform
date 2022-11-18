---
title: "Use DLP to block HTTP requests in chatbots"
description: "Block HTTP requests from being used by Power Virtual Agents chatbots."
keywords: "PVA"
ms.date: 10/07/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: admin, dlp
ms.collection: virtual-agent
---



# Data loss prevention example 2 - Block HTTP requests from Power Virtual Agents chatbots

Bot makers in your organization can [extend their bots with Bot Framework Composer](advanced-bot-framework-composer.md) and use HTTP requests.

You can use data loss prevention policies to prevent bot makers from configuring HTTP requests to help prevent data exfiltration.

See the [Configure data loss prevention for Power Virtual Agents chatbots](admin-data-loss-prevention.md) topic for information about other DLP-related connectors.

## Configure DLP to block HTTP requests in the Power Platform admin center

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Data policies**.

    1. To create a new policy, select **New policy**, enter a name for the policy, and select **Next**.

        :::image type="content" source="media/dlp-example-2/image3.png" alt-text="Screenshot of the Power Platform admin center  open to the Data policies  New Policy section.":::

    1. To add this connector to an existing DLP policy, select the policy you want to update, and then select **Edit policy**.

        :::image type="content" source="media/dlp-example-2/image4.png" alt-text="Screenshot of the Power Platform admin center  open to the Data policies section  with an existing policy and the Edit Policy button highlighted.":::

1. Under **Prebuilt connectors**, find the **HTTP connector**.

1. Select the connector's menu ellipses (shown as three dots in a vertical line next to the connector's name), and then select **Block**. Select **Next**.

    :::image type="content" source="media/dlp-example-2/image5.png" alt-text="Screenshot of the Power Platform admin center  showing the contextual menu for a connector available from the menu icon.":::

1. Under **Review**, select **Update policy** to apply the DLP changes.

    :::image type="content" source="media/dlp-example-2/image6.png" alt-text="Screenshot of the review screen when creating a DLP policy ":::

## Confirm policy enforcement in Power Virtual Agents

You can confirm that this connector is being used in the DLP policy from the Power Virtual Agents web app.

First, open your bot from the environment where the DLP policy is applied. Go to the authoring canvas, and open (or create) a topic that includes a custom Bot Framework Trigger that uses an HTTP request.

If the policy is enforced, you'll see an error in the [**Topic checker**](authoring-topic-management.md) that says DLP policies are blocking HTTP requests for the affected node. The error is titled "HTTP requests blocked" and includes a message advising you to remove the HTTP request or contact an admin.

:::image type="content" source="media/dlp-example-2/image9.png" alt-text="Screenshot of the Topic checker in Power Virtual Agents with an error message saying HTTP requests are blocked.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
