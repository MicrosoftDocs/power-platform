---
title: "Deploy packages to a unified developer environment in administration mode"
description: "Learn how to deploy a package to an OnlineDev unified developer environment in administration mode and use a package fix to unblock environment recovery."
author: pmb1816
ms.date: 08/26/2026
ms.topic: how-to
ms.reviewer: pehecke
ms.author: prbhansali
ms.subservice: developer
---

# Deploy packages to a unified developer environment in administration mode

You can now deploy packages to an OnlineDev environment in administration mode.

## What changed

- You can deploy a package to an OnlineDev/UDE environment in administration mode without first disabling administration mode.
- This deployment path is code-only: it automatically skips the associated database synchronization (DB sync) step for this recovery scenario.
- This change applies to OnlineDev/UDE environments in administration mode. It doesn't change deployment behavior for standard sandbox or production finance and operations environments.

## How this change helps you

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
