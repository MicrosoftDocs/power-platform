---
title: Admin deployment page
description: Manage ALM in the admin center.
author: caburk
ms.subservice: alm
ms.author: caburk
ms.custom: NewPPAC
ms.reviewer: matp
ms.topic: overview
ms.date: 11/06/2026
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

## Review and approve deployment requests

On the deployment page, admins approve or reject deployment requests assigned to them. You’ll first need to [setup delegated deployments](delegated-deployments-setup.md) with service principals, which is recommended as the secure way to securely deploy to production environments.

It’s important admins review changes in the solution and the sharing request. Once approved, the solution is deployed, and solution objects and security roles are shared automatically. Notice other types of approvals within the pipelines host environment can also be managed.

## Retry failed deployments

A dedicated **Failed deployments** view helps admins quickly identify and troubleshoot failures. Deployments shown as **Failed** in the run history view can be retried by selecting **Retry** in the details panel if the operation was **Deploy**. A confirmation message appears when you confirm the retry.

## Manage deployment settings

Admins can manage these **Settings** within the selected pipelines host (settings are managed separately for each host):

- **Enable automatic conversion of pipelines environments to [managed environments](../admin/managed-environment-overview.md)**. An unmanaged target becomes managed on its next deployment, so the grace period doesn't apply. Review your license coverage before turning this setting on. Turning it off doesn't remove the managed environment requirement. Configure it separately for each pipelines host.
- **[Solution deployments across regions](enable-cross-geo-solution-deployments.md)**: Admins can opt in to allow deployments between environments in different geographic locations. For example, when the host and production environments are in North America but the development environment is in India.

   > [!IMPORTANT]
   > This setting enables data to be shared across geographical regions within your tenant.

- **[Allow makers to import shared solution deployments](import-from-pipelines-host.md)**: Deployed solution backups are stored in the pipelines host. This setting allows nonadmins to import solutions that were shared with them, in addition to the ability to import solutions that they deployed.
- **Use a custom pipelines host**: Allows you to set one default host for the entire tenant. This replaces [personal pipelines](platform-host-pipelines.md) - meaning admins control who can access pipelines and makers can no longer create personal pipelines in the platform host. It's also useful when a central team manages deployments for the entire tenant. This setting is only visible when the **Platform host** is selected in the host picker.

:::image type="content" source="media/admin-deployment-hub/admin-deploy-hub-default-host.png" alt-text="Use a custom pipelines host option" lightbox="media/admin-deployment-hub/admin-deploy-hub-default-host.png":::

> [!IMPORTANT]
> You must use [managed environments](../admin/managed-environment-overview.md) for all target environments in a pipeline. Starting in October 2026, deployments to an unmanaged target are blocked after a grace period. For details, see [Managed environments enforcement for pipelines](#managed-environments-enforcement-for-pipelines).

## Managed environments enforcement for pipelines

Pipeline target environments must be managed environments. Enforcement began rolling out in October 2026. Targets that are already managed aren't affected.

Enforcement applies to each target environment separately. Select each pipelines host to view any impacted target environments.

### Grace period and extension

| Stage | When it applies | What happens |
|---|---|---|
| Initial grace period | 30 days from the first deployment to an unmanaged target after enforcement is enabled. | Deployments continue. Admins are notified and makers see a warning. No action is required to start this period. |
| Acknowledgement required | The initial period has ended. | Deployments pause until a maker or tenant administrator acknowledges the prompt. |
| Extension | One time, for 30 days from acknowledgement. | Deployments continue for that target. |
| Blocked | The extension has ended. | Deployments stop until a tenant administrator enables managed environments on the target. |

Waiting to acknowledge doesn't shorten the extension. For example, acknowledging on day 30 blocks deployments after day 60; acknowledging on day 45 blocks them after day 75.

> [!NOTE]
>
> - Previewing or validating a deployment doesn't start the grace period.
> - Enforcement blocks new deployments only. Deployed apps and solutions continue to run.
> - Enabling managed environments on the target removes the block immediately.

### Acknowledge the extension

1. On the solution's **Pipelines** page, select **Deploy here**, and then select **Next**.
1. In the **Keep deployments running smoothly** dialog, select the acknowledgement checkbox.
1. Select **Use extension**, and then complete the deployment.

The prompt appears only after the initial grace period ends.

### Manage affected targets

| Action | Maker | Power Platform or Dynamics 365 administrator |
|---|---|---|
| View affected targets and deploy during the allowed period | Yes | Yes |
| Acknowledge the extension | Yes | Yes |
| Enable managed environments or automatic conversion | No | Yes |

To enable managed environments:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Deployment**, and then select a pipelines host.
1. In **Environments to convert**, select one or more environments.
1. Review the licensing and billing requirements, and then enable managed environments.

The table lists pipeline targets that need conversion, not every unmanaged environment. Review each pipelines host separately.

## FAQ

### Are managed environments required for deployment pipelines, and what does this mean for my organization?

Yes. Pipeline targets have always been required to be managed environments. Enforcement of this requirement began rolling out in October 2026.

### What happens when pipelines deploy to unmanaged target environments starting in October 2026?

The first deployment starts a 30-day grace period for that target. After it ends, a maker or tenant administrator can acknowledge a one-time 30-day extension. When the extension ends, deployments are blocked until a tenant administrator enables managed environments. See [Managed environments enforcement for pipelines](#managed-environments-enforcement-for-pipelines).

### Does acknowledging the extension enable managed environments?

No. It only starts the one-time extension. A tenant administrator must enable managed environments to remove the requirement.

### When does the extension start?

The extension lasts 30 days from acknowledgement. It doesn't restart if another maker deploys or acknowledges again.

### How do I request a longer extension?

Customers with a Microsoft Enterprise Agreement (EA) might be eligible in certain circumstances, but approval isn't guaranteed. Microsoft Support can't approve extension requests. Contact your Microsoft account team instead.

### Do I need to acknowledge to start the initial grace period?

No. It starts automatically with the first deployment to an unmanaged target after enforcement is enabled.

### Does enabling managed environments change my licensing?

Enforcement isn't a new licensing requirement, but managed environments have licensing and billing requirements. Review [managed environment licensing](../admin/managed-environment-licensing.md) and the [auto-claim policy](../admin/auto-claim-licensing.md).

### Where can administrators enable managed environments for affected targets?

In the Power Platform admin center, open **Deployment**, select a pipelines host, and review **Environments to convert**. Review each host separately. Makers can't enable managed environments; if you're blocked, ask your tenant administrator.

### Can I restrict access to personal pipelines?

Yes. Go to the Power Platform admin center > **Deployments** > **Settings** > **Use a custom pipelines host**, and then select a custom pipelines host. If there's no existing custom host, create one. Save the setting.

This overrides the platform host behavior, and nonadmins can't use pipelines unless you [grant access](custom-host-pipelines.md#grant-access-to-edit-or-run-pipelines) in the custom host environment. 

## Related articles

[Overview of pipelines in Power Platform](pipelines.md)

[View solutions on the deployment page for makers](/power-apps/maker/data-platform/maker-deployment-area)
