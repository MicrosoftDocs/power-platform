---
title: View operational efficiency recommendations
description: Learn how the actions page helps improve operational efficiency with recommendations for apps, sites, and tenant settings.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/29/2025
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
ms.contributors:
  - DanaMartens
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/04/2025
---

# View operational efficiency recommendations

The Actions page helps you optimize the operational efficiency of your Power Platform tenant by providing actionable recommendations. These recommendations identify opportunities to improve performance, governance, and resource utilization. You can view operational efficiency recommendations within the [actions page](power-platform-advisor.md) in the Power Platform admin center.

## Apps

The following recommendations relate to apps:

### Protect high-value apps with premium security and governance policies

This recommendation lists apps that are potentially high-value (used by over 100 users each month) and are currently hosted in the default environment. Apps that don't follow a proper application lifecycle management are prone to business continuity risks. By moving these high-value apps out of the default environment to a Managed Environment, you can also take advantage of various premium security and governance capabilities, such as [Customer Managed Keys](customer-managed-key.md) and [Solution Checker enforcement](managed-environment-solution-checker.md), to protect these apps. Alternatively, you can set the default environment as a [Managed Environment](managed-environment-overview.md) to use premium security and governance capabilities for all resources.

> [!IMPORTANT]
>
> - Apps should follow application lifecycle management (ALM) best practices. Not following proper ALM could cause a single change to break the app for several users with no easy way to recover.
> - The new _pipelines_ feature helps citizen developers, without prior ALM experience, to safely deploy their apps and dependent assets to a production environment.

- **Severity**: High
- **Refresh Frequency**: Weekly
- **Managed Environments only**: No

### Follow Application Lifecycle Management (ALM) best practices for high value apps

- **Severity**: High
- **Refresh Frequency**: Weekly
- **Managed environments only**: Yes  

### Maintain tenant hygiene by cleaning up quarantined apps

- **Severity**: Medium
- **Refresh Frequency**: Weekly
- **Managed environments only**: Yes  

### Maintain tenant hygiene by cleaning up unused apps

This recommendation lists apps in all Managed Environments within your Power Platform tenant that aren't used in the last 60 days. It's important that unused and unnecessary resources be removed periodically, to reduce the risk of exposure of your resources and to maintain proper hygiene of the tenant.

> [!IMPORTANT]
> Unused or unnecessary resources should be removed periodically to:
>
> - Reduce the risk of exposing your resources.
> - Maintain proper hygiene of the tenant.

#### Supported actions for unused apps

##### Quarantine

Select one or more apps from the list and select **Quarantine**.

Once you confirm the quarantine operation, the selected apps are quarantined. After apps are quarantined, you can make them active again using the [Set-AppAsUnquarantined PowerShell command](../guidance/adoption/manage-default-environment.md#quarantine-apps).

##### Delete

Select one or more apps from the list and select **Delete**.

After you confirm the delete operation, the selected apps are deleted.

> [!NOTE]
>
> - Once an action is taken, it takes up to one week for the apps to be removed from the list.
> - Quarantine and Delete actions fail if the app is already deleted outside the actions page.

- **Severity**: Medium
- **Refresh Frequency**: Weekly
- **Managed environments only**: Yes  

## Sites

The following recommendations relate to sites:

### Review and convert expiring trial websites to production

This recommendation lists trial websites that are expiring in the next seven days. Review and [convert the websites to production](/power-pages/admin/convert-site) as needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

- **Severity**: High
- **Refresh Frequency**: Daily
- **Managed environments only**: Yes  

### Review and shut down websites without any traffic

This recommendation lists websites that received no traffic in the last 30 days. This means some websites
in your tenant had no visitors in the past month. These websites might be outdated, irrelevant, or redundant.

To review these websites, select the recommendation to see a list of the websites, their URLs, environment names, and environment types. You can also visit the Power Platform admin center to get more insights into the traffic:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the left navigation, select **Manage**.
1. Under **Products**, select **Power Pages** and then select **Analytics (preview)**.

If a website isn't currently needed, you can shut it down. When a website is shut down, it's unavailable to users. You can always restart the websites later if you need them.

- **Severity**: High
- **Refresh Frequency**: Daily
- **Managed environments only**: Yes  

#### Supported actions for websites without traffic in the last 30 days

##### Shut down

To shut down a site:

1. Select one or more sites from the list and select **Shut down**.
1. After you confirm the shutdown operation, the selected sites are shut down.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

## Tenant settings

The following recommendations relate to tenant settings:

### Turn on tenant-wide analytics for better experience across the managed platform

- **Severity**: High
- **Refresh Frequency**: Real time
- **Managed environments only**: No
