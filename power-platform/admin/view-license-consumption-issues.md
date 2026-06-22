---
title: View license consumption for Power Apps (preview)
description: Learn how to view your organization's Power Apps license consumption and find potential license issues. 
author: amiyapatr-zz
ms.date: 04/01/2026
ms.reviewer: sericks
ms.topic: concept-article
ms.subservice: admin
ms.author: ampatra
contributors:
 - ampatra
 - sandhan
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

The Power Apps license consumption experience in the Power Platform admin center helps admins track and manage licensing for Power Apps. It helps answer key questions such as: 

- How many Power Apps licenses did you purchase? 
- How many of those licenses are assigned to users? 
- What types of licenses are used to launch apps? 
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

The **Per user licenses** web part displays a summary count of all per-user licenses you purchased that provide Power Apps entitlement, along with assignment and usage. 

The web part contains the following columns:

- **License name**: Name of the license that provides Power Apps entitlement, such as Power Apps Premium or Dynamics 365 licenses.
- **Licenses used**: Unique count of licensed users who launched a Power App at least once in the last 90 days.
- **Assigned licenses**: Number of licenses assigned to users. 
- **Purchased licenses**: Total number of licenses available.

:::image type="content" source="media/per-user-licenses.png" alt-text="Screenshot of the web part displaying a summary count of all per-user licenses purchased that provide Power Apps entitlement, along with assignment and usage." lightbox="media/per-user-licenses.png":::

### Per app licenses 

The **Per app licenses** web part shows allocation and purchased license count of per-app licenses. 

The web part contains the following columns:

- **License name**: Name of the license that provides Power Apps entitlement, in this case per app.

- **Allocated licenses**: Number of per-app licenses assigned to different environments. 

- **Purchased licenses**: Total number of per-app licenses available. 

Use the **Manage capacity** link to adjust allocations. 

### Pay-as-you-go plans 

The **Pay-as-you-go plans** web part provides visibility into pay-as-you-go billing plans linked to Power Apps. 

The web part contains the following columns:

- **License name**: Pay-as-you-go plans configured for environments. 

- **Manage billing plans**: Number of active billing plans. 

Use the **Manage capacity** link to review or update Azure subscription settings. 

### Monthly user license consumption 

The **Monthly user license consumption** web part shows month-over-month trends for per-user license consumption. 

The web part contains a bar chart that shows active users per license type over recent months. 

:::image type="content" source="media/monthly-user-license-consumption.png" alt-text="Screenshot of the web part containing a bar chart showing active users per license type over recent months." lightbox="media/monthly-user-license-consumption.png":::

### Monthly per app license consumption 

The **Monthly per app license consumption** web part displays consumption trends for per-app licenses. The graph shows how many per-app licenses are consumed and how many app usages are billed to pay-as-you-go each month. The app passes consumption resets during end of the month.  

:::image type="content" source="media/monthly-per-app-license-consumption.png" alt-text="Screenshot of the graph showing how many per-app licenses are consumed and how many app usages are billed to pay-as-you-go each month. The app passes consumption resets during end of the month." lightbox="media/monthly-per-app-license-consumption.png":::

## Additional admin options 
 
Use the **Download Reports** button near the top of the page to export detailed license consumption data. You can download the following reports:

- **Active users**: See which app a user launched, the last app launch details, and whether the user used an app pass, pay-as-you-go, or subscribed license. 

- **All licensed users**: View a list of all users who are assigned a license.

By using these exports, you can find users who are assigned licenses but aren't using them to launch apps.

- **Users requiring licenses in Managed Environments**: See users that launched apps in managed environments without an appropriate license. For more information, see [managed environment Licensing requirements](managed-environment-licensing.md).

> [!NOTE]
> - The report lists users that have accessed at least one app in any managed environment without an appropriate license.
> - The report shows a list of unique users based on their app launch activity in the selected month. The report excludes users who didn't launch an app in the selected month.
> - If a user was assigned an appropriate license but hasn't launched any app since then, they'll continue to show in the report until they next launch an app.
> - The report includes details on the specific users, the environments they operate in, and the applications they use.


## View license consumption for environment  

The **Environments** tab within the **Licensing** area for Power Apps helps admins track license consumption for the selected environment. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 

1. In the navigation pane, select **Licensing**. 

1. In the **Licensing** pane, under **Products**, select **Power Apps**. 

1. Select the **Environments** tab. 

1. Select the appropriate environment.

## Who can access and set up 

Power Platform admins and Dynamics 365 admins can access the summary view and environment view, and they can allocate app passes.

Environment admins can access the environment view. Tenant admins can also allow environment admins to access the summary view by updating the **Tenant licensing summary view** setting in Power Platform settings. 
