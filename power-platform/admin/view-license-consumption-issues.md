---
title: View license consumption (preview)
description: Learn how to view your organization's Power Apps license consumption and find potential license issues. 
author: amiyapatr-zz
ms.date: 04/14/2023
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: ampatra
ms.custom: bap-template
search.audienceType: 
 - admin
---

# View license consumption (preview)

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use the **Billings (preview)** > **Licenses (preview)** page in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to monitor the consumption of your organization's Power Apps licenses and easily spot environments that might have licensing issues. Get answers to questions like these:

- What types of licenses are being used to launch apps?
- How many users are actively consuming Power Apps licenses in a specific environment?
- Who are the users who are actively consuming Power Apps licenses?
- Are there users in my environment who need standalone Power Apps licenses?

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Overview tab

The **Overview** tab on the **Billings (preview)** > **Licenses (preview)** page displays a summary of any environments in your tenant that require licensing attention.

| Setting | Description |
| ------- | ----------- |
| Include standard environments | Select this option to see results for standard, or unmanaged, environments. By default, only managed environments are displayed. In managed environments, all users need standalone Power Apps licenses to run apps. |
| Environments requiring attention | The number of environments that have a licensing issue and need your attention |
| Environment | A list of environments that have a licensing issue |
| License issues | The number of licensing issues an environment has |
| Recommended actions | A list of possible actions to resolve the licensing issues |

## Environment tab

The **Environment** tab on the **Billings (preview)** > **Licenses (preview)** page displays licensing information from the last 30 days for the selected environment.

| Setting | Description |
| ------- | ----------- |
| Select environment | Select the environment for which you want to view license consumption. |
| **Power Apps licensing overview** | The number of users actively using licenses in the last 30 days and whether any actions are recommended. If you change a standard environment to a managed environment, any users who open an app with only a Microsoft 365 license require a standalone Power Apps license to run the app. |
| License type | The type of license&mdash;Dynamics 365, Microsoft 365, per app, per user, pay-as-you-go, trial, or developer&mdash;the actual license is mapped to. |
| Active users | The number of unique users who opened apps in the environment at least once in the last 30 days. |
| Recommended actions | Actions to consider to convert the environment to a managed environment. |
| Usage details for a license type | Select a license type in the **Power Apps licensing overview** section to view a list of the users who are consuming a specific license type. |
| Email | The email ID or UPN <!-- EDITOR'S NOTE: Spell out abbreviations on first mention. --> of the user who launched an app in the selected environment. Includes a list of users with whom an app is shared and whether the app is installed in the environment. Select the email link to open the Microsoft 365 admin portal. |
| License | The license SKU |
| Last active date | The date when a selected app was last opened by a user in a selected time. |
| **License Type: Power App Per App** | If the selected environment has per-app licenses assigned, a list of apps consuming app pass licenses, the number of users the app has been shared with, and the number of users who have opened the app using per-app licenses |
| Download | Downloads the information in CSV format. Select a specific license type to start the download. After a CSV file is generated, you can download the same file again within five days without having to start a new download. |

## Other ways to view licensing pages

- Managed environments: Select **View licensing details** on the **Enable Managed Environments** page.
- Standard environments: You'll see an alert about license requirements for users with only Microsoft 365 licenses.

To change a standard environment to managed, select [**Enable Managed Environments**](managed-environment-enable.md).
