---
title: Set a default pipelines host instead of the platform host
description: Learn how to replace the platform host as your tenant's default pipelines host.
author: asheehi1
ms.author: matp
ms.topic: how-to
ms.date: 09/30/2024
ms.custom: template-how-to
---
# Set a default pipelines host instead of the platform host

By default, the platform host is used to help jumpstart easy application lifecycle management (ALM) in all organizations. However, if you have a custom pipelines host you would rather use by default for the environments in your tenant, use this setting to replace it.

## Prerequisites for enabling the setting

- You must be a Power Platform admin for your tenant.
- You must have a valid custom pipelines host with the **Power Platform Pipelines** package installed. More information: [Set up pipelines](set-up-pipelines.md).

## Enable the "Use a custom pipelines host" setting from the platform host

1. Go to the Deployment Pipeline Configuration app by selecting **Manage pipelines** on the **Pipelines** page within a solution in Power Apps.
1. Select **Advanced Settings** from the left navigation pane.
1. Enter the environment ID for the custom host you wish to use.
1. Select **Set Host**.

> [!IMPORTANT]
> After you enable the setting, users lose access to any existing pipelines within the current host. The data in this host is not removed, but an admin must re-create environment records and pipeline records within the new host to enable users to continue using pipelines. Pipelines and permissions to access them must be shared to users in the new host so they can view and deploy those pipelines.

:::image type="content" source="media/default-pipelines-host-setting.png" alt-text="Screenshot of the Advanced Settings page in the Deployment Pipeline Configuration app for setting a default custom pipelines host." lightbox="media/default-pipelines-host-setting.png":::

## Return to the platform host's deployment pipeline configuration experience

If you have configured the setting and are using a custom host as the replacement default pipelines host, instead of the platform host, here are instructions on how to navigate back to the platform host’s Deployment Pipeline Configuration experience.

1. To return to the platform host, navigate to the new custom host environment in Power Apps (make.powerapps).
1. On the left navigation pane, select **Solutions**.
1. Open an unmanaged solution with Microsoft Dataverse, such as the Common Data Services Default Solution.
1. On the left navigation pane, select **Pipelines**, and then select **Manage platform host** on the command bar.

   The platform host's Deployment Pipeline Configuration opens.

### Remove or replace an existing default custom pipelines host

When in the platform host's Deployment Pipeline Configuration experience, select **Advanced Settings** on the left navigation pane.

- To replace: In the **Use a custom pipelines host** setting, replace the **Pipelines host environment ID**, and then select **Save**.
- To remove: In the **Use a custom pipelines host** setting, select **Remove**, and then confirm.

## Frequently Asked Questions

### I receive the error: EnvironmentNotFound - The environment '{Environment ID}' could not be found in the tenant '{Tenant ID}'

This error indicates either following situation:

- You don't have the necessary permissions to access the pipelines host. In this case, an admin must provide the necessary privileges to use pipelines
- The pipelines host is deleted so it can't be found.

## See also

[Run pipelines in Power Platform](run-pipeline.md)
