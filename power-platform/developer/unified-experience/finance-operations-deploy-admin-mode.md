---
title: "Manage administration mode in a unified developer environment"
description: "Learn how to review administration mode failures and deploy packages to an OnlineDev unified developer environment in administration mode."
author: pmb1816
ms.date: 09/03/2026
ms.topic: how-to
ms.reviewer: pehecke
ms.author: prbhansali
ms.subservice: developer
---

# Manage administration mode in a unified developer environment

Use administration mode with an OnlineDev unified developer environment (UDE) for finance and operations apps to control access while you perform maintenance or recovery tasks.

## What you can do in administration mode

- Enable or disable administration mode from the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
- Review environment operation history when enabling or disabling administration mode, or other environment operations, fail.
- Deploy a package to an OnlineDev/UDE environment in administration mode without first disabling administration mode.

## Reviewing failures for administration mode issues

If enabling or disabling administration mode fails, use the environment history in the Power Platform admin center to confirm when the operation ran, who started it, and whether it succeeded or failed. This view provides timeline information and might not include detailed diagnostic logs.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select the OnlineDev/UDE environment.
1. On the command bar, select **History**.
1. Find the failed administration mode operation, and review the action name, start time, end time, initiated by, and status.

For detailed logs for package deployment, database synchronization, or other finance and operations operations, use the **Finance and Operation Package Manager App** in your Dataverse organization:

1. Sign in to the Dataverse organization.
1. Find and open **Finance and Operation Package Manager App**.
1. In the left pane, select **Operation History**.
1. Select the relevant **Operation Name**, and download the operation logs (`operationlogs.zip`).

For more information about operation logs and the information to provide Microsoft Support, see [FAQs for the Power Platform unified developer experience](finance-operations-faq.md#checking-logs-and-history).

## Deploying packages in administration mode

You can deploy a package to an OnlineDev/UDE environment in administration mode without first disabling administration mode. This deployment path is code-only: it automatically skips the associated database synchronization (DB sync) step for this recovery scenario.

This change applies to OnlineDev/UDE environments in administration mode. It doesn't change deployment behavior for standard sandbox or production finance and operations environments.

### How package deployment helps you recover

If an OnlineDev/UDE environment gets stuck in administration mode because an issue in a package or schema causes checks to fail (for example, a bad customization or a metadata/schema inconsistency), you no longer need to wait for the environment to exit administration mode before deploying a fix:

1. Deploy an updated package containing your fix by using the normal **Dynamics 365** > **Deploy** > **Deploy models ...** dialog, or your usual project or solution deploy action, while the environment is still in administration mode.
1. After you deploy the corrected package, retry disabling administration mode for the environment from the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. If the package fixes the issue that caused the checks to fail, the environment returns to a healthy state instead of remaining stuck in administration mode when you exit admin mode.

By using this change, you can deploy the package that contains the fix before retrying to exit administration mode. This change can unblock recovery for common package or schema issues without waiting for support to deploy the fix.

## See also

[Administration mode](../../admin/admin-mode.md)  
[Workflow to write, deploy, debug, and troubleshoot X++ code across multiple environments](finance-operations-innerloop.md)  
[Write, deploy, and debug X++ code](finance-operations-debug.md)  
[Unified developer experience for finance and operations apps](finance-operations-dev-overview.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
