---
title: Enable cross-geo solution deployments
description: Learn how to enable cross-geo solution deployments in Pipelines for Power Platform.
author: asheehi1
ms.author: matp
ms.topic: how-to
ms.date: 04/30/2024
ms.custom: template-how-to
contributors:
- asheehi1
---
# Enable cross-geo solution deployments in Pipelines

Administrators can now enable solution deployments via pipelines across geographical [regions](../admin/regions-overview.md).

## Prerequisites to enable cross-geo solution deployments

- You must have **administrator** privileges to access the Deployment Pipeline Configuration app _and_ **Write** privileges on **Organization Setting** in the host environment to enable this setting.
  > [!IMPORTANT]
  > This setting enables data to be shared across geographical regions within in your tenant.
- All environments used in pipelines must have a Microsoft Dataverse database.
- All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).

## Accessing and enabling the cross-geo setting for Pipelines

1. Navigate to the Deployment Pipeline Configuration app via the **Manage pipelines** button on the Pipelines page within a solution in Power Apps.
1. Select **Advanced Settings** from the left navigation pane.
1. Enable or disable the **Cross-Geo Solution Deployment** setting with the toggle.
1. Click **Save**.

:::image type="content" source="media/cross-geo-solution-deployment-setting.png" alt-text="Screenshot of the Advanced Settings page in the Deployment Pipeline Configuration app." lightbox="media/cross-geo-solution-deployment-setting.png":::

## Next steps

- [Set up pipelines in Power Platform](set-up-pipelines.md)
- [Extend pipelines in Power Platform](extend-pipelines.md)
- [Run pipelines in Power Platform](run-pipeline.md)
