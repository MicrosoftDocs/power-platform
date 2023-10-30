---
title: Solution checker enforcement in Managed Environments (preview)
description: Learn about using solution checker enforcement to automatically prevent security and reliability validations during solution import.
ms.topic: conceptual
ms.date: 10/30/2023
author: sidhartg
ms.author: sidhartg
ms.reviewer: sericks
ms.subservice: admin
ms.custom: 
search.audienceType:
- admin
contributors:
- JesseParsons

---

# Solution checker enforcement in Managed Environments (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can use [solution checker](/power-apps/maker/data-platform/use-powerapps-checker) in Managed Environments to enforce rich static analysis checks on your solutions against a set of best practice rules and identify problematic patterns.

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

To enable solution checker enforcement for your Managed Environment:

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).
1. In the navigation pane, select **Environments**, and then select a managed environment.
1. On the command bar, select **Edit Managed Environments**, and then select the appropriate setting under **Solution checker enforcement**.

    :::image type="content" source="media/managed-environment-solution-checker.png" alt-text="Screenshot of the solution checker settings screen.":::

## Solution checker settings

Select one of the following settings:

| Setting | Description |
| --- | --- |
| None |  Turns off the automatic solution validations during solution import. There aren't any experience or behavioral changes to solution authoring, exports, or imports. |
| Warn |  All custom solutions are automatically verified during solution import. When a solution with highly-critical issues is being imported, you are warned about the action but the import itself continues, and if everything else with the import is fine, the solution is imported into the environment. After a successful import, a message stating that the imported solution had validation issues is shown. Additionally, a summary email is sent with details of the solution validation. |
| Block | All custom solutions are automatically verified during solution import. When a solution has highly-critical issues, the import process is canceled, and a message stating that the imported solution had validation issues is shown. This happens before the actual import, so there aren't any changes to the environment due to the import failure. Additionally, a summary email is sent with details of the solution validation.|

For more information on what to do when encountering a warn or block, see the [troubleshooting guide](/troubleshoot/power-platform/power-apps/manage-apps-and-solutions/solution-checker-enforcement-import-issues).

## Email messages to the admin

When the validation mode is set to **Warn** or **Block**, a summary email is sent when a solution is imported or blocked. When the solution is imported into an environment, the summary email shows the count of issues by severity in the solution.

The email is sent to all users with the roles of [Power Platform administrator](use-service-admin-role-manage-tenant.md#power-platform-administrator) and [Dynamics 365 service administrator](use-service-admin-role-manage-tenant.md#dynamics-365-administrator). It is also sent to recipients of the [weekly digest emails](managed-environment-usage-insights.md#who-can-receive-the-weekly-digest).

### Suppress validation emails

By default, emails are sent when a solution fails validation for medium and above severities. When the checkbox is selected, emails aren't sent in warn mode. Emails aren't sent in block mode, as well, except for critical violations which block solution import.

:::image type="content" source="media/managed-environment-solution-checker-checkbox.png" alt-text="Screenshot of the solution checker email checkbox.":::

## Rule exclusions

You can select to exclude solution checker rules from enforcement. For example, a particular rule might take significant time and effort to fix across the solution, but you would still like the rest of the rules to be enforced. Use the **Excluded Rules** dropdown list to select the rules to exclude from enforcement.

:::image type="content" source="media/managed-environment-solution-checker-rule-exclusions.png" alt-text="Screenshot of the solution checker enforcement rule exclusions.":::

The list contains rule names and descriptions grouped by category and sorted by severity. As a reminder, only critical severity rules block a solution from being imported.

:::image type="content" source="media/managed-environment-solution-checker-rule-exclusions-list.png" alt-text="Screenshot of the solution checker enforcement rule exclusion options.":::

## Use PowerShell to enable solution checker enforcement

You can use PowerShell to enable solution checker enforcement.

### Enable solution checker enforcement in block mode

Here's an example PowerShell script that enables solution checker enforcement in block mode. After you run it, the slider shows block mode in the **Solution checker** section of the Managed Environments settings.

```powershell
SetManagedEnvironmentSolutionCheckerEnforcementLevel -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Level block
```

### Enable solution checker enforcement in warn mode

Here's an example PowerShell script that enables solution checker enforcement in warn mode. After you run it, the slider shows warn mode in the **Solution checker** section of the Managed Environments settings.

```powershell
SetManagedEnvironmentSolutionCheckerEnforcementLevel -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Level warn
```

### Turn off solution checker enforcement

Here's an example PowerShell script that turns off solution checker enforcement. After you run it, the slider shows **Off** in the **Solution checker** section of the Managed Environments settings.

```powershell
SetManagedEnvironmentSolutionCheckerEnforcementLevel -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Level none
```

### See also

[Managed Environments overview](managed-environment-overview.md) <br />
[Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)  <br />
[Solution checker enforcement in Managed Environments (preview) blocks or warns on import](/troubleshoot/power-platform/power-apps/manage-apps-and-solutions/solution-checker-enforcement-import-issues)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
