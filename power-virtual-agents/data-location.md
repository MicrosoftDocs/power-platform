---
title: "Regional settings and data locations for Power Virtual Agents"
description: "Identify the geographic location where your data will live, and plan for globalization features, including currency and date and time formats."
ms.date: 03/30/2020
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.collection: virtual-agent
ms.cusom: "multi-geo, gdpr"
---

# Regional settings and data locations for organizations using Power Virtual Agents

Power Virtual Agents supports multiple globalization scenarios, and lets you choose where you want your data to live.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Supported locales and formats

Chatbots built with Power Virtual Agents will understand and display content that is locally relevant to the user. Localized handling and formats are based on the end-user's browser locale setting, and includes:
* Date and time
* Numbers
* Zip or postal code
* Currency
* Speed

Power Virtual Agents supports the following locales:
* en-AU
* en-CA
* en-GB
* en-IN
* en-US


For example, if the end-user's browser locale setting is set to *en-GB*, the bot knows that **2/3** equates to **March 2**. If the browser locale setting was *en-US*, the same date would equate to **February 3**.


## Data locations


Power Virtual Agents can be deployed into the Microsoft Azure datacenters (also referred to as "regions") listed here. You can create a bot in your tenant’s location by default, or you can choose the datacenter you want to use when [setting up your environment](environments-first-run-experience.md).


Microsoft may replicate customer data to other regions available within the same geography for data durability. 

No matter where customer data is stored, Microsoft doesn't control or limit the locations from which customers or their end users may access customer data.


Data will be stored in United States if a bot author’s tenant location isn't listed under the **Data locations** table below. For France, data will be stored in Europe.   



> 
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4mPmc ]
> 

Azure geographic locations (geos) | Azure datacenters (regions)
 ---|---
United States | East US (Blue Ridge, VA), South Central US (Des Moines, IA), West US (Quincy, WA)
Europe | West Europe (Netherlands), North Europe (Ireland)
Australia | Australia East (New South Wales), Australia Southeast (Victoria)
United Kingdom | UK South (London), UK West (Cardiff, Durham)
India | Central India (Pune), South India (Chennai)
Asia Pacific | Southeast Asia (Singapore), East Asia (Hong Kong)
Japan | Japan East (Tokyo, Saitama), Japan West (Osaka)
Canada | Canada Central (Toronto), Canada East (Quebec City)

## Customer data  
Microsoft won't transfer customer data outside the selected Azure geographic location (geos) for Power Virtual Agents except when: 
- Microsoft must provide customer support, troubleshoot the service, or comply with legal requirements. 

- Customers use services that are designed to operate globally, including the following: 

  - Email used to send marketing messaging globally, as configured by the customer. 
  
  - The Dynamics 365 home page, which stores application names, descriptions, and logos globally for performance. 

  - [Azure Active Directory](/azure/active-directory/active-directory-whatis), which may store Active Directory data globally. 

  - [Azure Multi-Factor Authentication](/azure/active-directory/authentication/concept-mfa-howitworks), which may store multi-factor authentication data globally. 

  - Customer data collected during the onboarding process by the  [Microsoft Office 365 admin center](/office365/admin/microsoft-365-admin-center-preview?view=o365-worldwide). 
  - Services that provide global routing functions and don't process or store customer data. This includes Azure DNS, which provides domain name services that route to different regions; or preview, beta, or other pre-release services, which typically store customer data in the United States but may store it globally. 

  - Additionally, certain types of customer data (specifically the application name, application description, and application logo) will be stored globally, rather than in the primary storage geographic location. 

- Customers configure external services to extend Power Virtual Agents. Such customer configurations may cause customer data to be transferred outside of the selected geographic location. Examples of customer configurable external services include: 

  - [Customer Service Hand-off](advanced-hand-off.md) - Configurable external services that hand-off bot escalations to a human agent. 

  - Multi-channel – Configurable to external channels such as Facebook and internal non-Power Virtual Agents services (Microsoft Teams). 

    - [Facebook documentation](publication-add-bot-to-facebook.md)

    - [Microsoft Teams documentation](publication-add-bot-to-microsoft-teams.md)

  - [Dynamics 365 Customer Service Insights Topic suggestion](advanced-create-topics-from-csi.md) - Topic suggestions from Customer Service Insights are automated into Power Virtual Agents with a single click. Data may go to a bot in a different geographic region than the workspace region in Customer Service Insights. 
