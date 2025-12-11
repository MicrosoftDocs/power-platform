---
title: View license consumption for Power Automate (preview)
description: Learn how to view your organization's Power Automate license consumption and find potential license issues. 
author: amiyapatr-zz
ms.date: 12/04/2025
ms.reviewer: sericks
ms.topic: concept-article
ms.subservice: admin
ms.author: ampatra
search.audienceType: 
 - admin
---

# View license consumption for Power Automate (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

The Power Automate license consumption experience in the Power Platform admin center lets admins track and manage licensing for Power Automate. It helps answer key questions such as: 

- How many Power Automate licenses are purchased? 
- How many of those licenses are assigned to users? 
- How many users are actively consuming Power Automate? 
- Who are the users actively consuming Power Automate? 
- Are there users who need standalone Power Automate licenses?

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## View summary information 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com). 
1. On the navigation pane, select **Licensing**. 
1. In the **Licensing** pane, under **Products**, select **Power Automate**. 
1. Select the **Summary** tab.

## Power Automate licensing summary

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
| Product | Select Power Automate from the list of products to view license consumption for Power Automate. |

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
