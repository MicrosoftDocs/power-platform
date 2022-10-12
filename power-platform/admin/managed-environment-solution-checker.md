---
title: Solution checker (preview)
description: Learn about using solution checker to automatically run security and reliability validations during solution import.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/12/2022
author: sidhartg
ms.author: sidhartg 
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
# Solution checker (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can use [Solution checker](/power-apps/maker/data-platform/use-powerapps-checker) to perform rich static analysis checks on your solutions against a set of best practice rules and identify problematic patterns. 

[Jim: Hazim recommended highlighting the difference between the standard solution checker and the ME version. Need text from Sid or Hazim.]

To enable the solution checker, in the navigation pane, select **Environments**, select a managed environment. On the command bar, select **Edit Managed Environments**, and then select the settings under **Solution checker**. 

:::image type="content" source="media/managed-environment-solution-checker.png" alt-text="Screenshot of the solution checker settings screen.":::

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Solution checker settings

| Setting | Description |
| --- | --- |
| **[Solution checker](/power-apps/maker/data-platform/use-powerapps-checker)** | Automatically run security and reliability validations during solution import. |
| None |  This setting turns off the automatic solution validations during solution import. There won't be any experience or behavioral changes to solution authoring, exports, or imports. |
| Warn |  All custom solutions are automatically validated during solution import. When a solution with high-critical issue(s) is being imported, you'll be warned about the action but the import itself will proceed and, if everything else with the import is fine, the solution will be imported into the environment. After a successful import, a message is shown with a link to view the validated report. Additionally, Power Platform environment admins will receive a summary email with details of the solution validation. |
| Block | All custom solutions are automatically validated during solution import. When a solution has high-critical issue(s), the import process will be cancelled and a message is shown with a link to view the validated report. This happens before the actual import, so there won't be any changes to the environment due to the import failure. Additionally, Power Platform environment admins will receive a summary email with details of the solution validation. |

## Email messages to the admin 

When the validation mode is set to "Warn" or "Block", Power Platform admins of the environment will receive summary emails when a solution is imported. The contents of the email differ depending on the way solution was checked. 

Solutions checked from the Power Apps maker portal will have the results stored in the environment. When this solution is imported into an environment, admins of this environment will get a link to these results in the summary email. 

Solutions checked from the Power Platform Build tools will have the results returned as a downloadable file of the Power Apps Checker build task. When this solution is imported into an environment, environment admins will only be able to see the count of issues in the solution in the summary email. The summary email in this case will not have a link to the results.  

### See also
[Solution checker](/power-apps/maker/data-platform/use-powerapps-checker)  </br >
[Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)  
[Managed Environments overview](managed-environment-overview.md)  <br />
[Enable Managed Environment](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Sharing limits](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)  <br />
[Licensing](managed-environment-licensing.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md) 


[!INCLUDE[footer-include](../includes/footer-banner.md)]
