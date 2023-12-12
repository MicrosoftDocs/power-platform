---
title: "Use DLP to block HTTP requests in copilots"
description: "Block HTTP requests from being used by Microsoft Copilot Studio chatbots."
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

# Data loss prevention example - Block HTTP requests from Microsoft Copilot Studio copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Bot makers in your organization can make HTTP requests with the [Send HTTP request node](authoring-http-node.md) or by [extending (classic) bots with Bot Framework Composer](advanced-bot-framework-composer.md). 

You can use data loss prevention policies to prevent bot makers from configuring HTTP requests to help prevent data exfiltration.

See the [Configure data loss prevention for Microsoft Copilot Studio chatbots](admin-data-loss-prevention.md) topic for information about other DLP-related connectors.

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

## Confirm policy enforcement

# [Web App](#tab/webapp)

You can confirm that this connector is being used in the DLP policy from the Microsoft Copilot Studio.

First, open your bot from the environment where the DLP policy is applied. Go to the authoring canvas, create a new topic, add a **Send HTTP request** node (minimally populating the URL property) and then Save your Topic.

Navigate to the **Publish** page and, if the policy is enforced, you'll see an error (you may need to refresh the page if you do not see the error immediately) indicating that "Your bot may not work as intended right now due to your organization's data loss prevention policies".

:::image type="content" source="media/dlp-example-2/http-node-dlp-error.png" alt-text="Screenshot of the Publish page with an error message indicating a violation with organization DLP policies.":::

You can choose to click the **Download details** button in the error banner to see granular details of the policy violations and to confirm that the HTTP connector is blocked.

:::image type="content" source="media/dlp-example-2/dlp-error-download.png" alt-text="Screenshot of a downloaded excel file showing details of DLP policy violations including HTTP connector.":::

# [Classic](#tab/classic)

You can confirm that this connector is being used in the DLP policy from the Microsoft Copilot Studio (classic) web app.

First, open your bot from the environment where the DLP policy is applied. Go to the authoring canvas, and open (or create) a topic that includes a custom Bot Framework Trigger that uses an HTTP request.

If the policy is enforced, you'll see an error in the [**Topic checker**](authoring-topic-management.md) that says DLP policies are blocking HTTP requests for the affected node. The error is titled "HTTP requests blocked" and includes a message advising you to remove the HTTP request or contact an admin.

:::image type="content" source="media/dlp-example-2/test-bot.png" alt-text="Screenshot of the Topic checker in Microsoft Copilot Studio with an error message saying HTTP requests are blocked.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
