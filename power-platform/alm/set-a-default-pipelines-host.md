---
title: Set a default pipelines host instead of the platform host
description: Learn how to replace the platform host as your tenant's default pipelines host.
author: asheehi1
ms.author: matp
ms.topic: how-to
ms.date: 09/12/2024
ms.custom: template-how-to
---
# Set a default pipelines host instead of the platform host

By default, the platform host is used to help jumpstart easy ALM in all organizations. However, if you have a custom pipelines host you would rather use by default for the environments in your tenant, this is the setting to replace it.

## Prerequisites for enabling the setting

- You must be a **Power Platform Admin** or **Global Admin** for your tenant.
- You must have a valid custom pipelines host with the **Power Platform Pipelines** package installed (see [Set up pipelines](set-up-pipelines.md)).

## Enabling the "Use a custom pipelines host" setting from the platform host

1. Go to the Deployment Pipeline Configuration app by selecting **Manage pipelines** on the **Pipelines** page within a solution in Power Apps.
1. Select **Advanced Settings** from the left navigation pane.
1. Enter the environment ID for the custom host you wish to use.
1. Select **Set Host**.

 > [!IMPORTANT]
  > Users will lose access to any existing pipelines within the current host. The data in this host will not be removed, but an admin must recreate environment records and pipeline records within the new host to enable users to continue using Pipelines. Pipelines and permissions to access them must be shared to users in the new host so they can view and deploy those pipelines.

   :::image type="content" source="media/default-pipelines-host-setting.png" alt-text="Screenshot of the Advanced Settings page in the Deployment Pipeline Configuration app for setting a default custom pipelines host." lightbox="media/default-pipelines-host-setting.png":::

## Return to the platform host's deployment pipeline configuration experience

If you have configured the setting and are using a custom host as the replacement default pipelines host, instead of the platform host, here are instructions on how to navigate back to the platform host’s Deployment Pipeline Configuration experience.

1. To return to the platform host, navigate to the new custom host environment in make.powerapps.
1. From the left navigation pane, go to **Solutions**.
1. Choose an unmanaged solution with Dataverse (e.g. "Common Data Services Default Solution") and click into it.
1. In the left navigation pane, click **Pipelines**.
1. Click "Go to platform host" in the command bar, and the platform host's Deployment Pipeline Configuration will open.

### Removing or replacing an existing default custom pipelines host
When in the platform host's Deployment Pipeline Configuration experience, select **Advanced Settings** from the left navigation pane.

- To replace: in the "Use a custom pipelines host" setting, replace the **Pipelines host environment ID** and click **Save**.
- To remove: in the "Use a custom pipelines host" setting, click **Remove**, and confirm.

## Frequently Asked Questions

### I am seeing an error: EnvironmentNotFound - The environment '{Environment ID}' could not be found in the tenant '{Tenant ID}'
This error indicates that either:
1. You do not have the necessary permissions to access the pipelines host (in this case, an admin must provide the necessarily privileges to use pipelines), or
1. The pipelines host has been deleted or and cannot be found.
