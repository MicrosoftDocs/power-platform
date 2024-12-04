---
title: Enable cross-geo solution deployments in Power Platform
description: Learn how to enable cross-geo solution deployments in Pipelines for Power Platform.
author: asheehi1
ms.author: asheehi
ms.reviewer: matp
ms.topic: how-to
ms.date: 04/30/2024
ms.custom: template-how-to
contributors:
- asheehi1
---
# Enable cross-geo solution deployments for pipelines in Power Platform

Administrators can enable solution deployments via pipelines across geographical [regions](../admin/regions-overview.md). This provides flexibility for organizations that are distributed across geographical regions, making it easy to centrally administer global deployments within a single management plane.

## Prerequisites to enable cross-geo solution deployments

- You must be a **System Administrator** or a **Deployment Pipeline Administrator** to access the Deployment Pipeline Configuration app _and_ have **Write** privileges on the **Organization Setting (organizationsetting)** table in the host environment to enable this setting.
  > [!IMPORTANT]
  > This setting enables data to be shared across geographical regions within in your tenant. <!-- Is there a link for more info about this risk? -->
- All environments used in pipelines must have a Microsoft Dataverse database.
- All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).

## Accessing and enabling the cross-geo setting for pipelines

1. Go to the Deployment Pipeline Configuration app by selecting **Manage pipelines** on the **Pipelines** page within a solution in Power Apps.
1. Select **Advanced Settings** from the left navigation pane.
1. Enable or disable the **Cross-Geo Solution Deployment** setting with the toggle.
1. Select **Save**.

   :::image type="content" source="media/cross-geo-solution-deployment-setting.png" alt-text="Screenshot of the Advanced Settings page in the Deployment Pipeline Configuration app." lightbox="media/cross-geo-solution-deployment-setting.png":::

## Next steps

- [Set up pipelines in Power Platform](set-up-pipelines.md)
- [Extend pipelines in Power Platform](extend-pipelines.md)
- [Run pipelines in Power Platform](run-pipeline.md)
