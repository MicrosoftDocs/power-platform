---
title: "Use DLP to block Power Platform Connectors"
description: "Block Power Platform Connectors from being used by Microsoft Copilot Studio copilots."
ms.date: 12/08/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Data loss prevention example - Block Power Platform Connectors from Microsoft Copilot Studio copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]


You can use data loss prevention (DLP) policies to prevent copilot authors from configuring connectors. This can help prevent data exfiltration.

See the [Configure data loss prevention for Microsoft Copilot Studio](admin-data-loss-prevention.md) article for information about other DLP policy configurations.

## Configure DLP to block Power Platform connectors in the Power Platform admin center

[!INCLUDE [DLP policy starting instructions](includes/dlp-basic-config.md)]

### Add the connector

1. Use the search box to find the connector you are looking to block. You can see connectors that are already blocked on the **Blocked** tab.

   :::image type="content" source="media/dlp-example-4/DLPConnectors.png" alt-text="Screenshot of the Assign connectors page in Power Platform admin center.":::

1. Select the connector's **More actions** menu (**&vellip;**), and then select **Block**.

1. Select **Next**.

1. Review your policy, then select **Update policy** to apply the DLP changes.

    :::image type="content" source="media/dlp-example-4/DLPConnectorsUpdatePolicy.png" alt-text="Screenshot of the review screen when creating a DLP policy.":::

## Confirm policy enforcement

# [Web App](#tab/webapp)

You can confirm that this connector is being used in the DLP policy from Microsoft Copilot Studio.

First, open your bot from the environment where the DLP policy is applied. Go to the authoring canvas, create a new topic, add a **Call an action** node, select **Connectors Preview**, choose your blocked connection and then save your topic.

Navigate to the **Publish** page and, if the policy is enforced, you'll see an error. The error says "Your bot may not work as intended right now due to your organization's data loss prevention policies."

:::image type="content" source="media/dlp-example-4/DLPWeather.png" alt-text="Screenshot of the Publish page with an error message indicating a violation with organization DLP policies.":::

You can choose to click the **Download details** button in the error banner to see granular details of the policy violations and to confirm that the connectors are blocked.


# [Classic](#tab/classic)

Power Platform connectors are not currently supported in the classic experience.
