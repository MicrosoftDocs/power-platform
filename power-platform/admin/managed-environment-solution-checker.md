---
title: Solution checker enforcement in Managed Environments
description: Learn about using solution checker enforcement to automatically prevent security and reliability validations during solution import.
ms.topic: concept-article
ms.date: 11/20/2024
author: sidhartg
ms.author: sidhartg
ms.reviewer: sericks
ms.subservice: admin
ms.custom: 
search.audienceType:
- admin
contributors:
- JesseParsons
- TYLEROL 

---

# Solution checker enforcement in Managed Environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The solution checker is a powerful tool that performs a comprehensive static analysis of your solution objects against a set of best practice rules. By using solution checker, you can quickly identify problematic patterns in solution components and receive detailed reports that highlight issues, affected components, and provide links to documentation on how to resolve each issue.

Administrators can use solution checker to enforce checks to identify problematic patterns on solutions when the solution is imported in the Managed Environment.

## Solution checker settings

When you turn on solution checker for a Managed Environment, there are different levels to choose from that are enforced during solution import.

| Setting | Description |
| --- | --- |
| **None** |  Turns off the automatic solution validations during solution import. There aren't any experience or behavioral changes to solution authoring, exports, or imports. |
| **Warn** |  All custom solutions are automatically verified during solution import. When a solution with highly-critical issues is being imported, you're warned about the action but the import itself continues, and if everything else with the import is fine, the solution is imported into the environment. After a successful import, a message stating that the imported solution had validation issues is shown. Additionally, a summary email is sent with details of the solution validation. |
| **Block** | All custom solutions are automatically verified during solution import. When a solution has highly-critical issues, the import process is canceled, and a message stating that the imported solution had validation issues is shown. This happens before the actual import, so there aren't any changes to the environment due to the import failure. Additionally, a summary email is sent with details of the solution validation.|

For more information on what to do when encountering a warn or block, see the [troubleshooting guide](/troubleshoot/power-platform/power-apps/manage-apps-and-solutions/solution-checker-enforcement-import-issues).

For more information about solution checker and the list of rules used, go to [Solution checker overview](/power-apps/maker/data-platform/use-powerapps-checker).

## Turn on solution checker in a Managed Environment

To turn on solution checker enforcement for your Managed Environment:

1. Sign in to the [Power Platform admin center](https://aka.ms/ppac).
1. In the navigation pane, select **Environments**, and then select a managed environment.
1. On the command bar, select **Edit Managed Environments**, and then select the appropriate [enforcement setting](#solution-checker-settings) under **Solution checker enforcement**.

    :::image type="content" source="media/managed-environment-solution-checker.png" alt-text="Screenshot of the solution checker settings screen.":::

> [!NOTE]
> Solution checker enforcement is [not available](/power-apps/maker/data-platform/common-issues-resolutions-solution-checker#solution-checker-cant-access-environments-in-administration-mode) when the environment is in the [Administration mode](admin-mode.md).

## Email messages to the admin

When the validation mode is set to **Warn** or **Block**, a summary email is sent when a solution is imported or blocked. When the solution is imported into an environment, the summary email shows the count of issues by severity in the solution. The contents of the email may include a link to the solution analysis results. In some instances, the link to the results may have expired. To get new results, submit the solution to solution checker.

Solutions checked from Power Apps [make.powerapps.com](https://make.powerapps.com) have the results stored in the source environment. Solutions imported to an environment with solution checker enforcement turned on may have results stored in the target, import environment.

The email is sent to all users with the roles of [Power Platform administrator](use-service-admin-role-manage-tenant.md#power-platform-administrator) and [Dynamics 365 service administrator](use-service-admin-role-manage-tenant.md#dynamics-365-administrator). It's also sent to recipients of the [weekly digest emails](managed-environment-usage-insights.md#who-can-receive-the-weekly-digest).

### Suppress validation emails

By default, emails are sent when a solution contains medium and above severities. When the checkbox is selected, emails aren't sent in warn mode. Emails aren't sent in block mode, as well, except for critical violations which block solution import.

:::image type="content" source="media/managed-environment-solution-checker-checkbox.png" alt-text="Screenshot of the solution checker email checkbox.":::

## Rule exclusions

You can select to exclude solution checker rules from enforcement. For example, a particular rule might take significant time and effort to fix across the solution, but you would still like the rest of the rules to be enforced. Use the **Excluded Rules** dropdown list to select the rules to exclude from enforcement.

:::image type="content" source="media/managed-environment-solution-checker-rule-exclusions.png" alt-text="Screenshot of the solution checker enforcement rule exclusions.":::

The list contains rule names and descriptions grouped by category and sorted by severity. As a reminder, only critical severity rules block a solution from being imported.

:::image type="content" source="media/managed-environment-solution-checker-rule-exclusions-list.png" alt-text="Screenshot of the solution checker enforcement rule exclusion options.":::

## Use PowerShell to turn on solution checker enforcement

You can use PowerShell to turn on solution checker enforcement. These functions are defined in the [PowerApps-Samples repo](https://github.com/microsoft/PowerApps-Samples/blob/master/powershell/admin-center/Microsoft.PowerApps.Administration.PowerShell.Samples.psm1), which must be imported before invoking.

### Turn on solution checker enforcement in block mode

Here's an example PowerShell script that turns on solution checker enforcement in block mode. After you run it, the slider shows block mode in the **Solution checker** section of the Managed Environments settings.

```powershell
SetManagedEnvironmentSolutionCheckerEnforcementLevel -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Level block
```

### Turn on solution checker enforcement in warn mode

Here's an example PowerShell script that turns on solution checker enforcement in warn mode. After you run it, the slider shows warn mode in the **Solution checker** section of the Managed Environments settings.

```powershell
SetManagedEnvironmentSolutionCheckerEnforcementLevel -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Level warn
```

### Turn off solution checker enforcement

Here's an example PowerShell script that turns off solution checker enforcement. After you run it, the slider shows **Off** in the **Solution checker** section of the Managed Environments settings.

```powershell
SetManagedEnvironmentSolutionCheckerEnforcementLevel -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Level none
```

### Set rule exclusions

Here's an example PowerShell script that turns on solution checker enforcement in block mode and adds rule exclusions. After you run it, the slider shows block mode in the **Solution checker** section of the Managed Environments settings, and the rule exclusions are set.

```powershell
SetManagedEnvironmentSolutionCheckerEnforcementLevel -EnvironmentId 8d996ece-8558-4c4e-b459-a51b3beafdb4 -Level none -RuleExclusions "web-use-async,web-use-offline"
```

### Related content

[Managed Environments overview](managed-environment-overview.md) <br />
[Import solutions](/power-apps/maker/data-platform/import-update-export-solutions)  <br />
[Solution checker enforcement in Managed Environments blocks or warns on import](/troubleshoot/power-platform/power-apps/manage-apps-and-solutions/solution-checker-enforcement-import-issues)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
