---
title: "Regional settings and data locations"
description: "Identify the geographic location where your data will be stored, and plan for globalization features, including currency and date and time formats."
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.collection: virtual-agent
ms.cusom: "multi-geo, gdpr, ce06102020"
---

# Regional settings and data locations for organizations using Power Virtual Agents

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](data-location.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/data-location-teams.md)

Power Virtual Agents supports multiple globalization scenarios, and lets you choose where you want your data to live.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

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

## Data locations

Power Virtual Agents can be deployed into the Microsoft Azure datacenters (also referred to as "regions") listed here. You can create a bot in your tenant's location by default, or you can choose the datacenter you want to use when [setting up your environment](environments-first-run-experience.md).

Microsoft might replicate customer data to other regions available within the same geography for data durability. 

No matter where customer data is stored, Microsoft doesn't control or limit the locations from which customers or their users can access customer data.

Data will be stored in the United States if a bot author's tenant location isn't listed under the **Data locations** table below. For France, data will be stored in Europe.

> 
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4mPmc ]
> 

|Azure geographic locations (geos) | Azure datacenters (regions) |
|---|--- |
|United States | East US (Blue Ridge, VA), South Central US (Des Moines, IA), West US (Quincy, WA) |
|Europe | West Europe (Netherlands), North Europe (Ireland) |
|Australia | Australia East (New South Wales), Australia Southeast (Victoria) |
|United Kingdom | UK South (London), UK West (Cardiff, Durham) |
|India | Central India (Pune), South India (Chennai) |
|Asia Pacific | Southeast Asia (Singapore), East Asia (Hong Kong) |
|Japan | Japan East (Tokyo, Saitama), Japan West (Osaka) |
|Canada | Canada Central (Toronto), Canada East (Quebec City) |
|France | France Central (Paris), France South (Marseille) |
|South America | Brazil South (Sao Paulo State) &nbsp;(As there is only one region in Brazil, customer data in Brazil South may be replication to South Central US (Texas) for disaster recovery purposes)


## Customer data  
Microsoft won't transfer customer data outside the selected Azure geographic location (geos) for Power Virtual Agents except when:

- The geo is South America.

- Microsoft must provide customer support, troubleshoot the service, or comply with legal requirements. 

- Customers use services that are designed to operate globally, including: 

  - Email used to send marketing messaging globally, as configured by the customer. 
  
  - The Dynamics 365 home page, which stores application names, descriptions, and logos globally for performance. 

  - [Azure Active Directory](/azure/active-directory/active-directory-whatis) (Azure AD), which might store Azure AD data globally. 

  - [Azure Multi-Factor Authentication](/azure/active-directory/authentication/concept-mfa-howitworks), which might store multi-factor authentication data globally. 

  - Customer data collected during the onboarding process by the [Microsoft 365 admin center](/office365/admin/microsoft-365-admin-center-preview?view=o365-worldwide&preserve-view=true).
  
  - Services that provide global routing functions and don't process or store customer data. This includes Azure DNS, which provides domain name services that route to different regions; or preview, beta, or other pre-release services, which typically store customer data in the United States but might store it globally. 

  - Additionally, certain types of customer data (specifically the application name, application description, and application logo) will be stored globally, rather than in the primary storage geographic location. 

- Customers configure external services to extend Power Virtual Agents. Such customer configurations might cause customer data to be transferred outside of the selected geographic location. Examples of customer configurable external services include: 

  - [Customer Service Hand-off](advanced-hand-off.md) - Configurable external services that hand-off bot escalations to a human agent. 

  - Multi-channel – Configurable to external channels such as Facebook and internal non&ndash;Power Virtual Agents services (Microsoft Teams). 

    - [Facebook documentation](publication-add-bot-to-facebook.md)

    - [Microsoft Teams documentation](publication-add-bot-to-microsoft-teams.md)

  - [Dynamics 365 Customer Service Insights Topic suggestion](advanced-create-topics-from-csi.md) - Topic suggestions from Customer Service Insights are automated into Power Virtual Agents with a single click. Data might go to a bot in a different geographic region than the workspace region in Customer Service Insights. 

## See also

- [Language support](authoring-language-support.md)
