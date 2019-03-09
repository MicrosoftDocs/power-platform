---
title: Governance consideration | Microsoft Docs
description: Explains how PowerApps and Microsoft Flow be made widely available to their business and be supported by IT.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/21/2018
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Governance consideration

Many customers wonder: How can PowerApps and Microsoft Flow be made available to their broader business and supported by IT? Governance is the answer. It aims to enable business groups to focus on solving business problems efficiently while complying with IT and business compliance standards. The following content is intended to structure themes often associated with governing software and bring awareness to capabilities available for each theme as it relates to governing PowerApps and Microsoft Flow. 

|Theme  |Common questions related to each theme for which this content answers  |
|---------|---------|
|Architecture     | <ul><li>What are the basic constructs & concepts of PowerApps, Microsoft Flow, and Common Data Service for Apps?</li> <br /><li>How do these constructs fit together at design time & runtime?</li></ul> |
|Security     | <ul><li>What are the best practices for security design considerations?</li> <br /><li>How do I leverage our existing user and group management solutions to manage access and security roles in PowerApps?</li></ul>     |
|Monitor     | <ul><li>How are we capturing compliance / auditing data?</li> <br /><li>How can I measure adoption and usage within my organization?</li></ul>        |
|Alert and Action     | <ul><li>How do I define the governance model between citizen developers and managed IT services?</li> <br /><li>How do I define the governance model between central IT and the business unit admins?</li> <br /><li>How should I approach support for non-default instances in my organization? </li></ul>        |
|Deploy     | <ul><li>How do I stand up my platform so that I can efficiently maintain my environments?</li> <br /><li>I want a backup plan and solution that provides business continuity and resiliency for my end users.</li> <br /><li>How do I define how DevOps and modern software engineering practices apply to APaaS? </li></ul>     |

## Architecture
It’s best to familiarize oneself with Environments as the first step to building the right governance story for your company. Environments are the containers for all resources utilized by a PowerApps, Microsoft Flow and Common Data Service for Apps. [Environments Overview](environments-overview.md) is a good primer which should be followed by [Common Data Service for Apps](wp-cds-for-apps.md), [Types of PowerApps](wp-types-powerapps.md), [Microsoft Flow](wp-about-flows.md), [Connectors](wp-connectors.md),  and [On-premises Gateways](wp-onpremises-gateway.md). 

## Security 
This section outlines mechanisms that exist to control who can access PowerApps in an environment and access data: licenses, environments, environment roles, Azure Active Directory, Data Loss Prevention policies and admin connectors that can be used with Flow. 

### Licensing 
Access to PowerApps and Flow starts with having a license, the type of license a user has determines the assets and data a user can access. The following table outlines differences in resources available to a user based on their plan type, from a high-level. Granular licensing details can be found in the [Licensing overview](pricing-billing-skus.md).


|Plan  |Description  |
|---------|---------|
|Office 365 Included     | This allows users to extend SharePoint and other Office assets they already have.        |
|Dynamics 365 Included     | This allows users to customize and extend Dynamics 365 apps they already have.        |
|PowerApps P1     | This allows makes enterprise connectors and Common Data Service for Apps accessible for use.        |
|PowerApps P2     | This allows users to use robust business logic across application types and administration capabilities.        |

### Environments
After users have licenses, environments exist as containers for all resources utilized by PowerApps, Microsoft Flow and Common Data Service for Apps. Environments can be used to target different audiences and/or for different purposes such as developing, testing and production. More information can be found in the [Environments Overview](environments-overview.md).

#### FAQ –  Who can provision an environment?
- The default environment is created automatically when the first PowerApps or Microsoft Flow user signs-in. 
- Developer environment is created whenever a user signs-up for the PowerApps community plan – [http://aka.ms/powerappcommunityplan ](http://aka.ms/powerappcommunityplan )
- Up to 2 trial environments can be created by any user who signs-up for a PowerApps Plan 2 or Microsoft Flow Plan 2 30-day trial license.
- Production environments can be created by any user who has a PowerApps Plan 2 or Microsoft Plan 2 license.
- Production environments are pooled at the tenant level - every Plan 2 license grants an entitlement to provision 2 additional environments

### Secure your data and network
- PowerApps and Flow *do not* provide users with access to any data assets that they don’t already have access to. Users should only have access to data that they really require access to.
- Network Access control policies can also apply to PowerApps and Flow. For instance, one can block access to a site from within a network by blocking the sign-on page to prevent connections to that site from being created in PowerApps & Flow. 
- In an environment, access is controlled at three levels: [Environment roles](database-security.md), [Resource permissions for PowerApps](wp-controlling-access.md), Microsoft Flows, etc… and [Common Data Service security roles](wp-security-cds.md) (if a CDS data base is provisioned). 
- When Common Data Service for Apps is created in an environment the Common Data Service for Apps roles will take over for controlling security in the environment (and all environment admins and makers are migrated).

The following principals are supported for each role type.

|Environment type  |Role  |Principal Type (AAD)  |
|---------|---------|---------|
|Environment without Common Data Service for Apps     | Environment role        | User, group, tenant         |
|     | Resource permission: Canvas app        | User, group, tenant        |
|     | Resource permission: Flow, Custom Connector, Gateways, Connections<sup>1</sup>        | User, group        |
|Environment with Common Data Service for Apps      | Environment role        | User        |
|     |Resource permission: Canvas app         |User, group, tenant         |
|     | Resource permission: Flow, Custom Connector, Gateways, Connections<sup>1</sup>          |User, group         |
|     |CDS role (applies to all model-driven apps & components)         |User         |

<sup>1</sup>Only certain connection (like SQL) can be shared.

> [!NOTE]
> - In the Default environment, all users in a tenant are granted access to the Environment Maker role. 
> - Azure AD tenant Global Administrators have admin access to all environments.

#### FAQ - What permissions exist at an Azure AD tenant level? 

**Without a PowerApps Plan 2 license** 

1. [Download the PowerApps and Microsoft Flow license report](admin-view-user-licenses.md).
2. [Create DLP policy scoped only to ‘All Environments’](create-dlp-policy.md).
3. [Manage and assign licenses via Office admin center](signup-question-and-answer.md).

**With a PowerApps Plan 2 license**

1. [Download the PowerApps and Microsoft Flow license report](admin-view-user-licenses.md).
2. [Create DLP policy scoped only to ‘All Environments’](create-dlp-policy.md) or scoped to include/exclude specific environments.
3. [Manage and assign licenses via Office admin center](signup-question-and-answer.md).
4. Full access to all the environment, app, and flow management capabilities for all environments in the tenant available via:
   - [PowerApps Admin center](https://admin.powerapps.com/)
   - [PowerApps Admin PowerShell cmdlets](https://docs.microsoft.com/powerapps/administrator/powerapps-powershell)
   - [PowerApps management connectors](https://aka.ms/adminconnectorreference)
5. Full access the PowerApps and Microsoft Flow admin analytics for all environments in the tenant:
   - [https://aka.ms/paadminanalytics  ](https://aka.ms/paadminanalytics)
   - [https://aka.ms/flowadminanalytics](https://aka.ms/flowadminanalytics) 











