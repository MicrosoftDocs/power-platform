---
title: Regional settings and data locations (contains video)
description: "Identify the geographic location where your data will be stored, and plan for globalization features, including currency and date and time formats."
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: "multi-geo, ce06102020"
---

# Regional settings and data locations for organizations using Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio supports multiple globalization scenarios, and lets you choose where you want your data to live.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Supported locales and formats

Chatbots built with Microsoft Copilot Studio will understand and display content that's locally relevant to the user. Localized handling and formatting are based on the user's browser locale setting, and include the following elements within a chat conversation:

- Date and time
- Numbers
- ZIP or postal code
- Currency
- Speed

Microsoft Copilot Studio supports the following display formatting locales:

- en-AU
- en-CA
- en-GB
- en-IN
- en-US

For example, if the user's browser locale setting is _en-GB_, the bot knows that a date of **2/3** equates to **March 2**. If the browser locale setting is _en-US_, the same date equates to **February 3**.

# [Web app](#tab/web)

Microsoft Copilot Studio can be deployed into the Microsoft Azure datacenters (also referred to as "regions") listed here. You can create a bot in your tenant's location by default, or you can choose the datacenter you want to use when [setting up your environment](environments-first-run-experience.md).

### Data locations

Microsoft might replicate customer data to other regions available within the same geography for data durability.

No matter where customer data is stored, Microsoft doesn't control or limit the locations from which customers or their users can access customer data.

Data will be stored in the United States if a bot author's tenant location isn't listed under the **Data locations** table below.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mPmc ]
>

| Azure geographic locations (geos) | Azure datacenters (regions)                                                                                                                                                               |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Asia Pacific                      | Southeast Asia (Singapore), East Asia (Hong Kong Special Administrative Region)                                                                                                                                         |
| Australia                         | Australia East (New South Wales), Australia Southeast (Victoria)                                                                                                                          |
| Canada                            | Canada Central (Toronto), Canada East (Quebec City)                                                                                                                                       |
| Europe                            | West Europe (Netherlands), North Europe (Ireland)                                                                                                                                         |
| France                            | France Central (Paris), France South (Marseille)                                                                                                                                          |
| India                             | Central India (Pune), South India (Chennai)                                                                                                                                               |
| Japan                             | Japan East (Tokyo, Saitama), Japan West (Osaka)                                                                                                                                           |
| South America                     | Brazil South (Sao Paulo State) &nbsp;(As there is only one region in Brazil, customer data in Brazil South may be replication to South Central US (Texas) for disaster recovery purposes) |
| Switzerland                       | Switzerland North (Zurich), Switzerland west (Geneva)                                                                                                                                     |
| United Kingdom                    | UK South (London), UK West (Cardiff, Durham)                                                                                                                                              |
| United States                     | East US (Virginia), South Central US (Texas), West US 2 (Washington)                                                                                                         |

### Customer data

Microsoft won't transfer customer data outside the selected Azure geographic location (geos) for Microsoft Copilot Studio except when:

- The geo is South America.

- Microsoft must provide customer support, troubleshoot the service, or comply with legal requirements.

- Customers use services that are designed to operate globally, including:

  - Email used to send marketing messaging globally, as configured by the customer.
  
  - The Dynamics 365 home page, which stores application names, descriptions, and logos globally for performance.

  - [Microsoft Entra ID](/azure/active-directory/active-directory-whatis) (Microsoft Entra ID), which might store Microsoft Entra ID data globally.

  - [Azure Multi-Factor Authentication](/azure/active-directory/authentication/concept-mfa-howitworks), which might store multi-factor authentication data globally.

  - Customer data collected during the onboarding process by the [Microsoft 365 admin center](/office365/admin/microsoft-365-admin-center-preview?view=o365-worldwide&preserve-view=true).

  - Services that provide global routing functions and don't process or store customer data. This includes Azure DNS, which provides domain name services that route to different regions; or preview, beta, or other pre-release services, which typically store customer data in the United States but might store it globally.

  - Additionally, certain types of customer data (specifically the application name, application description, and application logo) will be stored globally, rather than in the primary storage geographic location.

- Customers configure external services to extend Microsoft Copilot Studio. Such customer configurations might cause customer data to be transferred outside of the selected geographic location. Examples of customer configurable external services include:

  - [Customer Service Hand-off](advanced-hand-off.md), Configurable external services that hand-off bot escalations to a human agent.

  - Multi-channel, Configurable to external channels such as Facebook and internal, non Microsoft Copilot Studio services, such as Microsoft Teams.

    - [Facebook documentation](publication-add-bot-to-facebook.md)

    - [Microsoft Teams documentation](publication-add-bot-to-microsoft-teams.md)

  - [Dynamics 365 Customer Service Insights Topic suggestion](advanced-create-topics-from-csi.md), Topic suggestions from Customer Service Insights are automated into Microsoft Copilot Studio with a single click. Data might go to a bot in a different geographic region than the workspace region in Customer Service Insights.

# [Teams](#tab/teams)

Microsoft Teams supports a larger set of languages than the Web app. If the selected language for Microsoft Teams is not supported by Microsoft Copilot Studio, the displayed language will be en-US.

### Data locations

Microsoft Copilot Studio bots in Teams can be created in the [supported data locations](data-location.md). You can create a bot if your tenant's location is supported, or you can use the Microsoft Copilot Studio web app by choosing the datacenter you want to use when [setting up your environment](environments-first-run-experience.md).

---

## Related topics

- [Language support](authoring-language-support.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
