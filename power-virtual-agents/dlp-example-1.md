---
title: "Use DLP to block skills in chatbots"
description: "Block skills from being used in Power Virtual Agents chatbots."
keywords: "PVA"
ms.date: 10/07/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: admin, dlp
ms.collection: virtual-agent
---



# Data loss prevention example 1 - Block skills in Power Virtual Agents chatbots (Preview)

[!INCLUDE [Preview documentation notice](includes/cc-beta-prerelease-disclaimer.md)]

Bot makers in your organization can [extend their bots with skills](configuration-add-skills.md). Skills can be a useful way of extending the functionality of your bots, however you may want to restrict their use to help prevent data exfiltration.

You can use the Skills with Power Virtual Agents connector in Power Platform data loss prevention (DLP) policies to stop bot makers from adding skills to their bot.

See the [Configure data loss prevention for Power Virtual Agents chatbots](admin-data-loss-prevention.md) topic for information about other DLP-related connectors.

## Configure DLP to block skills in the Power Platform admin center

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Data policies**.

    1. To create a new policy, select **New policy**, enter a name for the policy, and select **Next**.

        :::image type="content" source="media/dlp-example-1/image3.png" alt-text="Screenshot of the Power Platform admin center  open to the Data policies  New Policy section.":::

    1. To add this connector to an existing DLP policy, select the policy you want to update, and then select **Edit policy**.

        :::image type="content" source="media/dlp-example-1/image4.png" alt-text="Screenshot of the Power Platform admin center open to the Data policies section  with an existing policy and the Edit Policy button highlighted.":::

1. Under **Prebuilt connectors**, find the **Skills with Power Virtual Agents** connector.

1. Select the connector's menu ellipses (shown as three dots in a vertical line next to the connector's name), and then select **Block**. Select **Next**.

    :::image type="content" source="media/dlp-example-1/image5.png" alt-text="Screenshot of the Power Platform admin center  showing the contextual menu for a connector available from the more menu icon.":::

1. Under **Review**, Select **Update policy** to apply the DLP changes.

    :::image type="content" source="media/dlp-example-1/image6.png" alt-text="Screenshot of the review screen when creating a DLP policy.":::

## Confirm policy enforcement in Power Virtual Agents

You can confirm that this connector is being used in the DLP policy from the Power Virtual Agents web app.

First, open your bot from the environment where the DLP policy is applied, and then try to [add a skill to the bot](configuration-add-skills.md#configure-a-skill).

If the policy is enforced, you'll see an error in the **Add a skill** pane. The error says "Skill not allowed by data loss prevention policy" and suggests you contact an admin to add the skill to the allowlist. The **Skill manifest URL** field will also be highlighted with the message "This skill couldn't be validated. Review details and try again".

:::image type="content" source="media/dlp-example-1/image7.png" alt-text="Screenshot of the Add a skill pane in Power Virtual Agents showing the errors that occur if skills are prohibited by DLP policy.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
