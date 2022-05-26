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

Managed environments is a suite of capabilities that allow admins to manage Power Platform at scale with more control, less effort, and more insights. Admins can enable environment management on any type of environment. There are three primary elements of managed environments: 

- [Weekly digests](managed-environment-weekly-digests.md)
- [Sharing limits](managed-environment-sharing-limits.md)
- [Data policies](#data-policies) 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Data policies

A principal capability of a managed environment is enforcing policies that define the consumer connectors that specific data can be shared with. These policies are called data loss prevention (DLP) policies. DLP policies ensure that data is managed in a uniform manner across your organization, and they prevent important business data from being accidentally published to connectors such as social media sites. For more information on creating and managing DLP policies, see [Data loss prevention policies](wp-data-loss-prevention.md).

## Enabling environment management

Admins can enable environment management using the [Power Platform admin center](managed-environment-enable.md) or by calling the API from PowerShell. 

<UX workflow here> 

Admins can remove the Managed Environment property on an environment using the available API if respective environment is not using any of the capabilities available. The following is an example on how to call the API to set the Managed Environment property using PowerShell: 

## Permissions

- Users with either the global admin, Power Platform service admin or Dynamics 365 admin AAD roles are allowed to enable environment management. 
- Any user with permission to see environment details can retrieve the Managed Environment property for the environment.  
- Users with the delegated admin role are not allowed to change the Managed Environment property on an environment. 
- Users with the Environment Admin security role are not allowed to change the Managed Environment property on an environment.  

> [!IMPORTANT]
> Copy and restore environment lifecycle operations require Managed Environment property to be the same between source and destination before the respective environment lifecycle operation can start. 

## Licensing

Managed Environments represent a value-add for Power Platform premium licenses. All applications and flows in an Managed Environment are premium and can be licensed using any of the Power Platform licensing options (per user, per app/flow or pay-as-you-go) or D365 licenses that give premium usage rights. 

During the public preview the premium license requirement for applications and flows within a Managed Environment is not enforced. 

### See also  



[!INCLUDE[footer-include](../includes/footer-banner.md)]

