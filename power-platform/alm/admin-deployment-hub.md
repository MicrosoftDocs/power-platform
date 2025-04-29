---
title: Admin deployment page
description: Manage ALM in the admin center.
author: asheehi1
ms.subservice: alm
ms.author: asheehi
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
1. Enable **New admin center** in the upper right corner.
1. In the navigation pane, select **Deployment**.

### Learn about the ALM process in Power Platform

The **Get started** section provides helpful learning content and guidance to set up deployments using best practices.

### Manage deployments from one central location

Pipelines in Power Platform allow you to manage the end-to-end deployment process across your organization. The deployment page makes it easy to view all the pipelines and deployment activity within the tenant.

Admins can view all [pipelines host](custom-host-pipelines.md) environments in the tenant, including the platform host, and **select a host** to view all the pipelines and deployment history managed by that host.

A dedicated **Failed deployments** view helps admins quickly identify and troubleshoot failures. Select **Pipelines** on the left navigation, then **Run history** to view all deployments.

### Review and approve deployment requests

On the deployment page, admins approve or reject deployment requests assigned to them. You’ll first need to [setup delegated deployments](delegated-deployments-setup.md) with service principals, which is recommended as the secure way to securely deploy to production environments.

It’s important admins review changes in the solution and the sharing request. Once approved, the solution is deployed, and solution objects and security roles are shared automatically. Notice other types of approvals within the pipelines host environment can also be managed.

### Retry failed deployments

Deployments shown as **Failed** in the run history view can be deployed by selecting **Retry** in the details panel if the operation was **Deploy**. A confirmation message appears when you confirm the retry.

## Related articles

[Overview of pipelines in Power Platform](pipelines.md)

[View solutions on the deployment page for makers](/power-apps/maker/data-platform/maker-deployment-area)
