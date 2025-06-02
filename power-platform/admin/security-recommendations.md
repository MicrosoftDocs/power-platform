---
title: View security recommendations
description: Use the actions page to identify and address potential risks across apps, sites, and tenant settings.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/28/2025
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

# View security recommendations

The actions page enhances the security and reliability of your Power Platform tenant with actionable recommendations. These recommendations identify potential risks and guide you on how to mitigate them. View security recommendations in the [actions page](power-platform-advisor.md) in the Power Platform admin center.

The following recommendations are grouped by resource type:

## Apps

The following recommendations relate to apps:

### Assign valid owners to apps to mitigate business continuity risks

This type of recommendation lists apps in all the Managed Environments within your Power Platform tenant that don't have a valid owner. Currently, this list contains apps active in the last 90 days.

> [!IMPORTANT]
> Resources with valid owners can make necessary changes or support users when an issue arises. If an app doesn't have a valid owner, it might be a business continuity risk.

#### Supported actions for apps without owners

##### Assign to new owner

1. To assign an app to a new owner, select the app from the list.
1. Select **Assign to new owner**.
1. Enter the new owner's name in the text box near the app list and select **Assign**.

Once assigned, you see a success message and the **Action State** column for that row displays **Completed**. You can't retake actions for completed rows.

> [!NOTE]
>
> - New owner information isn't updated in the list.
> - The app is shown in the list until the next planned scan.
> - New owners don't automatically get permissions to the environment or data sources used in the app. Admins must manually give owners permission.

##### Promote co-owner to owner

With multiple co-owners of an app, admins can promote one of the co-owners to owner.

1. Select an app and select **Promote co-owner to owner**.

   If you select multiple apps, the actions page displays any shared co-owners for the selected apps.

1. Select **Assign app** to promote the co-owner to owner for all selected apps.

- **Severity**: High  
- **Refresh frequency**: Weekly  
- **Managed environments only**: Yes  

### Secure high-value applications that are shared with ‘Everyone’, including guest users

This recommendation lists apps in all Managed Environments within your Power Platform tenant that are actively used and shared with **Everyone** in your Microsoft Entra tenant.

> [!IMPORTANT]
>
> - Only apps required for the entire organization are shared with **Everyone**.
> - Oversharing apps can pose significant security risks by exposing assets or allowing potential misuse.
> - Periodically review overshared apps and adjust permissions.

- **Severity**: High  
- **Refresh frequency**: Weekly  
- **Managed environments only**: Yes  

## Sites

The following recommendations relate to sites:

### Enable Web Application Firewall (WAF) to protect websites

This recommendation lists production websites that have Web Application Firewall (WAF) disabled. Review the websites and [enable Web Application Firewall](/power-pages/security/configure-web-application-firewall) where needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

- **Severity**: High  
- **Refresh frequency**: Daily  
- **Managed environments only**: Yes  

### Enhance your websiteʼs security by renewing its SSL certificate

This recommendation lists production websites with SSL certificates that are expired or will expire within 90 days. Review the websites and [renew the SSL certificates](/power-pages/admin/add-custom-domain) as needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

- **Severity**: High  
- **Refresh frequency**: Daily  
- **Managed environments only**: Yes  

## Tenant settings

The following recommendations relate to tenant settings:

### Secure agents by setting up data loss prevention policies for Copilot Studio items

- **Severity**: High  
- **Refresh frequency**: Real time  
- **Managed environments only**: No  

## Other security recommendations

Learn about other security related recommendations in [Security overview](security/security-overview.md#conditions-that-trigger-feature-recommendations).
