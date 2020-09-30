---
title: "Monitor and manage system jobs | MicrosoftDocs"
description: Monitor and manage system jobs
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/30/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Monitor and manage system jobs

Several features use system jobs to perform tasks automatically, including workflows, import, and duplicate detection, running independently or in the background.  
  
 You can monitor them to ensure that they run smoothly or have completed successfully. In the Power Platform admin center, select an environment. Go to **Settings** > **Audit and logs** > **System Jobs** to see a grid view of system jobs.
  
## Monitoring system jobs  
 If there is a problem with a system job, you can cancel, postpone, pause, or resume it. Select a job and then select the **Actions** menu.
  
- **Canceling system jobs**  
  
     You cannot resume a canceled system job.  
  
- **Postponing completion of system jobs**  
  
     Postponing an active system job stops any current and subsequent actions. You can specify a later time when you want the system job to restart.  
  
- **Pausing system jobs**  
  
     You can resume a paused system job.  
  
- **Resuming paused system jobs**  
  
     Resuming restarts a system job that was paused.  
  
  > [!TIP]
  > 1. If a system job fails, you can view the details about what steps failed and what the problems may have been.  First, open the system job record.  To display details about system job failures, move your pointer over the warning symbols.  
  > 2.  To view system job failures in a format that you can print or copy and paste, select the **Print** button.  
  
> [!NOTE]
> You cannot make changes to the status of a system job that has been completed or canceled.

### See also

[Asynchronous processing of cascading transactions](async-cascading.md)
