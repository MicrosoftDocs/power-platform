---
title: Admin deployment page
description: Manage ALM in the admin center.
author: caburk
ms.subservice: alm
ms.author: caburk
ms.custom: NewPPAC
ms.reviewer: matp
ms.topic: overview
ms.date: 1/15/2026
---
# Admin deployment page

The **Deployment** page in the Power Platform admin center provides a streamlined experience to help administrators navigate the complexities of managing Power Platform application lifecycle management (ALM) workloads, including managing pipelines deployments at enterprise scale. Admins have visibility to all the deployments in their tenant and can approve deployment requests and troubleshoot issues.

:::image type="content" source="media/admin-deployment-hub/deployment-page-ppac.png" alt-text="Deployment page in the Power Platform admin center" lightbox="media/admin-deployment-hub/deployment-page-ppac.png":::

> [!NOTE]
> Currently the deployment page doesn't have all the capabilities available within the [Deployment Pipelines Configuration app](custom-host-pipelines.md).

## Use the deployment page

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Deployment**.
1. Select the desired pipelines host. Deployment data isn't currently aggregated across hosts.

### Learn about the ALM process in Power Platform

The **Get started** section provides helpful learning content and guidance to set up deployments using best practices.

### Manage deployments from one central location

Pipelines in Power Platform allow you to manage the end-to-end deployment process across your organization. The deployment page makes it easy to view all the pipelines and deployment activity within the tenant.

Admins can view all [pipelines host](custom-host-pipelines.md) environments in the tenant, including the platform host, and **select a host** to view all the pipelines and deployment history managed by that host.

Select **Pipelines** on the left navigation pane to view all active pipelines within the pipelines host.

:::image type="content" source="media/admin-deployment-hub/admin-deploy-hub-pipelines-list.png" alt-text="media/admin-deployment-hub/admin-deploy-hub-pipelines-list.png":::

> [!NOTE]
>
> - You can view up to the last 365 days by changing the filter.
> - Additional information and advanced pipeline configuration can be accessed by navigating to the pipelines host environment and opening the [Deployment Pipelines Configuration app](custom-host-pipelines.md).

The **Run history** view shows all deployment activity managed by the selected pipelines host including:

- The **Start time** and **End time** for every deployment.
- **Pipeline** that facilitated each deployment.
- **Source** is the development environment where the solution was developed and exported from.
- **Target** is the destination environment where the pipeline is deployed. For example, for integration testing, user acceptance testing (UAT), production, and so on.
- **Status** indicates whether the deployment is in-progress, succeeded, failed, or canceled.
- **Solution** is the name of the artifact and the **Version** deployed to the target environment.

  :::image type="content" source="media/admin-deployment-hub/admin-deploy-hub-run-history.png" alt-text="Run history page in deployment hub" lightbox="media/admin-deployment-hub/admin-deploy-hub-run-history.png":::

> [!IMPORTANT]
>
> - All target environments used in a pipeline must be enabled as [Managed Environments](../admin/managed-environment-overview.md).
> - Tenant admins can enable automatic conversion of pipelines environments to [Managed Environments](../admin/managed-environment-overview.md).

### Manage deployment settings

Admins can manage these **Settings** within the selected pipelines host (settings are managed separately for each host):

- **Enable automatic conversion of pipelines environments to [Managed Environments](../admin/managed-environment-overview.md)**. This ensures pipelines environments meet Microsoft compliance standards automatically. When makers deploy to this environment, it gets automatically converted to a Managed Environment.
- **[Solution deployments across regions](enable-cross-geo-solution-deployments.md)**: Admins can opt in to allow deployments between environments in different geographic locations. For example, when the host and production environments are in North America but the development environment is in India.

   > [!IMPORTANT]
   > This setting enables data to be shared across geographical regions within your tenant.

- **[Allow makers to import shared solution deployments](import-from-pipelines-host.md)**: Deployed solution backups are stored in the pipelines host. This setting allows nonadmins to import solutions that were shared with them, in addition to the ability to import solutions that they deployed.
- **Use a custom pipelines host**: Allows you to set one default host for the entire tenant. This replaces [personal pipelines](platform-host-pipelines.md) - meaning admins control who can access pipelines and makers can no longer create personal pipelines in the platform host. It's also useful when a central team manages deployments for the entire tenant. This setting is only visible when the **Platform host** is selected in the host picker.

:::image type="content" source="media/admin-deployment-hub/admin-deploy-hub-default-host.png" alt-text="Use a custom pipelines host option" lightbox="media/admin-deployment-hub/admin-deploy-hub-default-host.png":::

### Review and approve deployment requests

On the deployment page, admins approve or reject deployment requests assigned to them. You’ll first need to [setup delegated deployments](delegated-deployments-setup.md) with service principals, which is recommended as the secure way to securely deploy to production environments.

It’s important admins review changes in the solution and the sharing request. Once approved, the solution is deployed, and solution objects and security roles are shared automatically. Notice other types of approvals within the pipelines host environment can also be managed.

### Retry failed deployments

A dedicated **Failed deployments** view helps admins quickly identify and troubleshoot failures. Deployments shown as **Failed** in the run history view can be retried by selecting **Retry** in the details panel if the operation was **Deploy**. A confirmation message appears when you confirm the retry.

## FAQ

### Are Managed Environments required for deployment pipelines, and what does this mean for my organization?

Yes. All target environments used in Power Platform deployment pipelines have always been required to be Managed Environments for compliant usage. This requirement helps your organization benefit from enhanced governance, improved security, and streamlined license management.

### How can I ensure pipelines targets are Managed Environments automatically?

Tenant admins (Power Platform and Dynamics 365 admins) can enable a setting that automatically converts pipelines target environments to Managed Environments, ensuring compliance with Microsoft standards. Managed Environments are then enabled on the target during the next deployment.

To enable the setting, go to the Power Platform admin center **Deployments** > **Settings**. Turn on the automatic managed environment setting for each pipeline host.

### Why did I receive Message Center notification “Power Platform – Automatic enablement of Managed Environments for Deployment Pipelines”?

You receive a notification when you have environments that aren't managed and are target of a pipeline and used for deployment in the last six months. 
The notification lists specific environments that need action.

> [!IMPORTANT]
>
> - Starting February 2026, Microsoft starts enabling Managed Environments for any pipeline target environments that aren’t already enabled.
> - We recommend that you review and enable Managed Environments for all pipeline targets now or set it to occur automatically.

### How do I verify pipelines target environments requiring Managed Environments?

Go to the Power Platform admin center **Deployments** > **Pipelines** > **Run History**. Then select a host and change the filter to **Last 180 days**. If multiple hosts exist, review deployments in each. Environments listed under **Target** require Managed Environments.

 > [!NOTE]
 > Additional run history information and the ability to export data and generate reports is available within the [Deployment Pipelines Configuration app](custom-host-pipelines.md).

### Does this automatic enablement affect end users or licensing, and how can I prepare?

There's no expected disruption for end users or their applications because of this automatic enablement. The changes focus on environment governance and compliance, so your users and apps continue to function as usual.

 > [!IMPORTANT]
 > Managed Environments come with an [autoclaim policy](../admin/auto-claim-licensing.md), which is applied automatically. The autoclaim policy ensures users who access apps in Managed Environments automatically receive the necessary licenses. Ensure you have appropriate license capacity in the tenant to utilize autoclaim.

### Will Microsoft enable unmanaged pipelines target environments in February 2026 if the automatic enablement setting is turned off? 

Yes. We also recommend you enable the setting to ensure future compliance.

### Can I restrict access to personal pipelines?

Yes. Go to the Power Platform admin center > **Deployments** > **Settings** > **Use a custom pipelines host**, and then select a custom pipelines host. If there's no existing custom host, create one. Save the setting.

This overrides the platform host behavior, and nonadmins can't use pipelines unless you [grant access](custom-host-pipelines.md#grant-access-to-edit-or-run-pipelines) in the custom host environment. 

## Related articles

[Overview of pipelines in Power Platform](pipelines.md)

[View solutions on the deployment page for makers](/power-apps/maker/data-platform/maker-deployment-area)
