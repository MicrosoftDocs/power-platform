---
title: Use solution checker in Managed Environments (preview)
description: Learn about using solution checker to automatically run security and reliability validations during solution import.
ms.topic: conceptual
ms.date: 12/01/2022
author: sidhartg
ms.author: sidhartg
ms.reviewer: Kumarvivek
ms.subservice: admin
ms.custom: 
search.audienceType:
- admin
search.app:
- D365CE
- PowerApps
- Powerplatform
- Flow

---

# Use solution checker in Managed Environments (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can use [solution checker](/power-apps/maker/data-platform/use-powerapps-checker) in Managed Environments to perform rich static analysis checks on your solutions against a set of best practice rules and identify problematic patterns.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

To enable the solution checker for your Managed Environment:

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).
1. In the navigation pane, select **Environments**, and then select a managed environment.
1. On the command bar, select **Edit Managed Environments**, and then select the appropriate setting under **Solution checker**.

    :::image type="content" source="media/managed-environment-solution-checker.png" alt-text="Screenshot of the solution checker settings screen.":::

## Solution checker settings

Select one of the following settings:

| Setting | Description |
| --- | --- |
| None |  This setting turns off the automatic solution validations during solution import. There won't be any experience or behavioral changes to solution authoring, exports, or imports. |
| Warn |  All custom solutions are automatically validated during solution import. When a solution with high-critical issue(s) is being imported, you'll be warned about the action but the import itself will proceed and, if everything else with the import is fine, the solution will be imported into the environment. After a successful import, a message is shown with a link to view the validated report. Additionally, Power Platform environment admins will receive a summary email with details of the solution validation. |
| Block | All custom solutions are automatically validated during solution import. When a solution has high-critical issue(s), the import process will be cancelled, and a message is shown with a link to view the validated report. This happens before the actual import, so there won't be any changes to the environment due to the import failure. Additionally, Power Platform environment admins will receive a summary email with details of the solution validation. |

## Email messages to the admin

When the validation mode is set to **Warn** or **Block**, Power Platform admins will receive summary emails when a solution is imported. The contents of the email differ depending on the way solution was checked.

Solutions checked from Power Apps [(make.powerapps.com](https://make.powerapps.com)) will have the results stored in the environment. When this solution is imported into an environment, admins of this environment will get a link to these results in the summary email.

Solutions checked from the [Power Platform Build Tools](/power-platform/alm/devops-build-tools) will have the results returned as a downloadable file of the Power Apps Checker build task. When this solution is imported into an environment, environment admins will only be able to see the count of issues in the solution in the summary email. The summary email in this case won't have a link to the results.  

### See also

[Managed Environments overview](managed-environment-overview.md) <br />
[Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)  

[!INCLUDE[footer-include](../includes/footer-banner.md)]
