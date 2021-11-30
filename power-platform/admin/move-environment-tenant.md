---
title: "Migrate an environment to a different tenant"
description: "Learn about the impact of moving an environment from one tenant to another. Review the prerequisites and considerations before submitting a request." 
ms.custom: ""
ms.date: 11/29/2021
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
author: jimholtz
ms.subservice: admin
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

You can use the tenant-to-tenant migration feature to request to have an environment in one tenant moved to another tenant. This feature enables customers to support the following cases:

- Consolidate multiple tenants under one tenant
- Support acquisition from Company A to Company B

You need to [submit a support request](get-help-support.md) to initiate tenant-to-tenant migration. 

There are no user-interface changes or version changes as part of this move. You can move one or multiple environments. Once complete, your environment(s) will appear in your new tenant.

> [!IMPORTANT]
> When moving individual environments from one tenant to another, if that requires a geographical region change, your tenant becomes a multiregional tenant. Regional features are enabled in the Power Platform admin center.
> 
> You might need to reconfigure some applications and settings after tenant to tenant migration such as Microsoft Dynamics 365 for Outlook, server-side sync, SharePoint integration, etc.
>
> Geographical region changes are not supported into or out of US GCC, US GCC High, US DoD, or China.

### Applications and platform supported

| Supported | Not fully supported<sup>*</sup> |
|-------------------------|-------------------------|
| <ul></br><li>Dynamics 365 version 9.0 or later</li></br><li>Dynamics 365 version 8.1</li></br><li>Dataverse</li></br><li>customer engagement apps</li></br></ul> | <ul></br><li>Power Apps</li></br><li>Power Automate</li></br><li>Power Flow</li></br><li>Power Virtual Agent</li></br></ul> |

<sup>*</sup>There could be potential data loss during migration.

### Scenarios supported

| Supported | Not Supported |
|-------------------------|-------------------------|
| <ul></br><li>Migrating production org</li></br><li>Migrating sandbox org</li></br><li>Migrating tenants from GCC to GCC</li></br><li>One or multiple environments</li></br><li>Identity migration</li></br></ul> | <ul></br><li>Migrating default org</li></br><li>Migrating teams org</li></br><li>Migrating trial org</li></br><li>Migrating demo environment</li></br><li>Migrating tenants from GCC to another geo or from another geo to GCC</li></br></ul> |

### Migration flow

# [Image](#tab/image)

:::image type="content" source="media/migration-flow.png" alt-text="Migration flow":::

# [Table](#tab/table)

<table>
  <tr>
    <td>Submit request<br>|<br>v </td>
    <td colspan="5"></td>
  </tr>
  <tr>
    <td>Pre-verification<br>--></td>
    <td>Create and restore database<br>--></td>
    <td>Change org's mapping<br>--></td>
    <td>User mapping and sync<br>--></td>
    <td>Publish destination organization<br>--></td>
    <td>Disable source organization</td>
  </tr>
</table>

---

### Prerequisite:

- Destination tenant has enough user licenses
- Destination tenant has enough environment licenses
- Destination tenant has valid paid subscription
- Destination tenant has enough storage for environments being migrated

If you do not have a paid subscription in the destination tenant, then you'll need to create one. You might need to purchase a new subscription in the destination tenant (or convert a trial to paid), if not already done.

Depending on how many source environments you are migrating, you'll need to create a temporary environment or environments in the destination tenant. The source environment type and destination environment type must match (production vs non-production (sandbox)). The users to be migrated from one tenant to another need to be created on the target tenant as well.

The destination tenant needs an equal or higher number of active user licenses, environment licenses for the environments being migrated, and equal or greater storage as the source tenant.

When your organization is moved from one tenant to another within the same region, the URL does not change.In order to perform this operation, you'll need to provide some information, such as:

- What is the source tenant domain and its region? (example: EMEA, NA, APAC)
- What is the destination tenant domain and its region? (example: EMEA, NA, APAC)
- Does the destination tenant have a valid subscription?
- Does the destination tenant have enough available user licenses?
- Does the destination tenant have enough environment licenses?
- Does the destination tenant have enough storage available for the environments being migrated?

## Post Migration

After moving environments to another tenant:

- The environment ID in the target tenant cannot be set to the same environment ID as in the source tenant. This is not supported.
- The org URL, org ID, and the name do not change.
- The source environment will not be accessible.
- Security group mapping is handled as part of the manual tenant-to-tenant migration process. At the very least, a replacement (or removal) will be needed because the security group won't exist with the same ID in the new Azure AD tenant.

## How the move works

You’ll be provided with a list of prerequisites and post-requisites for your migration as part of the support request raised. The following table describes what Microsoft does before, during, and after your move.


| |Before the move<br/>Notification   |During the move<br/>Cut-over  |After the move<br/>Notification and support |
|---------|---------|---------|---------|
|**What Microsoft does**   |Your support representative or Account Manager will work with you to request a move and schedule it.         |Cut-over for the migration takes several hours, depending on the number of users and the amount of data. During this period, the organization is not accessible, so the cut-over should be scheduled during the evening or over a weekend.<br/><br/>There is a step that will require your involvement, which is to provide a User Mapping File. This is requested in advance so that we can validate the users being moved before the migration takes place.         |You will be alerted by email or telephone when your environment is migrated to the new tenant.<br/><br/>After the tenant migration is complete, your support representative or Account Manager will assist you to contact with billing to cancel and/or credit your previous subscription, if needed.         |

We will adhere to the terms of the [Microsoft Online Services Service Level Agreement](https://go.microsoft.com/fwlink/p/?LinkID=523897) for all moves.

## Frequently asked questions

## Are background operations in setting enabled during T2T ?
Administration mode is enabled during T2T migration so background operations don’t run. [Administration mode - Power Platform ](https://docs.microsoft.com/en-us/power-platform/admin/admin-mode)

## Can we migrate all users from source to destination ?
we can migrate all source users to destination only if users in the destination org.e.g
user001@source.com,user001@destination.com
user002@source.com,user002@destination.com        


[!INCLUDE[footer-include](../includes/footer-banner.md)]
