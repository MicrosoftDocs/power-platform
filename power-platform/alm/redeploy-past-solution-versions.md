---
title: Redeploy past Microsoft Dataverse solution versions in Power Platform
description: Learn how to redeploy past solution versions using pipelines.
author: asheehi1
ms.author: matp
ms.topic: how-to
ms.date: 03/15/2024
ms.custom: template-how-to
---
# Redeploy past solution versions

With pipelines in Power Platform, makers and admins have the power to redeploy past Microsoft Dataverse solution versions from previous successful deployments.

## Prerequisites

- One or more pipelines must already be created and associated with the environment that's used for development.
- The development environment must have Dataverse or Dataverse plus Dynamics 365 customer engagement apps.
- You must have access to run a pipeline. More information: [Grant access to edit or run pipelines](custom-host-pipelines.md#grant-access-to-edit-or-run-pipelines)
- You must have privileges to import solutions to the target environments associated with a pipeline.
- The **Power Platform Pipelines** package **version 9.1.24023.240222117** or later version must be installed in your pipeline host environment. More information: [Install the pipelines application in your host environment](custom-host-pipelines.md#install-the-pipelines-application-in-your-host-environment)
- The setting for **Allow redeployments of older versions** must be enabled in the pipeline settings.

For more information about these prerequisites, go to [Set up pipelines](set-up-pipelines.md).

## Initiate a redeployment

> [!WARNING]
> Redeploying overwrites the most recent version and any data within that version. This is an irreversible operation, and the data lost is unrecoverable. Updates, including new tables, will also be removed.

1. From the **Pipelines** page, choose the pipeline in the dropdown list that you wish to redeploy.
1. Select **Run history**.
1. Find the record of the successful deployment that you wish to redeploy, select the vertical ellipses next to the start time, and then select **Redeploy**.
   :::image type="content" source="media/pipeline-redeploy.png" alt-text="Screenshot of the pipelines run history page. A successful deployment is selected, showing a redeploy option." lightbox="media/pipeline-redeploy.png":::
1. Read and acknowledge the warning, and then select **Redeploy** to continue with the usual deployment configuration process.

### See also

[Solution concepts](solution-concepts-alm.md)
