---
title: Run a pipeline
description: Learn how to deploy solutions using Power Platform pipelines.
author: caburk
ms.author: matp
ms.service: powerapps
ms.topic: how-to
ms.date: 11/04/2022
ms.custom: template-how-to
---
# Run Power Platform Pipelines (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Pipelines automate solution deployments between Power Platform environments and facilitate healthy application management practices with minimal effort.

## Prerequisites

- One or more pipelines must already be created and associated with the environment that's used for development.
- The development environment must have Microsoft Dataverse or Dataverse plus Dynamics 365 Customer Engagement apps.
- You must have access to run a pipeline. More information: [Grant access to edit or run pipelines](set-up-pipelines.md#grant-access-to-edit-or-run-pipelines)
- You must have privileges to import solutions to the target environments associated with a pipeline.
- The **Power Platform Pipelines** application must be installed in your pipeline host environment. More information: [Install the Power Platform pipelines application in your host environment](set-up-pipelines.md#install-the-power-platform-pipelines-application-in-your-host-environment)

For more information about these prerequisites, go to [Set up Power Platform Pipelines (preview)](set-up-pipelines.md).

## Run a pipeline

1. Sign into a Power Platform environment (make.powerapps.com or make.powerautomate.com) and select your development environment.
1. To deploy a solution using a pipeline, go to **Solutions** and create or select an unmanaged solution to deploy.
1. From the **Solutions** area, choose between two options to include the solution in the pipeline:
   - Select **Pipelines** from the left navigation pane.
   - Select **Overview** from the left navigation pane, and then select **Deploy** on the command bar.
1. Select the stage to deploy to, such as *Deploy to Test*, and then select **Next**. This will initiate validation of the solution against the test environment. This validation can also be referred to as “pre-flight” checks. Missing dependencies and other common issues are checked that might cause a deployment to fail.
1. If connection references or environment variables are present, you’ll be prompted to provide these (just as you would when manually importing solutions).
1. Select **Deploy**. This initiates an automated deployment to the target environment.

> [!NOTE]
> You must complete the deployment stages in order. For example, you can't deploy version 1.0.0.1 to production before it has been deployed to test. After deploying to test, that same exact solution that was deployed will then be deployed to production, even if afterward you made changes to the solution without incrementing the version.

## Monitor pipeline deployments

The **Pipelines** page in the **Solutions** area displays all deployment activity for the current pipeline and solution.

Select a pipeline, then **Run history** to view more detail and error information if there was a failure.
:::image type="content" source="media/pipeline-monitoring.png" alt-text="Monitoring a pipeline":::

## Next steps

[Solution concepts](solution-concepts-alm.md)
