---
title: View license consumption for Power Apps and Power Automate (preview)
description: Learn how to view your organization's Power Apps license consumption and find potential license issues. 
author: amiyapatr-zz
ms.date: 11/07/2023
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: ampatra
ms.custom: bap-template
search.audienceType: 
 - admin
---

# View license consumption for Power Apps and Power Automate (preview)

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use the **Billings (preview)** > **Licenses (preview)** page in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to monitor the consumption of your organization's Power Apps licenses and easily spot environments that might have licensing issues. Get answers to questions like these:

- How many Power Apps licenses are purchased?
- How many of those Power Apps licenses are assigned to users? 
- What types of licenses are being used to launch apps?
- What licenses are being used to execute flows?
- How many users are actively consuming Power Apps or Power Automate licenses in a specific environment?
- Who are the users actively consuming Power Apps or Power Automate licenses?
- Are there users in my environment who need standalone Power Apps or Power Automate licenses?
- Which flows are out of compliance?

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available in your region yet.

## Summary tab

The **Summary** tab on the **Licenses (preview)** page displays a summary of any environments in your tenant that require licensing attention.

| Setting | Description |
| ------- | ----------- |
| Include standard environments | Select this option to view results for standard, or unmanaged, environments. By default, only Managed Environments are displayed. In Managed Environments, all users need standalone Power Apps or Power Automate licenses to run apps or execute flows. |
| Environments requiring attention | The number of environments that have a licensing issue and need your attention. |
| Environment | A list of environments that have a licensing issue. |
| License issues | The number of licensing issues for an environment. |

### Power Apps licensing summary 
From the **Product** dropdown list, select **Power Apps** to view license consumption information for Power Apps.

The **Power Apps licensing summary** section provides details of how many Power Apps licenses have been purchased, how many of those licenses are assigned, and how many of those licenses are being actively used. This view is available for users with global admin, Power Platform admin, and Dynamics 365 admins roles.

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

## Environments tab

The **Environments** tab on the **Licenses (preview)** page displays licensing information from the last 30 days for the selected environment.

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
| Attention needed | Summary count of flows requiring licensing attention, which includes: </br><ul></br><li>List of flow not having an owner.</li></br><li>Standalone, Premium flow using standard or expired licenses.</li></br><li>Out of Context flow, such as Premium flows using Power Apps, Power Virtual Agents, or Dynamics 365 licenses but not running in in the context of Power Apps, Power Virtual Agents, or Dynamics 365.</li></br></ul> |

## Other ways to view licensing pages

- **Managed Environments**: Select **View licensing details** on the **Enable Managed Environments** page.
- **Standard environments**: You'll see an alert about license requirements for users with only Microsoft 365 licenses.
