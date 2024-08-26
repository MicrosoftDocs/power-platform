---
title: Create pipelines using the platform host
description: Learn how to create personal pipelines from your development environments to other target environments that you have import access to.
author: asheehi1
ms.author: asheehi
ms.reviewer: matp
ms.topic: how-to
ms.date: 08/15/2024
ms.custom: template-how-to
contributors:
- asheehi1
---

# Create a personal pipeline using the platform host

Pipelines are available to all who navigate to the pipelines page for the first time. Create personal pipelines from your development environments to other target environments that you have import access to. Apply the benefits of pipelines such as no downloads or uploads required, deployment scheduling, inline target environment solution validation, upfront connection reference and environment variable value validation, and Copilot-generated deployment notes with an easy setup process.

## Prerequisites for personal pipelines using the platform host

- Three environments can be associated to a personal pipeline created from the **Pipelines** page: one current development environment and two target environments. More information:  [Add a stage to a single-stage pipeline you own](#add-a-stage-to-a-single-stage-pipeline-you-own).
  > [!NOTE]
  > Default environments, Teams environments, and environments without a Microsoft Dataverse store can't be used as target environments for personal pipelines.
- All environments used in pipelines must have a Dataverse database.
- All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).

## Current limitations with personal pipelines using the platform host

- Personal pipelines can't be extended.
- Only three environments, a source, and two subsequent targets, can be configured.
- Personal pipelines can't be shared with other users.

## Setting up the platform host for the first time

If you're the first user in your tenant to navigate to the **Pipelines** page in an environment not already associated with a custom pipelines host, the platform host is provisioned for everyone in the tenant to use.

## Create a pipeline in Power Apps

First, ensure that you are in the development environment where you want your pipeline to start.

Select **Create pipeline** on the command bar or from the **Pipeline** dropdown list.

A panel opens, where you enter:

- **Pipeline name**: A name for the pipeline.
- **Description**: An optional description to describe what the pipeline is used for.
- **Target environment**: The environment that solutions in the current development environment are deployed to.

 > [!NOTE]
  > The **Target environments** list is filtered based on import access and geographical region (if the [cross-geo solution deployments](enable-cross-geo-solution-deployments.md) setting is disabled).

Once you select **Save**, the current (source) environment and the selected target environment are associated with the platform host, and environment records for each are created in the platform host. Then, the newly created pipeline is autoselected and you're ready to [run the pipeline](run-pipeline.md).

> [!IMPORTANT]
>
> - Environments can only be associated with one pipelines host. If you would like to use a governed pipeline with advanced extensibility, shareability, and more than two environments, ensure that environment records in the platform host are deleted within the **Manage pipelines** experience so they are freed up to be associated with a custom host. Deleting a pipeline doesn't delete the environment records linked to that pipeline.
> - Environments can only be classified as either development or target, and once set, this classification can only be changed by an admin in the **Manage pipelines** experience by deleting or re-creating the environment record.

### Add a stage to a single-stage pipeline you own

Select **Add stage** on the command bar to append a stage to the current single-stage pipeline. As part of this step, you're prompted for a stage name, description, and a final target environment for your pipeline.

> [!NOTE]
>
> - You must be the owner of the current pipeline to add a stage.
> - The add stage capability is limited to single-stage pipelines, but administrators can add more stages in the [Deployment Pipeline Configuration app](#accessing-the-deployment-pipeline-configuration-app-from-power-apps).

### Delete a pipeline you own from Power Apps

Select **Delete** on the command bar to delete the currently selected pipeline in the dropdown list. A confirmation message appears regarding your intent and knowledge of the consequence.

This action doesn't remove the run history for the pipeline nor does it delete the associated environment records from the host.

### Use your personal pipeline with other development environments

If you have the same pipeline process for an additional development environment, such as your UAT and production environments are the same for another source environment, you can reuse the pipeline that you already created.

Choose the created pipeline from the dropdown menu. When you select **Next** in the first step of the deployment configuration process, the current environment is linked to the pipeline (and the host) as a development environment.

### Accessing the Deployment Pipeline Configuration app from Power Apps

From the **Pipelines** page within any solution, the **Manage pipelines** button in the command bar navigates to the configuration app of the pipelines host that is associated with the current environment:

- If the current environment is associated with a custom pipelines host, the button links to the Deployment Pipeline Configuration app within the dedicated Host environment.
- If the current environment is associated with the platform host, the button links to an embedded Deployment Pipeline Configuration app within Power Apps.

The Deployment Pipeline Configuration app can be accessed by anyone with the Deployment Pipeline Administrator role if using a custom host, and any tenant administrator for the app associated with the Platform host.

## Next steps

- [Run pipelines in Power Platform](run-pipeline.md)
