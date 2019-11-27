---
title: "Data location for Power Virtual Agents"
description: "Identify the geographic location where your data will reside."
ms.date: 11/27/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.collection: virtual-agent
ms.cusom: "multi-geo, gdpr"
---

# Data locations for organizations using Power Virtual Agents

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]
    
Power Virtual Agents can be deployed into the Microsoft Azure datacenters (also referred to as “regions”) listed in this article. You can create a bot by default in your tenant’s location or you can choose the datacenter you want to use when [setting up your environment](getting-started-new-environment.md).

Microsoft may replicate customer data to other regions available within the same geography for data durability. 

No matter where customer data is stored, Microsoft does not control or limit the locations from which customers or their end users may access customer data.

Data will be stored in United States, if a bot author’s tenant location is not listed under the Data locations table above. For France, data will be stored in Europe.   

## Data locations
Azure geographic locations (geos) | Azure datacenters (regions)
 ---|---
United States | East US (Blue Ridge, VA), South Central US (Des Moines, IA), West US (Quincy, WA)
Europe | West Europe (Netherlands), North Europe (Ireland)
Australia	 | Australia East (New South Wales), Australia Southeast (Victoria)
United Kingdom	| UK South (London), UK West (Cardiff, Durham)
India	| Central India (Pune), South India (Chennai)
Asia Pacific	| Southeast Asia (Singapore), East Asia (Hong Kong)
Japan	| Japan East (Tokyo, Saitama), Japan West (Osaka)

## Customer data  
Microsoft will not transfer customer data outside the selected Azure geographic location (geos) for Power Virtual Agents except when: 
- Microsoft must provide customer support, troubleshoot the service, or comply with legal requirements. 

- Customers use services that are designed to operate globally, including the following: 

  - Email used to send marketing messaging globally, as configured by the customer. 
  
  - The Dynamics 365 home page, which stores application names, descriptions, and logos globally for performance. 

  - [Azure Active Directory](/azure/active-directory/active-directory-whatis), which may store Active Directory data globally. 

  - [Azure Multi-Factor Authentication](/azure/active-directory/authentication/concept-mfa-howitworks), which may store multi-factor authentication data globally. 

  - Customer data collected during the onboarding process by the  [Microsoft Office 365 admin center](/office365/admin/microsoft-365-admin-center-preview?view=o365-worldwide). 
  - Services that provide global routing functions and do not process or store customer data. This includes Azure DNS, which provides domain name services that route to different regions; or preview, beta, or other pre-release services, which typically store customer data in the United States but may store it globally. 

  - Additionally, certain types of customer data (specifically the application name, application description, and application logo) will be stored globally, rather than in the primary storage geographic location. 

- Customers configure external services to extend Power Virtual Agents. Such customer configurations may cause customer data to be transferred outside of the selected geographic location. Examples of customer configurable external services include: 

  - [Customer Service Hand-off](advanced-hand-off.md) - Configurable external services that hand-off bot escalations to a human agent. 

  - Multi-Channel – Configurable to external channels such as Facebook and internal non-PVA services (Microsoft Teams). 

    - [Facebook documentation](publication-add-bot-to-facebook.md)

    - [Microsoft Teams documentation](publication-add-bot-to-microsoft-teams.md)

  - [Dynamics 365 Customer Service Insights Topic suggestion](advanced-create-topics-from-csi.md) - Topic suggestions from Customer Service Insights are automated into Power Virtual Agents with a single click. Data may go to a bot in a different geographic region than the workspace region in Customer Service Insights. 