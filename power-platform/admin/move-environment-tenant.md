---
title: "Migrate an environment to a different tenant"
description: "Learn about the impact of moving an environment from one tenant to another. Review the prerequisites and considerations before submitting a request." 
ms.custom: ""
ms.date: 02/04/2021
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
author: jimholtz
ms.author: jimholtz
ms.reviewer: ""
ms.assetid: 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Tenant to tenant migration

## Move an environment to a different tenant

You can use the Tenant to Tenant Migration feature to request to have an environment in one tenant moved to another tenant. To do so [submit a support request](get-help-support.md).

There are no user-interface changes or version changes as part of this move. You can move one or multiple environments. Once complete, your environment(s) will appear in your new tenant.

> [!IMPORTANT]
> When moving individual environments from one tenant to another, if that requires a geographical region change, your tenant becomes a multiregional tenant. Regional features are enabled in the Power Platform admin center.
>
> Geographical region change are not supported into or out of US GCC, US GCC High, or China.
> 
> You might need to reconfigure some applications and settings after tenant to tenant migration such as Microsoft Dynamics 365 for Outlook, server-side sync, SharePoint integration, etc.
>

## Impact of migrating between tenants

When your organization is moved from one tenant to another within the same region, the URL does not change.

In order to perform this operation, you'll need to provide some information, such as:
- What is the source tenant domain and its region? (example: EMEA, NA, APAC)
- What is the destination tenant domain and its region? (example: EMEA, NA, APAC)
- Does the destination tenant have a valid subscription?
- Does the destination tenant have enough available user licenses?
- Does the destination tenant have enough environment licenses?
- Does the destination tenant have enough storage available for the environments being migrated?

If you do not have a subscription and/or trial in the destination tenant, then you will need to create one. You might need to purchase a new subscription in the destination tenant (or convert a trial to paid), if not already done.

You will need to create a temporary environment or environments in the destination tenant, depending on how many source environments you are migrating.  Source environment type and destination environment type must match (production vs non-production (sandbox)). The users to be migrated from one tenant to another need to be created on the target tenant as well.

The destination tenant needs an equal or higher number of active user licenses, environment licenses for the environments being migrated, and equal or greater storage as the source tenant.

### Additional considerations

After moving environments to another tenant:

- The environment ID in the target tenant cannot be set to the same environment ID as in the source tenant. This is not supported. 
- The org URL, org ID, and the name do not change. 
- Security group mapping is handled as part of the manual tenant to tenant migration process. At the very least, a replacement (or removal) will be needed because the security group won’t exist with the same ID in the new Azure AD tenant. 

## How the move works

You’ll be provided with a list of prerequisites and post-requisites for your migration as part of the support request raised. The following table describes what Microsoft does before, during, and after your move.


| |Before the move<br/>Notification   |During the move<br/>Cut-over  |After the move<br/>Notification and support |
|---------|---------|---------|---------|
|**What Microsoft does**   |Your support representative or Account Manager will work with you to request a move and schedule it.         |Cut-over for the migration takes several hours, depending on the number of users and the amount of data. During this period, the organization is not accessible, so the cut-over should be scheduled during the evening or over a weekend.<br/><br/>There is a step that will require your involvement, which is to provide a User Mapping File. This is requested in advance so that we can validate the users being moved before the migration takes place.         |You will be alerted by email or telephone when your environment is migrated to the new tenant.<br/><br/>After the tenant migration is complete, your support representative or Account Manager will assist you to contact with billing to cancel and/or credit your previous subscription, if needed.         |

We will adhere to the terms of the [Microsoft Online Services Service Level Agreement](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
