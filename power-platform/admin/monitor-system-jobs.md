---
title: Monitor system jobs
description: Learn how to monitor system jobs in the Power Platform admin center.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 02/20/2026
author: sericks007
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Monitor system jobs

Several features use system jobs to perform tasks automatically, including workflows, import, and duplicate detection, running independently or in the background. You can monitor them to ensure that they run smoothly or complete successfully.

For Unified Interface, in the upper-right corner, select **Settings** > **Advanced Settings** > **Settings**.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** in the navigation pane.
1. In the **Manage** pane, select **Environments**. Then select an environment.
1. Select **Settings** > **Audit and logs** > **System jobs** to see a grid view of system jobs.

If there's a problem with a system job, you can cancel, postpone, pause, or resume it. Select a job and then select the **Actions** menu.
  
- **Canceling system jobs**
  
     You can't resume a canceled system job.
  
- **Postponing completion of system jobs**
  
     Postponing an active system job stops any current and subsequent actions. You can specify a later time when you want the system job to restart.
  
- **Pausing system jobs**
  
     You can resume a paused system job.
  
- **Resuming paused system jobs**
  
     Resuming restarts a system job that was paused.
  
> [!TIP]
>
> 1. If a system job fails, you can view the details about what steps failed and what the problems were. First, open the system job record. To display details about system job failures, move your pointer over the warning symbols.
> 2. To view system job failures in a format that you can print or copy and paste, select the **Print** button.

> [!NOTE]
> You can't make changes to the status of a system job that is completed or canceled.

## Related content
[Asynchronous service](/power-apps/developer/data-platform/asynchronous-service?tabs=webapi) <br>
[Delete completed system jobs and process log to comply with retention policy](cleanup-asyncoperationbase-table.md) <br>
[Review the status of bulk delete job](delete-stub-users.md#review-the-status-of-bulk-delete-job)
