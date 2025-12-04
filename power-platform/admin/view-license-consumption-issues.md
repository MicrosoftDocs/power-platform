---
title: View license consumption for Power Apps and Power Automate (preview)
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
- Are there users who need standalone Power Apps or Power Automate licenses?

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

### Per app licenses 

The **Per app lienses** web part shows allocation and purchased license count of per-app licenses. 

The web part contains the following columns:

- **License name**: Name of the license providing Power Apps entitlement, such as Power Apps Premium or Dynamics 365 licenses.

- **Allocated licenses**: Number of per-app licenses assigned to different environments. 

- **Purchased licenses**: Total per-app licenses available. 

The web part allows you to use **Manage capacity** link to adjust allocations. 

Pay-As-You-Go Plans 

Provides visibility into PAYG billing plans linked to Power Apps. 

Details: 

License Name: PAYG plans configured for environments. 

Billing Plans: Number of active billing plans. 

Actions: 

Click Manage billing plans to review or update Azure subscription settings. 

 

 

Monthly User License Consumption 

Visualizes month-over-month trends for per-user license consumption. 

Details: 

Bar chart showing active users per license type over recent months. 

The image shows a line chart depicting the monthly consumption of Microsoft Office 365 and related services over a period from May to December.

AI-generated content may be incorrect.

Monthly Per App License Consumption 

Displays consumption trends for per-app licenses. 

Details: 

Graph shows how many per-app licenses are consumed and how many app usages are billed to Pay-Go each month. The app passes consumption resets during end of the month.  

## Additional Admin Options 
 
 Download Reports: Export detailed license consumption data. Following reports can be downloaded. 

Active Users: Identify which app was launched by a user, last app launch details, and whether an app pass, PAYG, or subscribed license was used. 

All Licensed Users: List of all users who have been assigned a license. 

With these exports, you can identify users who have been assigned licenses but have not been using them to launch apps. 

Sample report output below  

View License consumption for Environment  

The Environment view within Licensing hub for Power Apps lets admins track license consumption for the selected environment. 

Sign in to the Power Platform admin center. 

On the navigation pane, select Licensing. 

In the Licensing pane, under Products, select Power Apps. 

Select the Environment tab. 

Click on appropriate environment  

Who can access set it up 

Power Platform admin, Global admin and Dynamics 365 admin can access summary view, environment view and also can allocate app passes 

Environment admin: can access the environment view .In addition – tenant admins can allow environment admins to access summary view by updating the “Tenant licensing summary view” setting in Power Platform settings 



















In addition, Admins can also allocate App Passes and manage their Pay-As-You-Go (PAYG) plan related to Power Apps. 

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available in your region yet.

## Summary tab

The **Summary** tab on the **Licenses** page displays a summary of any environments in your tenant that require licensing attention.

| Setting | Description |
| ------- | ----------- |
| Include standard environments | Select this option to view results for standard, or unmanaged, environments. By default, only Managed Environments are displayed. In Managed Environments, all users need standalone Power Apps or Power Automate licenses to run apps or execute flows. |
| Environments requiring attention | The number of environments that have a licensing issue and need your attention. |
| Environment | A list of environments that have a licensing issue. |
| License issues | The number of licensing issues for an environment. |

### Power Apps licensing summary

Use the following options in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to view the license consumption information for Power Apps:

- New admin center: Select **Licensing** on the navigation pane, and select **Power Apps** under **Products**.
- Classic admin center: On the **Licenses** > **Summary** page, select **Power Apps** under **Summaries**.

The **Power Apps licensing summary** section provides details of how many Power Apps licenses have been purchased, how many of those licenses are assigned, and how many of those licenses are being actively used. This view is available to Power Platform admin and Dynamics 365 admins roles.

| Setting | Description |
| ------- | ----------- |
| **Power Apps licensing overview** | The number of users actively using licenses by virtue of opening Power Apps in the last 30 days. This section also provides details of how many Power Apps licenses have been available and how many of those licenses have been assigned to users. |
| License type | The type of license—Dynamics 365, Microsoft 365, per app, per user, pay-as-you-go, trial, or developer—the actual license is mapped to. |
| Active users | The number of unique users who opened apps in any of the environments in your tenant at least once in the last 30 days. |
| Assigned licenses | The number of unique users who have been assigned a license.|
| Purchased licenses | The number of Power Apps licenses available for your tenant. |
| Usage details for a license type | Select a license type in the **Power Apps licensing overview** section to view a list of the users who are consuming a specific license type. |
| Email | The email ID or user principal name (UPN) of the user who opened an app in any of the environments. Select the email link to open the Microsoft 365 admin portal. |
| License | The license SKU. |
| Last active date | The date when an app was last opened by a user within last 30 days. |
| Environment | The name of environment in which a user has last opened an app. |
| **License type: Power App Per App** | If the selected environment has per app licenses assigned, a list of apps consuming app pass licenses, the number of users the app has been shared with, and the number of users who have opened the app using per app licenses is displayed. |
| Download | Downloads the information in CSV format. Select a specific license type to start the download. After a CSV file is generated, you can download the same file again within five days without having to start a new download. The download process is asynchronous, which allows you to start the download and return after a few minutes to monitor its progress. |

### Power Automate licensing summary

Use the following options in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to view the license consumption information for Power Automate:

- New admin center: Select **Licensing** on the navigation pane, and select **Power Automate** under **Products**.
- Classic admin center: On the **Licenses** > **Summary** page, select **Power Apps** under **Summaries**.

The license consumption information can be viewed by Power Platform admin and Dynamics 365 admins roles.

The **Power Automate licensing summary** section provides details of how many Power Automate licenses have been purchased, assigned, and consumed in your entire tenant. It provides details of which flow runs are consuming licenses. 

The **Attention needed** section provides a summary count of flows requiring licensing attention in your entire tenant.

| Setting | Description |
| ------- | ----------- |
| **Power Automate licensing overview** | The number of users and the summary count of flows actively using licenses by virtue of flow run in your tenant in the last 30 days. This section also provides details of how many Power Automate licenses have been available and how many of those licenses have been assigned to users. |
| License type | The type of license, such as Dynamics 365, Microsoft 365, Power automate per flow, Power Apps premium, pay-as-you-go, trial, or developer that the actual license is mapped to. |
| Active users | The number of unique users who opened apps in any of the environments in your tenant at least once in the last 30 days. |
| Unique flow count | The number of unique flow which are run in your tenant at least once in the last 30 days. |
| Assigned licenses | The number of unique users who have been assigned a license.|
| Purchased licenses | The number of Power Automate licenses available for your tenant. |
| Usage details for a license type | Select a license type in the **Power Automate licensing overview** section to view a list of the users and the list of flows consuming a specific license type. |
| Email | The email ID or user principal name (UPN) of the user who ran the flow  in any of the environments. Select the email link to get a list of all flows ran by the user. |
| Flow name | The name of the flow which was run. Select the flow link to get details of the flow.|
| Last run  date | The date when the flow was last run. |
| License | The license SKU. |
| Premium features | Indicates if the flow is using any premium features. |
| Flow type | Type of flow: scheduled or manual.  |
| Download | Downloads the information in CSV format. Select a specific license type to start the download. After a CSV file is generated, you can download the same file again within five days without having to start a new download. The download process is asynchronous, which allows you to start the download and return after a few minutes to monitor its progress. |
| **Attention needed** | A summary count of flows requiring licensing attention comprises: <ul><li>List of flow not having an owner.</li><li>Standalone, premium flows utilizing standard or expired licenses.</li><li>Out-of-context flows, for instance, premium flows utilizing Power Apps, Microsoft Copilot Studio, or Dynamics 365 licenses but not operating within the context of Power Apps, Microsoft Copilot Studio, or Dynamics 365.</li></ul> To delve into the specifics of flows necessitating licensing attention, choose an item from the **Attention needed** section or select **View details**.  |

## Environments tab

The **Environments** tab on the **Licenses** page displays licensing information from the last 30 days for the selected environment.

| Setting | Description |
| ------- | ----------- |
| Select environment | Select the environment for which you want to view license consumption. |
| Product | Select the product (Power Apps or Power Automate) for which you want to view license consumption. |

### Power Apps

| Setting | Description |
| ------- | ----------- |
| **Power Apps licensing overview** | The number of users actively using licenses in the last 30 days, and whether any actions are recommended. If you change a standard environment to a Managed Environment, any users who open an app with only a Microsoft 365 license will require a standalone Power Apps license to run the app. |
| License type | The type of license—Dynamics 365, Microsoft 365, per app, per user, pay-as-you-go, trial, or developer—the actual license is mapped to. |
| Active users | The number of unique users who opened apps in the environment at least once in the last 30 days. |
| Recommended actions | Actions to consider to convert the environment to a Managed Environment. |
| Usage details for a license type | Select a license type in the **Power Apps licensing overview** section to view a list of the users who are consuming a specific license type. |
| Email | The email ID or user principal name (UPN) of the user who launched an app in the selected environment. Includes a list of users with whom an app is shared and whether the app is installed in the environment. Select the email link to open the Microsoft 365 admin portal. |
| License | The license SKU. |
| Last active date | The date when a selected app was last opened by a user in a selected time. |
| **License Type: Power App Per App** | If the selected environment has per-app licenses assigned, a list of apps consuming app pass licenses, the number of users the app has been shared with, and the number of users who have opened the app using per-app licenses. |
| Download | Downloads the information in CSV format. Select a specific license type to start the download. After a CSV file is generated, you can download the same file again within five days without having to start a new download. |

### Power Automate

| Setting | Description |
| ------- | ----------- |
| **Power Automate licensing overview** | The number of users and flows actively using Power Automate licenses in the last 30 days, based on flow execution and whether any actions are recommended. |
| License type | The type of license—Dynamics 365, Microsoft 365, Power Automate per flow, per user, pay-as-you-go, trial, or developer—the actual license is mapped to. |
| Active users | The number of unique users who executed flows in the environment at least once in the last 30 days. |
| Unique flow count | The number of unique flows executed in the environment at least once in the last 30 days. |
| Recommended actions | Actions to consider to convert the environment to a Managed Environment. |
| **Usage details for a license type** | Select a license type in the **Power Automate licensing** section to view a list of the users who are consuming a specific license type. |
| Email | The email ID or UPN of the user who executed flows in the selected environment. Select a user to see a list of all the flows executed by the user in the selected environment. |
| Flow name | Name of the flow executed, which links to the flow detail page. |
| License | The license SKU. |
| Date last run | The date when the flow was last executed. |
| Premium feature | Indicates if a premium feature, such as a premium connector, custom connector, or Dataverse connector, was used in the flow. |
| Flow type | Indicates if the flow is scheduled, instant, or automated. |
| Download | Downloads the information in CSV format. Select a specific license type to start the download. After a CSV file is generated, you can download the same file again within five days without having to start a new download. |
| Attention needed | Summary count of flows requiring licensing attention, which includes: </br><ul></br><li>List of flow not having an owner.</li></br><li>Standalone, Premium flow using standard or expired licenses.</li></br><li>Out of Context flow, such as Premium flows using Power Apps, Microsoft Copilot Studio, or Dynamics 365 licenses but not running in the context of Power Apps, Microsoft Copilot Studio, or Dynamics 365.</li></br></ul> |

## Other ways to view licensing pages

- **Managed Environments**: Select **View licensing details** on the **Enable Managed Environments** page.
- **Standard environments**: You can see an alert about license requirements for users with only Microsoft 365 licenses.
