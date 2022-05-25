---
title: "Managed environments overview | MicrosoftDocs"
description: Use managed environments to gain more visibility and control of your Dynamics 365 applications and flows, with less effort.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/27/2022
author: mikferland-msft
ms.author: miferlan
ms.reviewer: jimholtz
contributors:
  - mikferland-msft
  - alaug 
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Managed environments overview

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Managed Environments is a suite of capabilities that allow admins to manage Power Platform at scale with more control, less effort, and  
more insights. There are three primary elements of managed environments: weekly digests, sharing limits, and data policies.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Weekly digests

## Sharing limits

Managed environments allow admins to influence how broadly makers can share canvas apps. There are two sharing controls.  


|Sharing control   |System behavior when checked?   |
|---------|---------|
|**Exclude sharing with security groups**      | Makers cannot share canvas apps with any security groups. <br />Admins get the option to proceed with setting a limit on  individuals shared to.          |
|**Limit total individuals who can be shared to**     |  Makers cannot share canvas apps with more individuals than specified in the text box.        |

**Limit total individuals who can be shared to** is only enabled if **Exclude sharing with security groups** is checked. This is because security groups may have unbounded membership. For instance, a Maker could share an app with a security group that has 5 members one day and, in the future after the app was shared, the security group could grow to 500 members.  

> [!NOTE]
> Sharing rules are enforced when makers attempt to share an app. Sharing rules do not change the audience apps in an environment are already shared with.  

screenshot

## Data policies

Another capability of a managed environment is enforcing policies that define the consumer connectors that specific data can be shared with. These policies are called data loss prevention (DLP) policies. DLP policies ensure that data is managed in a uniform manner across your organization, and they prevent important business data from being accidentally published to connectors such as social media sites. For more information on creating and managing DLP policies, see [Data loss prevention policies](wp-data-loss-prevention.md).


### See also  



[!INCLUDE[footer-include](../includes/footer-banner.md)]

