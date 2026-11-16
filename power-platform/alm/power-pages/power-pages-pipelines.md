---
title: Deploy Power Pages sites with pipelines in Power Platform
description: Learn how to deploy Power Pages sites from development to test and production by using pipelines in Power Platform.
author: neerajnandwana-msft

ms.topic: how-to
ms.custom: 
ms.date: 11/02/2026
ms.author: nenandw
ms.reviewer: smurkute
contributors:
    - nageshbhat-msft
    - gitanjalisingh33msft
    - tyaginidhi
    - neerajnandwana-msft
ai-usage: ai-assisted
---

# Deploy Power Pages sites with pipelines in Power Platform

By using pipelines in Power Platform with Power Pages solutions, you can automate the deployment of websites from development environments to downstream environments, such as test and production.

This article applies to enhanced data model sites and single-page application (SPA) code sites. For other site types, see [Overview of Power Pages ALM](portals-alm.md).

Use pipelines in Power Platform for core deployment. If your team also uses other CI/CD tools, such as Azure DevOps or GitHub, you can [extend pipelines](/power-platform/alm/extend-pipelines) to integrate with them. For the developer tools options, see [Overview of ALM with developer tools](developer-tools-overview.md).

## Prerequisites

- Use the [enhanced data model](/power-pages/admin/enhanced-data-model). You can't deploy standard data model sites by using pipelines.
- Prepare your environments for pipelines in Power Platform. See [Set up pipelines in Power Platform](/power-platform/alm/set-up-pipelines).
- Each environment requires a site that you create by using the enhanced data model. See [create a website by using the enhanced data model](/power-pages/admin/enhanced-data-model#create-a-website-by-using-the-enhanced-data-model).
- You also need to set up and configure a pipeline from your development environment to corresponding target environments. See [Overview of pipelines in Power Platform](/power-platform/alm/pipelines) for details about how to configure pipelines.

## Deploy solutions by using pipelines

1. In your development environment, create and configure your website and add the website to a solution. For details about how to add website configuration data to a solution, see [Use solutions with Power Pages](power-pages-solutions.md). If you use [Git integration](power-pages-source-control.md), first pull the approved branch into the development environment that you deploy from.

1. In the solution, select the **Pipelines** icon on the side toolbar.

1. Select a pipeline from the dropdown list.

1. Select **Deploy here**.

1. Choose whether to deploy immediately or schedule the deployment for a later time.

1. Select **Next**.

1. Verify the summary, modify the version number and deployment notes, and select **Deploy**.

To learn how to deploy a solution by using pipelines, watch the following video:
> [!VIDEO https://learn-video.azurefd.net/vod/player?id=251c1397-7d42-45a5-aa63-930816d2d72d]

## Activate on the target environment

The first time you deploy a website to a destination environment, you need to reactivate the site. For information about how to reactivate a website that you deployed to the destination environment, see [Reactivating site on target environment](/power-pages/admin/migrate-site-configuration#reactivate-site-on-target-environment).

After you deploy the site, you can continue to deploy more configuration changes by using the same pipeline process. You need to [clear the cache](/power-pages/admin/clear-server-side-cache) on the destination website to see the changes.

Don't edit the site directly in the target environment. Edits in a target environment create an unmanaged layer that hides later managed solution updates.

To plan how to roll back a release or ship a hotfix, see [Roll back and hotfix Power Pages releases](rollback-hotfix.md).

### See also

- [Overview of Power Pages ALM](portals-alm.md)
- [Use Git integration with Power Pages](power-pages-source-control.md)
- [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md)
- [Roll back and hotfix Power Pages releases](rollback-hotfix.md)
- [Overview of application lifecycle management with Microsoft Power Platform](/power-platform/alm/overview-alm)
- [Overview of pipelines in Power Platform](/power-platform/alm/pipelines)
- [Extend pipelines in Power Platform](/power-platform/alm/extend-pipelines)
