---
title: Admin deployment page
description: Manage ALM in the admin center.
author: matp123
ms.subservice: alm
ms.author: matp
ms.custom: NewPPAC
ms.reviewer: matp
ms.topic: overview
ms.date: 4/28/2025
---
# Admin deployment page

The **Deployment** page in the Power Platform admin center provides a streamlined experience to help administrators navigate the complexities of managing Power Platform application lifecycle management (ALM) workloads, including managing pipelines deployments at enterprise scale. Admins have visibility to all the deployments in their tenant and can approve deployment requests and troubleshoot issues.

:::image type="content" source="media/deployment-page-ppac.png" alt-text="Deployment page in the Power Platform admin center" lightbox="media/deployment-page-ppac.png":::

> [!NOTE]
> Currently the deployment page doesn't have all the capabilities available within the [Deployment Pipelines Configuration app](custom-host-pipelines.md).

## Use the deployment page

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Deployment**.
1. Select the desired pipelines host. Deployment data is not currently aggregated across hosts.

### Learn about the ALM process in Power Platform

The **Get started** section provides helpful learning content and guidance to set up deployments using best practices.

### Manage deployments from one central location

Pipelines in Power Platform allow you to manage the end-to-end deployment process across your organization. The deployment page makes it easy to view all the pipelines and deployment activity within the tenant.

Admins can view all [pipelines host](custom-host-pipelines.md) environments in the tenant, including the platform host, and **select a host** to view all the pipelines and deployment history managed by that host.

Select **Pipelines** on the left navigation to see all active pipelines within the pipelines host. 

:::image type="content" source="media/AdminDH_PipelinesList.png" alt-text="Pipelines page" lightbox="media/AdminDH_PipelinesList.png":::

> [!NOTE]
> You can view up to the last 365 days by changing the filter.
> Additional information and advanced pipeline configuration can be accessed by navigating to the pipelines host environment and opening the [Deployment Pipelines Configuration app](custom-host-pipelines.md).

The **Run history** view shows all deployment activity managed by the selected pipelines host including:
- The **Start time** and **End time** for every deployment.
- **Pipeline** that facilitated each deployment.
- **Source** is the development environment where the solution was developed and exported from.
- **Target** is the destination environment where the pipeline deployed to. For example, for integration testing, user acceptance testing (UAT), production, and so on.
- **Status** indicates whether the deployment is in-progress, succeeded, failed, or was cancelled.
- **Solution** is the name of the artifact and the **Version** deployed to the target environment.

  :::image type="content" source="media/AdminDH_RunHistory.png" alt-text="Run history page" lightbox="media/AdminDH_RunHistory.png":::

> [!IMPORTANT]
> All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).
> Tenant admins can enable automatic conversion of pipelines environments to [Managed Environments](../admin/managed-environment-overview.md).

### Manage deployment settings
Admins can manage the following **Settings** within the selected Pipelines host (settings are managed separately for each host).
- **Enable automatic conversion of pipelines environments to [Managed** Environments](../admin/managed-environment-overview.md).This ensures pipelines environments meet Microsoft compliance standards automatically. When makers deploy to this environment it gets automatically converted to a Managed Environment.
- **[Solution deployments across regions](enable-cross-geo-solution-deployments.md)**: admins can opt-in to allow deployments between environmets in different geographic locations. For example, If the host and production environments are in North America but the development environment is in India.
> [!IMPORTANT]
> This setting enables data to be shared across geographical regions within in your tenant.
- **[Allow makers to import shared solution deployments](import-from-pipelines-host.md)**: Deployed solution backups are stored in the pipelines host. This setting allows non-admins to import solutions that were shared with them, in addition to being able to import solutions that they themselves have deployed.
- **Use a custom pipelines host** allows you to set one default host for the entire tenant. This replaces [personal pipelines](platform-host-pipelines.md) - meaning admins control who can access pipelines and makers can no longer create personal pipelines in the platform host. It's also useful when a central team manages deployments for the entire tenant. This setting is only visible when the **Platform host** is selected in the host picker.

:::image type="content" source="media/AdminDH_DefaultHost.png" alt-text="Run history page" lightbox="media/AdminDH_DefaultHost.png":::

### Review and approve deployment requests

On the deployment page, admins approve or reject deployment requests assigned to them. You’ll first need to [setup delegated deployments](delegated-deployments-setup.md) with service principals, which is recommended as the secure way to securely deploy to production environments.

It’s important admins review changes in the solution and the sharing request. Once approved, the solution is deployed, and solution objects and security roles are shared automatically. Notice other types of approvals within the pipelines host environment can also be managed.

### Retry failed deployments

A dedicated **Failed deployments** view helps admins quickly identify and troubleshoot failures. Deployments shown as **Failed** in the run history view can be retried by selecting **Retry** in the details panel if the operation was **Deploy**. A confirmation message appears when you confirm the retry.

## FAQ

### Can I ensure pipeline targets are Managed Environments?

Yes. Tenant admins can automatically convert pipeline target environments to Managed Environments, ensuring compliance with Microsoft standards.
To enable an environment as a Managed Environment, go to the Power Platform admin center **Deployments** > **Settings**. Turn on the automatic managed environment setting for each pipeline host.

 > [!IMPORTANT]
 > Starting February 2026, Microsoft will start enabling Managed Environments for any pipeline target environments that aren’t already enabled. Customers will be notified via Microsoft 365 Message center.
 > We recommend you review and enable Managed Environments for all pipeline targets now. You can do this manually now or set it to occur automatically:
>
> - **Manually:** Go to enable [Managed Environments](../admin/managed-environment-enable.md).
> - **Automatically:** Configure the setting for new pipelines as described above.

## Related articles

[Overview of pipelines in Power Platform](pipelines.md)

[View solutions on the deployment page for makers](/power-apps/maker/data-platform/maker-deployment-area)
