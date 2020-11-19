---
title: "Regional settings and data locations in Microsoft Teams"
description: "Identify the geographic location where your data will be stored, and plan for globalization features, including currency and date and time formats, in the Power Virtual Agents app in Microsoft Teams."
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: digantak
ms.collection: virtual-agent
ms.cusom: "multi-geo, gdpr, ce06102020, teams"
---

# Regional settings and data locations for organizations using Power Virtual Agents in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../data-location.md)
> - [Power Virtual Agents app in Microsoft Teams](data-location-teams.md)



Power Virtual Agents supports multiple globalization scenarios, and lets you choose where you want your data to live.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]

## Supported locales and formats

Chatbots built with Power Virtual Agents will understand and display content that's locally relevant to the user. Localized handling and formatting are based on the user's browser locale setting, and include the following elements within a chat conversation:

* Date and time
* Numbers
* ZIP or postal code
* Currency
* Speed

Power Virtual Agents supports the following display formatting locales:
* en-AU
* en-CA
* en-GB
* en-IN
* en-US

For example, if the user's browser locale setting is *en-GB*, the bot knows that a date of **2/3** equates to **March 2**. If the browser locale setting is *en-US*, the same date equates to **February 3**.

>[!NOTE]
>Microsoft Teams supports a larger set of languages. If the selected language for Microsoft Teams is not supported by Power Virtual Agents, the displayed language will be en-US.

## Data locations

Power Virtual Agents in Teams can be created in the [supported data locations](../data-location.md). You can create a bot if your tenant's location is supported, or you can use the Power Virtual Agents web app by choosing the datacenter you want to use when [setting up your environment](../environments-first-run-experience.md).

## See also

- [Language support](authoring-language-support-teams.md)
