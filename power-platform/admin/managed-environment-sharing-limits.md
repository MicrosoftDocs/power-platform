---
title: Limit sharing 
description: Limit how broadly makers can share canvas apps in your managed environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/12/2022
author: mikferland-msft 
ms.author: miferlan
ms.reviewer: jimholtz
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Limit sharing 

<!-- https://go.microsoft.com/fwlink/?linkid=2194484 and 2211538 -->

In Managed Environments, admins can limit how broadly users can share canvas apps. To configure these rules, select a Managed Environment from the environments list in the Power Platform admin center. Then, select **Edit Managed Environments** in the command bar. The sharing rules are located in the **Limit sharing** section.

:::image type="content" source="media/managed-environment-limit-sharing.png" alt-text="Screenshot of an Edit Environment Management settings screen, with Limit sharing highlighted.":::

## Sharing rules

| Sharing rules | System behavior when selected |
| --- | --- |
| Don't set limits | Select to not limit sharing canvas apps. |
| Exclude sharing with security groups | Select if users aren't allowed to share canvas apps with any security groups or with everyone. |
| Limit total individuals who can be shared to | If **Exclude sharing with security groups** is selected, you can control the maximum number of users to whom a canvas app can be shared with. |

> [!NOTE]
> Sharing rules are enforced when users try to share an app. Sharing rules don't change who an app has already been shared with.
>
> After sharing rules are set in the Power Platform admin center, it may take up to an hour for them to start getting enforced.
>
> Sharing rules in Dataverse for Teams environments do not impact sharing to a Team when you select **Publish to Teams**. However, when a user attempts to share with individuals or groups in a Team other than the one bound to the environment, the sharing limits are enforced. 

If a user tries to share a canvas app that **does not** respect the sharing rules, they will be informed as depicted below.

:::image type="content" source="media/managed-environment-canvas-app-sharing-rule.png" alt-text="Screenshot of a message when canvas app doesn't respect sharing rule.":::

## Surface your organization’s governance error content 
If you specify governance error message content to appear in error messages, it will be included in the error message displayed to users. See: [PowerShell governance error message content commands](powerapps-powershell.md#governance-error-message-content-commands).

### See also
[Managed Environments overview](managed-environment-overview.md) <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md) <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md) 



[!INCLUDE[footer-include](../includes/footer-banner.md)]
