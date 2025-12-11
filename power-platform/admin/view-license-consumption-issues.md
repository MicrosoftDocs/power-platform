---
title: View license consumption for Power Apps (preview)
description: Learn how to view your organization's Power Apps license consumption and find potential license issues. 
author: amiyapatr-zz
ms.date: 12/04/2025
ms.reviewer: sericks
ms.topic: concept-article
ms.subservice: admin
ms.author: ampatra
contributors:
 - ampatra
 - sericks
 - syalandur
ms.contributors:
 - ampatra-zz
 - sericks007
 - syalandur24
ms.custom: bap-template
search.audienceType: 
 - admin
---

# View license consumption for Power Apps (preview)

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The Power Apps license consumption experience in the Power Platform admin center lets admins track and manage licensing for Power Apps. It helps answer key questions such as: 

- How many Power Apps licenses are purchased? 
- How many of those licenses are assigned to users? 
- What types of licenses are being used to launch apps? 
- How many users are actively consuming Power Apps? 
- Who are the users actively consuming Power Apps? 
- Are there users who need standalone Power Apps?

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## View summary information 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 
1. On the navigation pane, select **Licensing**. 
1. In the **Licensing** pane, under **Products**, select **Power Apps**. 
1. Select the **Summary** tab. 

### Per user licenses 

The **Per user licenses** web part displays a summary count of all per-user licenses purchased that provide Power Apps entitlement, along with assignment and usage. 

The web part contains the following columns:

- **License name**: Name of the license providing Power Apps entitlement, such as Power Apps Premium or Dynamics 365 licenses.
- **Licenses used**: unique count of licensed users who launched a Power App at least once in the last 90 days.
- **Assigned licenses**: How many licenses have been assigned to users. 
- **Purchased licenses**: Total number of licenses available.

:::image type="content" source="media/per-user-licenses.png" alt-text="The web part displays a summary count of all per-user licenses purchased that provide Power Apps entitlement, along with assignment and usage." lightbox="media/per-user-licenses.png":::

### Per app licenses 

The **Per app lienses** web part shows allocation and purchased license count of per-app licenses. 

The web part contains the following columns:

- **License name**: Name of the license providing Power Apps entitlement, in this case per app.

- **Allocated licenses**: Number of per-app licenses assigned to different environments. 

- **Purchased licenses**: Total number of per-app licenses available. 

The web part allows you to use **Manage capacity** link to adjust allocations. 

### Pay-as-you-go plans 

The **Pay-as-you-go plans** web part provides visibility into pay-as-you-go billing plans linked to Power Apps. 

The web part contains the following columns:

- **License name**: Pay-as-you-go plans configured for environments. 

- **Manage billing plans**: Number of active billing plans. 

The web part allows you to use **Manage capacity** link to review or update Azure subscription settings. 

### Monthly user license consumption 

The **Monthly user license consumption** web part shows month-over-month trends for per-user license consumption. 

The web part contains a bar chart showing active users per license type over recent months. 

:::image type="content" source="media/monthly-user-license-consumption.png" alt-text="The web part contains a bar chart showing active users per license type over recent months." lightbox="media/monthly-user-license-consumption.png":::

### Monthly per app license consumption 

The **Monthly per app license consumption** web part displays consumption trends for per-app licenses. The graph shows how many per-app licenses are consumed and how many app usages are billed to pay-as-you-go each month. The app passes consumption resets during end of the month.  

:::image type="content" source="media/monthly-per-app-license-consumption.png" alt-text="The graph shows how many per-app licenses are consumed and how many app usages are billed to pay-as-you-go each month. The app passes consumption resets during end of the month." lightbox="media/monthly-per-app-license-consumption.png":::

## Additional admin options 
 
The **Download Reports** button, near the top of the page, allows you to export detailed license consumption data. The following reports can be downloaded:

- **Active users**: Identify which app was launched by a user, last app launch details, and whether an app pass, pay-as-you-go, or subscribed license was used. 

- **All licensed users**: List of all users who have been assigned a license. 

With these exports, you can identify users who have been assigned licenses, but haven't been using them to launch apps. 

## View license consumption for environment  

The Environments tab within the **Licensing** area for Power Apps allows admins to track license consumption for the selected environment. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

1. In the navigation pane, select **Licensing**. 

1. In the **Licensing** pane, under **Products**, select **Power Apps**. 

1. Select the **Environments** tab. 

1. Select the appropriate environment.

## Who can access set it up 

Power Platform admins and Dynamics 365 admins can access summary view, environment view, and can allocate app passes.

The environment admin can access the environment view. Tenant admins can also allow environment admins to access summary view by updating the **Tenant licensing summary view** setting in Power Platform settings. 
