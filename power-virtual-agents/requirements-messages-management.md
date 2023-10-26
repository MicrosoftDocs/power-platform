---
title: View billed messages
description: View your billed messages in Power Virtual Agents 
keywords: "PVA"
ms.date: 
ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: analysis, licensing, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Power Virtual Agents messages and capacity management

A _message_ is an interaction between a customer and a bot. It represents one unit of consumption and is defined as any request or message sent to the bot that triggers an action or a response from the bot. 

The purchase of a Power Virtual Agents license includes a specific number of billed messages capacity. This capacity is pooled across the entire tenant but it must be assigned to an environment in to enable Power Virtual Agents features for bots in the environment. 

Allocation happens in the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/) when you select Resources > Capacity > Summary tab, and then select Assign to an environment in the upper-left menu. Additional information can be found at https://learn.microsoft.com/en-us/power-platform/admin/capacity-add-on


## Messages consumption - common scenarios

The following table helps illustrate when messages are billed and when messages are free or included in select Microsoft 365 subscriptions. These scenarios are examples only, and not all scenarios are covered.

| Scenario | Is session billed? | Topic type | Channel | Power Automate flow  | Bot Framework extensibility | Bot stored in |
| --- | --- | --- | --- | --- | --- | --- |
| User logs vacation days in a conversation with the bot in Microsoft Teams.| Included with select Microsoft 365 subscriptions | Any topic type | Teams | Yes (only standard connectors) | Not used | Dataverse for Teams |
| Bot greets user on your website, user escalates to a human agent directly or doesn't interact with the bot. | Yes | System  | Any channel | Not used | Not used | Any environment type |
| Greeting topic redirects to Bot Framework Composer or a skill topic for advanced operations. | Yes | Any topic type | Any channel | Either used or not used | Yes | Any environment type |
| Greeting topic gets information about the user using a Power Automate flow to present a customized experience. | Yes | Any topic type | Any channel | Yes (any connector) | Either used or not used | Any environment type |
| User interacts with the bot on your website to ask about store hours, check order status, and so on. | Yes | Non-system | Any channel | Either used or not used | Either used or not used | Dataverse |


## View your bot's messages consumption report

To download and view an Excel file showing your billed messages consumption report:

1. &nbsp; Sign in to the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/).
2. &nbsp; On the left pane, select Resources > Capacity.
3. &nbsp; On the Summary tab, select Download reports in the Add-ons section.
4. &nbsp; On the menu at the top, select +New.
5. &nbsp; In the Choose a report dropdown list, select Power Virtual Agent.
6. &nbsp; Select Submit.
7. &nbsp; After the new report is generated, select the report in the list.
8. &nbsp; At the top of the screen, select Download to download the report as an Excel file.


## Overage
In an environment, when consumption exceeds available capacity, the environment is in overage and some features are progressively blocked. We allow some level of overage consumption—similar to a grace period—to avoid blocking business processes.

If your environment has no more capacity, you need to provide capacity to your environment: reallocate existing capacity from the organization (tenant) or environment level. Alternatively, you can purchase more capacity and make it available to your environment.


## Frequently asked questions

#### Do Preview features count against by usage capacity?
&nbsp;&nbsp;&nbsp;&nbsp; Power Virtual Agents features that are in preview release status are free to use and don't count against your purchased capacity.


#### What happened to the remaining capacity at the end of the month? Can it be used the following month?
&nbsp;&nbsp;&nbsp;&nbsp; No, unused capacity isn't carried over to the next month. Credit usage is counted on a monthly basis and reset on first day of the month. Available capacity is based on allocated capacity.


#### When is message consumption count reset? Is it based on license acquisition date?
&nbsp;&nbsp;&nbsp;&nbsp; Credit usage is counted on a monthly basis, starting the first day of each month. It's not based on the license acquisition date. Message usage of an environment shouldn't exceed the message allocation.

#### Where can I see message usage for this month?
&nbsp;&nbsp;&nbsp;&nbsp; Overall organization (tenant) level credit consumption is available in the Power Platform admin center in the Resources > Capacity > Summary tab.

&nbsp;&nbsp;&nbsp;&nbsp; The data is aggregated daily. Some data may be delayed; if so, the consumption bar shows all known consumption at the Last updated date in the tooltip box.


#### If an environment is in overage, do the limitations apply to all environments?
&nbsp;&nbsp;&nbsp;&nbsp; No. Limitations only apply to the environments in overage. Other environments' allocated messages won't be affected.


[!INCLUDE[footer-include](includes/footer-banner.md)]
