---
title: "Use DLP to block skills in copilots"
description: "Block skills from being used in Microsoft Copilot Studio copilots."
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

# Data loss prevention example - Block skills in Microsoft Copilot Studio copilots

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Bot makers in your organization can [extend their bots with skills](configuration-add-skills.md). Skills can be a useful way of extending the functionality of your bots, however you may want to restrict their use to help prevent data exfiltration.

You can use the Skills with Microsoft Copilot Studio connector in Power Platform data loss prevention (DLP) policies to stop bot makers from adding skills to their bot.

See the [Configure data loss prevention for Microsoft Copilot Studio chatbots](admin-data-loss-prevention.md) topic for information about other DLP-related connectors.

## Configure DLP to block skills in the Power Platform admin center

[!INCLUDE [Preview documentation notice](includes/dlp-basic-config.md)]

### Add the connector

1. Use the search box to find the **Skills with Microsoft Copilot Studio** connector.

    :::image type="content" source="media/dlp-example-1/skills-connector.png" alt-text="Screenshot of the Skills with Microsoft Copilot Studio connector.":::

1. Select the connector's **More actions** menu (**&vellip;**), and then select **Block**.

    :::image type="content" source="media/dlp-example-1/block-connector.png" alt-text="Screenshot of the Power Platform admin center  showing the contextual menu for a connector available from the more menu icon.":::

1. Select **Next**.

1. Review your policy, then select **Update policy** to apply the DLP changes.

    :::image type="content" source="media/dlp-example-1/update-policy.png" alt-text="Screenshot of the review screen when creating a DLP policy ":::

## Confirm policy enforcement in Microsoft Copilot Studio

You can confirm that this connector is being used in the DLP policy from the Microsoft Copilot Studio web app.

First, open your bot from the environment where the DLP policy is applied, and then try to [add a skill to the bot](configuration-add-skills.md#configure-a-skill).

If the policy is enforced, you'll see an error in the **Add a skill** pane. The error says "Skill not allowed by data loss prevention policy" and suggests you contact an admin to add the skill to the allowlist. The **Skill manifest URL** field will also be highlighted with the message "This skill couldn't be validated. Review details and try again".

:::image type="content" source="media/dlp-example-1/add-skill-error.png" alt-text="Screenshot of the Add a skill pane in Microsoft Copilot Studio showing the errors that occur if skills are prohibited by DLP policy.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
