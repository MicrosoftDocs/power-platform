---
title: Plan ALM for Power Pages
description: Learn how to plan application lifecycle management for Power Pages, including environments, data model, ALM approach, binding, and branch strategy.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: concept-article
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# Plan ALM for Power Pages

Application lifecycle management (ALM) for Power Pages follows the same principles as ALM for the rest of Power Platform. Before you build a release process for a site, make a few Power Pages-specific decisions: which environments you use, which data model the site uses, whether you use built-in tools or developer tools, and how you organize source control.

This article helps you make those decisions. For platform-wide guidance, see [Application lifecycle management with Microsoft Power Platform](/power-platform/alm/).

## Plan your environments

Use separate development, test, and production environments so that you can keep changing a site without breaking it for existing users. Deploy to test and production only through your release process. Don't edit the site directly in those environments.

- **Development:** Build and change the site here. Each developer can use their own development environment. Sites that you create in [developer environments](/power-apps/maker/maker-create-environment) are [developer sites](/power-pages/getting-started/developer-sites). They don't expire after 30 days, but they're private and can't be made public.
- **Test:** Validate the release candidate here, including user acceptance testing when your process requires it.
- **Production:** Run the live site here.

Git integration and pipelines in Power Platform require [Managed Environments](/power-platform/admin/managed-environment-overview). For more about how many environments to use and how to align them, see [ALM environment strategy considerations](/power-platform/alm/environment-strategy-alm).

## Identify your site's data model

The site's data model decides which ALM tools you can use:

- **Standard data model sites** store configuration in tables that aren't solution-aware. You can't add them to a solution, connect them to Git integration, or deploy them with pipelines in Power Platform. Use developer tools.
- **Enhanced data model sites** store configuration in solution-aware Power Pages system tables. You can use built-in tools or developer tools.
- **Single-page application (SPA) code sites** always use the enhanced data model. You can use built-in tools or developer tools.

To check a site's data model, run `pac pages list -v` with Power Platform CLI, or follow the steps in [Determine whether your site uses the standard or enhanced data model](/power-pages/admin/enhanced-data-model#determine-whether-your-site-uses-the-standard-or-enhanced-data-model).

## Choose an ALM approach

Power Pages supports both Power Platform ALM approaches. [ALM for admins and makers](/power-platform/alm/git-integration/overview) uses built-in tools. [ALM for developers](/power-platform/alm/alm-for-developers) uses developer tools.

| | Built-in tools | Developer tools |
|---|---|---|
| **Site types** | Enhanced data model sites and SPA code sites | Standard data model sites, enhanced data model sites, and SPA code sites |
| **Users** | Makers, admins, and fusion development teams | Code-first developers |
| **Source control** | Git integration in development environments | A Git repository that you manage, populated with files from Power Platform CLI |
| **Deployment** | Managed solutions through pipelines in Power Platform | Azure Pipelines with Microsoft Power Platform Build Tools, GitHub workflows with GitHub Actions for Microsoft Power Platform, or Power Platform CLI |
| **Environment values** | Environment variables with site settings, with target values provided when you deploy with pipelines | Deployment profiles for standard data model sites, and deployment settings files for solutions |
| **Rollback** | Redeploy a past solution version from the pipeline run history | Redeploy a tagged artifact from your CI/CD system |

For more about each approach, see [Use Git integration with Power Pages](power-pages-source-control.md), [Deploy Power Pages sites with pipelines in Power Platform](/power-pages/configure/power-pages-pipelines), and [Overview of ALM with developer tools](developer-tools-overview.md).

### Combine both approaches

You don't have to choose only one approach. Power Platform recommends that you use pipelines for core deployment and, when needed, [extend pipelines](/power-platform/alm/extend-pipelines) to integrate with other CI/CD tools. For example, a GitHub workflow can export a solution as part of a pipeline run. For details, see [Extend pipelines using GitHub Actions](/power-platform/alm/extend-pipelines-github-export).

## Choose a binding strategy

If you use Git integration, choose how the development environment connects to the repository. Environment binding is the recommended starting point. If the site and its dependencies are split across solutions that share components, such as shared tables or web roles, use environment binding.

For Power Pages guidance, see [Plan your source control setup](power-pages-source-control.md#plan-your-source-control-setup). For the platform differences between the strategies, see [How to choose between environment and solution binding](/power-platform/alm/git-integration/connecting-to-git#how-to-choose-between-environment-and-solution-binding).

## Plan a primary development environment and branch strategy

With Git integration, each connected environment syncs with one branch. A common approach is:

1. Connect each developer's environment to a feature branch.
2. Merge feature branches into an integration branch, such as `main`, through pull requests.
3. Connect one primary development environment to the integration branch, and use it as the source for release solutions.
4. Pull merged changes into the primary development environment before you package a release.

To get changes that other developers merged, merge the integration branch into your feature branch, and then select **Check for updates** and **Pull**. For details, see [Use Git integration with Power Pages](power-pages-source-control.md#plan-your-source-control-setup).

If you use developer tools, branches serve the developer inner loop, and you deploy to downstream environments through CI/CD. For details, see [Set up source control and branching for Power Pages](source-control-developer-tools.md).

## Prevent changes in downstream environments

Edits made directly in test or production create an unmanaged layer on top of the managed solution. That layer hides later managed solution updates. For details, see [Solution layers and merge behavior](/power-platform/alm/solution-layers-alm).

To stop these edits, admins can turn on the [Block unmanaged customizations](/power-platform/alm/block-unmanaged-customizations) environment setting in downstream environments. This setting helps ensure that changes come only from approved ALM processes.

<!-- SME: confirm whether Block unmanaged customizations affects any Power Pages runtime or design studio operations in target environments -->

## Next steps

- [Use solutions with Power Pages](/power-pages/configure/power-pages-solutions)
- [Use Git integration with Power Pages](power-pages-source-control.md)
- [Deploy Power Pages sites with pipelines in Power Platform](/power-pages/configure/power-pages-pipelines)
- [Overview of ALM with developer tools](developer-tools-overview.md)

## Related content

- [Overview of Power Pages ALM](/power-pages/configure/portals-alm)
- [Enhanced data model](/power-pages/admin/enhanced-data-model)
- [Manage environment-specific values in Power Pages ALM](environment-specific-values.md)
- [Roll back and hotfix Power Pages releases](rollback-hotfix.md)
- [ALM environment strategy considerations](/power-platform/alm/environment-strategy-alm)
