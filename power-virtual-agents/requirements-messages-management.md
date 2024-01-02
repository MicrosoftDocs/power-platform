---
title: Manage Microsoft Copilot Studio messages and capacity
description: Learn about Microsoft Copilot Studio messages and capacity management and billing
ms.date: 12/4/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.collection: virtual-agent
ms.reviewer: mainguy
ms.service: power-virtual-agents
---

# Microsoft Copilot Studio messages and capacity management

> [!NOTE]
> 
> This article is for billed messages in the Microsoft Copilot Studio license, available for purchase starting December 1, 2023.

A _message_ is an interaction between a customer and a bot, representing one unit of consumption. A message is defined as any request or message sent to the bot that triggers an action or a response from the bot.

The purchase of a Microsoft Copilot Studio license includes a specific number of billed messages capacity. This capacity is pooled across the entire tenant but it must be assigned to an environment in to enable Microsoft Copilot Studio features for bots in the environment.

Allocation happens in the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/) when you select **Resources** > **Capacity** > **Summary** tab, and then select **Assign to an environment** in the upper-left menu. Additional information can be found in the [Power Platform capacity add-ons](/power-platform/admin/capacity-add-on) article.

## Message consumption common scenarios

The following table helps illustrate when messages are billed, free, or included in select Microsoft 365 subscriptions. These scenarios are examples only, and not all scenarios are covered.

| Scenario | Is session billed? | Topic type | Channel | Power Automate flow  | Bot Framework extensibility | Bot stored in |
| --- | --- | --- | --- | --- | --- | --- |
| User logs vacation days in a conversation with the bot in Microsoft Teams. | Included with select Microsoft 365 subscriptions | Any topic type | Teams | Yes (only standard connectors) | Not used | Dataverse for Teams |
| Bot greets user on your website, user escalates to a human agent directly or doesn't interact with the bot. | Yes | System  | Any channel | Not used | Not used | Any environment type |
| Greeting topic redirects to Bot Framework Composer or a skill topic for advanced operations. | Yes | Any topic type | Any channel | Either used or not used | Yes | Any environment type |
| Greeting topic gets information about the user using a Power Automate flow to present a customized experience. | Yes | Any topic type | Any channel | Yes (any connector) | Either used or not used | Any environment type |
| User interacts with the bot on your website to ask about store hours, check order status, and so on. | Yes | Non-system | Any channel | Either used or not used | Either used or not used | Dataverse |

## View your bot's messages consumption report

To download and view an Excel file showing your billed messages consumption report:

1. Sign in to the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/).
1. On the left pane, select **Resources** > **Capacity**.
1. On the **Summary** tab, select **Download reports** in the **Add-ons** section.
1. On the menu at the top, select **+ New**.
1. In the **Choose a report** dropdown list, select **Power Virtual Agent**.
1. Select **Submit**.
1. After the new report is generated, select the report in the list.
1. At the top of the screen, select **Download** to download the report as an Excel file.

## Overage

In an environment, when consumption exceeds available capacity, the environment is in overage and some features are progressively blocked. We allow some level of overage consumption, similar to a grace period, to avoid blocking business processes.

If your environment has no more capacity, you need to provide capacity to your environment: reallocate existing capacity from the organization (tenant) or environment level. Alternatively, you can purchase more capacity and make it available to your environment.

## Frequently asked questions

### Do Preview features count against usage capacity?

Copilot Studio features that are in preview release status are free to use and don't count against your purchased capacity.

### What happens to the remaining capacity at the end of the month? Can this capacity be used the following month?

No, unused capacity isn't carried over to the next month. Credit usage is counted on a monthly basis and reset on the first day of the month. Available capacity is based on allocated capacity.

### When is the message consumption count reset? Is resetting based on the license acquisition date?

Credit usage is counted on a monthly basis, starting the first day of each month. Credit usage isn't based on the license acquisition date. Message usage of an environment shouldn't exceed the message allocation.

### Where can I see message usage for this month?

Overall organization (tenant) level credit consumption is available in the Power Platform admin center in the **Resources** > **Capacity** > **Summary** tab.

The data is aggregated daily. Some data might be delayed; if so, the consumption bar shows all known consumption at the **Last updated** date in the tooltip box.

### If an environment is in overage, do the limitations apply to all environments?

No. Limitations only apply to the environments in overage. Other environments' allocated messages aren't affected.

[!INCLUDE[footer-include](includes/footer-banner.md)]
