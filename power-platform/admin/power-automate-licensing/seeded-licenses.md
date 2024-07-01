---
title: Seeded licenses in Power Automate
description: Learn about seeded licenses in Power Automate
author: cvassallo
contributors:
  - cvassallo
ms.subservice: admin
ms.topic: overview
ms.date: 06/24/2024
ms.author: cvassallo
ms.reviewer: angieandrews
search.audienceType: 
  - admin
---

# Seeded licenses in Power Automate

Entitlements to use [Power Automate capabilities](types.md#license-entitlements) (standard connectors, premium connectors) can be obtained via seeded licenses. Seeded licenses are a particular type of [Power Automate user licenses](types.md#user-licenses), they are tied to other Microsoft products and they offer limited capabilities on Power Automate.

<br>

## Types of seeded licenses

Users gain limited rights to use Power Automate if they inherited seeded plans from licenses tied to other Microsoft products:
- Microsoft 365 (formerly Office 365) / Dynamics 365 Enterprise / Dynamics 365 Professional / Dynamics 365 Team Member
- Power Apps Per-app plan / Power Apps Premium / Power Apps Plan 1 or Plan 2 (legacy)
- Windows licenses

Those licenses entitle the user to create and run cloud flows with standard connectors. They can also entitle them to create and run a cloud flow with premium and custom connectors if the flow is in-context and associated to the application from which the seeded license is inherited. 

> [!NOTE]
> - Example 1: if a cloud flow uses premium connectors, is owned by a user with a Power Apps Premium license, associated to a Power App and triggered by the app, any user can run the flow if they have a Power Apps license.
> - Example 2: a cloud flow created within a Dynamics 365/App using a Power Apps can connect to the following
>   - To any data source within the use rights of the Dynamics 365/App created using Power Apps.
>   - Directly with the Dynamics 365/App created using Power Apps (via built-in triggers/actions).

If the cloud flow is isolated and has nothing to do with the application, then a standalone Power Automate Premium must be purchased. You can find more details can be found in [Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

<br>

## Compare seeded licenses

Here-bellow a table detailing each seeded license [entitlement](types.md#license-entitlements):

||Power Apps Premium<br>_______________|Office <br>365<br>_______________|Dynamics 365 professional <sup>1</sup><br>______________________|Dynamics 365 Enterprise applications <sup>2</sup><br>______________________________|Dynamics 365 Team member<br>________________________|Windows licenses<br>_______________|
|----------|-------|---------------------|--------------|--------------|--------------|--------------|
|__Applied to__|User|User|User|User|User|Machine|
|__Daily PPR limit__|40k per user|6k per user|40k per user|40k per user|6k per user|Not included|
|__Standard connectors__|Included|Included|Included|Included|Included|Not included|
|__Premium connectors__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Not included|
|__Custom connectors__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>3,5</sup>|Not included|
|__Attended RPA__|Not included|Not included|Not included|Not included|Not included|Included with limitations<sup>6</sup>|
|__Unattended RPA__|Not included|Not included|Not included|Not included|Not included|Not included|
|__Hosted RPA__|Not included|Not included|Not included|Not included|Not included|Not included|
|__Business process flows__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Not included|
|__On-premises gateways__|Included with limitations <sup>4</sup>|Not included|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Included with limitations <sup>5</sup>|Not included|
|__Process mining__|Not included|Not included|Not included|Not included|Not included|Not included|
|__Process mining data storage__|Not included|Not included|Not included|Not included|Not included|Not included|
|__AI Builder credits__|500|Not included|Not included|Not included|Not included|Not included|
|__Dataverse database storage__|250-MB per license|Not included|Not included|Not included|Not included|Not included|
|__Dataverse file storage__|2-GB per license|Not included|Not included|Not included|Not included|Not included|

_1. Dynamics 365 Sales Professional and Dynamics 365 Customer Service Professional_ <br>
_2. Dynamics 365 Sales Enterprise, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Project Service Automation, Dynamics 365 Retail, Dynamics 365 Talent, and Dynamics 365 Customer Engagement plan_ <br>
_3. In Dataverse for Teams environments (included in [specific Office licenses)](../powerapps-flow-licensing-faq.md#which-microsoft-365-subscriptions-include-dataverse-for-teams-and-microsoft-copilot-studio-capabilities-with-teams), users can use custom connectors built on Azure and Dataverse_ <br>
_4. Only included if cloud flow is in-context & associated to a Power App_ <br>
_5. Only included if cloud flow is in-context & associated to a Dynamic 365 app_ <br>
_6. Only includes local execution of desktop flow (no orchestration)_ <br>

## How to gain more entitlements in Power Automate ?

To gain access to all premium connectors, custom connectors, attended RPA, etc., a user should opt for a [Power Automate license](types.md).
