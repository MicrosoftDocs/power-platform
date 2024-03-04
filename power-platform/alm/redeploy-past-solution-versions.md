---
title: Redeploy past solution versions
description: Learn how to redeploy past solution versions using pipelines.
author: asheehi1
ms.author: matp
ms.topic: how-to
ms.date: 03/15/2023
ms.custom: template-how-to
---
# Redeploy past solution versions

With pipelines, makers and admins now have the power to redeploy past solution versions from previous successful deployments.

## Prerequisites

- One or more pipelines must already be created and associated with the environment that's used for development.
- The development environment must have Microsoft Dataverse or Dataverse plus Dynamics 365 customer engagement apps.
- You must have access to run a pipeline. More information: [Grant access to edit or run pipelines](set-up-pipelines.md#grant-access-to-edit-or-run-pipelines)
- You must have privileges to import solutions to the target environments associated with a pipeline.
- The **Power Platform Pipelines** package **version 9.1.24023.240222117 or later** must be installed in your pipeline host environment. More information: [Install the pipelines application in your host environment](set-up-pipelines.md#install-the-pipelines-application-in-your-host-environment)
- The setting for **Allow redeployments of older versions** must be enabled in the pipeline settings.

For more information about these prerequisites, go to [Set up pipelines](set-up-pipelines.md).

## Initiating a redeployment

1. From the Pipelines page, choose the pipeline in the dropdown that you wish to redeploy from.
1. Click **Run history**.
1. Find the record of the successful deployment that you wish to redeploy, and click the **...** next to the start time.
1. Click **Redeploy** from the menu.
1. Read and acknowledge the warning, then click **Redeploy** to continue with the usual deployment configuration process.

:::image type="content" source="media/pipeline-redeploy.png" alt-text="Screenshot of the pipelines run history page. A successful deploymnet is selected, showing a Redeploy option":::

> [!NOTE]
>
> - Redeploying will overwrite the most recent version, and any data within that version. This is an irreversible operation, and the data lost is unrecoverable. Updates, including new tables, will also be removed.

### See also

[Solution concepts](solution-concepts-alm.md)
