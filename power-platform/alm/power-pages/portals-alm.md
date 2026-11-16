---
title: Overview of Power Pages ALM
description: Choose an application lifecycle management (ALM) approach for Power Pages sites by using built-in tools, developer tools, or both, based on your site type.
author: neerajnandwana-msft
ms.topic: overview
ms.date: 11/02/2026
ms.author: nenandw
ms.reviewer: smurkute
contributors:
  - tyaginidhi
  - neerajnandwana-msft
ai-usage: ai-assisted
---

# Overview of Power Pages ALM

Application lifecycle management (ALM) for Power Pages is the set of practices and tools that teams use to develop, review, and deploy a site from development to test and production environments.

This article explains the Power Pages-specific decisions: how website configuration is captured, packaged, and promoted for each type of site. For platform-wide guidance about environment strategy, solution concepts and layers, team development, and deployment automation, see [Application lifecycle management with Microsoft Power Platform](/power-platform/alm/).

## Choose an ALM approach

Power Platform splits ALM into two sets of tools. [ALM for admins and makers](/power-platform/alm/git-integration/overview) uses Git integration and pipelines in Power Platform, which are built into the product. [ALM for developers](/power-platform/alm/alm-for-developers) uses Microsoft Power Platform Build Tools, GitHub Actions for Microsoft Power Platform, and Power Platform CLI, which give code-first developers more flexibility. Power Pages supports both approaches:

| | Built-in tools | Developer tools |
|---|---|---|
| **Supported site types** | Enhanced data model sites and SPA code sites | Standard data model sites, enhanced data model sites, and SPA code sites |
| **Primary users** | Makers, admins, and fusion development teams | Code-first developers |
| **Where source control lives** | Git integration in development environments. Commits and pulls happen from the solution's **Source control** page. | A Git repository that you manage, populated with files from Power Platform CLI |
| **How you deploy** | Managed solutions through pipelines in Power Platform | Azure Pipelines with Build Tools, GitHub workflows with GitHub Actions, or Power Platform CLI |
| **How you set environment-specific values** | Environment variables with site settings, with target values provided when you deploy with pipelines | Deployment profiles for standard data model sites, and deployment settings files for solutions |

You can combine both approaches. Use pipelines in Power Platform for core deployment, and [extend pipelines](/power-platform/alm/extend-pipelines) when you also need to integrate with other CI/CD tools.

For help deciding, see [Plan ALM for Power Pages](plan-alm.md). To get started, see [Add a site to a solution](power-pages-solutions.md) for built-in tools, or [Overview of ALM with developer tools](developer-tools-overview.md).

## Choose an ALM path based on site type

Every path uses separate development, test, and production environments. To plan them, see [Environment strategy](/power-platform/alm/environment-strategy-alm). The way you capture and promote the site depends on its data model and type:

- **Standard data model site:** Move website configuration between environments by using developer tools: Power Platform CLI, Microsoft Power Platform Build Tools, or GitHub Actions for Microsoft Power Platform. You can't add standard data model website configuration to a Dataverse solution or deploy it through pipelines in Power Platform.
- **Enhanced data model site:** Add the site and its components to a Dataverse solution, and then promote the solution as a managed solution, preferably through pipelines in Power Platform.
- **SPA code site:** Build the SPA from source and upload its source files and compiled assets to a development environment with Power Platform CLI. They become components of the site, so you track them in a Dataverse solution and promote them as a managed solution, the same way as an enhanced data model site.

> [!IMPORTANT]
> Dataverse solutions and pipelines in Power Platform require the [enhanced data model](/power-pages/admin/enhanced-data-model). Standard data model sites can't use solution-based ALM.

| Site type | Developer inner loop | Source control | Promotion to test and production | Detailed guidance |
|---|---|---|---|---|
| Standard data model site | Design studio, or `pac pages download` and `pac pages upload` | Files from `pac pages download` in a repository that you manage | Power Platform CLI, Microsoft Power Platform Build Tools, or GitHub Actions for Microsoft Power Platform | [Overview of ALM with developer tools](developer-tools-overview.md) |
| Enhanced data model site | Design studio, or `pac pages download` and `pac pages upload` with `--modelVersion 2` | Git integration in development environments | Managed solution through pipelines in Power Platform, or managed solution export and import | [Use solutions with Power Pages](power-pages-solutions.md), [Deploy Power Pages sites with pipelines in Power Platform](power-pages-pipelines.md), and [Use Git integration with Power Pages](power-pages-source-control.md) |
| SPA code site | Framework source and build tools, plus `pac pages upload-code-site` | Git integration in development environments | Managed solution through pipelines in Power Platform, or managed solution export and import | [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md) |

To check whether a site uses the standard or enhanced data model, run `pac pages list -v` with [Power Platform CLI](/power-pages/configure/power-platform-cli). For other methods, see [Determine whether your site uses the standard or enhanced data model](/power-pages/admin/enhanced-data-model#determine-whether-your-site-uses-the-standard-or-enhanced-data-model).

## Standard data model sites

Standard data model sites store website configuration in the legacy Power Pages tables. This configuration isn't solution-aware, so you can't promote it with Dataverse solutions or pipelines in Power Platform. Instead, use developer tools: download the configuration as files with Power Platform CLI, store those files in source control, and upload them to each target environment manually or through Microsoft Power Platform Build Tools or GitHub Actions for Microsoft Power Platform. For details, see [Overview of ALM with developer tools](developer-tools-overview.md).

## Enhanced data model sites

Enhanced data model sites store website configuration in Power Pages system tables that are solution-aware. Package the site and its dependencies in a Dataverse solution and promote the same managed solution through each environment. For how solutions and managed deployment work, see [Solution concepts](/power-platform/alm/solution-concepts-alm) and [Move from unmanaged to managed solutions](/power-platform/alm/move-from-unmanaged-managed-alm).

Power Pages adds these requirements:

- Add the site and all required site components to the solution.
- Site components that you create after you add the site to a solution aren't added automatically. Add new components to the solution before every release.
- Add related Dataverse tables separately. Dataverse tables associated with site components aren't added automatically.
- Use [environment variables with site settings](environment-variables-for-site-settings.md) for values that differ by environment.
- Reactivate the site after its first deployment to a target environment.
- [Clear the server-side cache](/power-pages/admin/clear-server-side-cache) on the target site when changes don't appear after a deployment.
- Don't edit site configuration directly in test or production. Edits in a target environment create an unmanaged layer that hides later managed solution updates. For details, see [Solution layers](/power-platform/alm/solution-layers-alm).
- In development, commit site changes to Git and pull changes made by other team members through Git integration. For details, see [Use Git integration with Power Pages](power-pages-source-control.md#work-with-changes).

For procedures, see:

- [Use solutions with Power Pages](power-pages-solutions.md)
- [Deploy Power Pages sites with pipelines in Power Platform](power-pages-pipelines.md)
- [Use Git integration with Power Pages](power-pages-source-control.md)

## SPA code sites

SPA code sites use the same solutions, source control integration, and promotion as enhanced data model sites. They differ in where changes start and in what the site stores:

- **Changes start in code.** You edit the SPA's framework source locally and build it with the framework's tools. Changes reach the site only when you upload them with `pac pages upload-code-site`. In an enhanced data model site, changes that you make in design studio are tracked in the environment directly.
- **The site stores source files and compiled assets.** When `includeSource` is `true` in `powerpages.config.json`, the upload stores the SPA source files as source file components of the site, in addition to the compiled web files. Both are site components, so they belong in the site's solution, are committed to Git through Git integration, and are promoted with the managed solution.
  <!-- SME: reconcile with platform code-first guidance (two copies in source control) -->
- **The repository holds the whole SPA project.** Git integration writes a code site to `powerpagescodesites/<site-name>/`. Source files keep their project paths, such as `src/App.tsx`, and site components, including compiled web files, go under `.powerpages-site/`. Developers clone this folder to work on the SPA locally.
- **The build doesn't run in target environments.** Solution import deploys the compiled web files that you uploaded in development. Build and upload the release-ready assets before you package the solution.

A typical inner loop for an SPA code site:

1. Clone the branch that your development environment is connected to, and open the `powerpagescodesites/<site-name>/` folder.
2. Edit, build, and test the SPA locally.
3. Upload the source files and compiled assets to the development environment with `pac pages upload-code-site`, and validate the site.
4. Commit the uploaded changes from the solution's **Source control** page, and then complete a pull request.

To promote the site, follow the same steps as for an enhanced data model site.

For the complete workflow, see [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md). For SPA setup and Power Platform CLI commands, see [Create and deploy a single-page application in Power Pages](/power-pages/configure/create-code-sites).

## Understand what moves between environments

| Component | Standard data model site | Enhanced data model or SPA code site |
|---|---|---|
| Pages, templates, web files, site settings, web roles, and table permissions | `pac pages upload`, Microsoft Power Platform Build Tools, or GitHub Actions for Microsoft Power Platform | Dataverse solution |
| SPA source files and compiled assets | Not applicable | Dataverse solution, as source file and web file components of the site |
| Dataverse tables, columns, and cloud flows | Solution, deployed separately from the website configuration | Dataverse solution |
| Business or reference data records | Separate data migration process | Separate data migration process |
| Environment-specific values | [Deployment profiles](/power-pages/configure/power-platform-cli-tutorial#upload-the-changes-using-deployment-profile) applied during upload | [Environment variables for site settings](environment-variables-for-site-settings.md) and connection references. Provide target values when you [deploy with pipelines](environment-variables-for-site-settings.md#pipelines), or in a [deployment settings file](/power-platform/alm/conn-ref-env-variables-build-tools) for Build Tools and GitHub Actions. |
| Secrets | Don't commit secrets. Supply them at deployment from your CI/CD system's secret store. | [Environment variables backed by Azure Key Vault secrets](environment-variables-for-site-settings.md#configure-environment-variables-as-secrets) |

For more about environment-specific values, see [Manage environment-specific values in Power Pages ALM](environment-specific-values.md).

## Use source control integration

Store the files that represent your site in a Git repository and use pull requests to review changes before they reach a shared environment. Source control is the source of truth for development changes. The approach depends on the site type:

| Site type | Recommended source control approach |
|---|---|
| Standard data model site | Commit the website configuration files produced by `pac pages download`, and promote them with CI/CD. Git integration isn't available because standard data model configuration isn't solution-aware. |
| Enhanced data model site | Use [Git integration](power-pages-source-control.md). Changes that you make in design studio are tracked in the solution that's connected to Git. Commit them from the solution's **Source control** page. Git integration writes the site to `powerpagesites/<site-name>/`. |
| SPA code site | Use [Git integration](power-pages-source-control.md). Upload the SPA source files and compiled assets to development with `pac pages upload-code-site`. They become components of the site in the solution that's connected to Git, so you commit them from the solution's **Source control** page together with the rest of the site. Git integration writes the site to `powerpagescodesites/<site-name>/`. |

Git integration for Power Pages uses [Dataverse Git integration](/power-platform/alm/git-integration/overview), so the platform guidance for connecting environments, binding strategies, and team development applies. Connect only development environments to Git, and deploy managed solutions to downstream environments, such as test and production. Environment binding is the recommended starting point for a binding strategy. If the site and its dependencies are split across solutions that share components, use environment binding. For details, see [How to choose between environment and solution binding](/power-platform/alm/git-integration/connecting-to-git#how-to-choose-between-environment-and-solution-binding).

If you can't use Git integration, use developer tools. For details, see [Set up source control and branching for Power Pages](source-control-developer-tools.md) and [CI/CD for single-page applications with developer tools](spa-developer-tools.md).

## Related content

- [Plan ALM for Power Pages](plan-alm.md)
- [Application lifecycle management with Microsoft Power Platform](/power-platform/alm/)
- [Enhanced data model](/power-pages/admin/enhanced-data-model)
- [Use solutions with Power Pages](power-pages-solutions.md)
- [Use Git integration with Power Pages](power-pages-source-control.md)
- [Deploy Power Pages sites with pipelines in Power Platform](power-pages-pipelines.md)
- [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md)
- [Overview of ALM with developer tools](developer-tools-overview.md)
- [Set up source control and branching for Power Pages](source-control-developer-tools.md)
- [Automate Power Pages deployments with Microsoft Power Platform Build Tools](build-tools.md)
- [Automate Power Pages deployments with GitHub Actions](github-actions.md)
- [Manage environment-specific values in Power Pages ALM](environment-specific-values.md)
- [CI/CD for single-page applications with developer tools](spa-developer-tools.md)
- [Roll back and hotfix Power Pages releases](rollback-hotfix.md)
- [Troubleshoot Power Pages ALM](troubleshoot-alm.md)
- [Power Pages ALM white paper](/power-pages/guidance/white-papers/application-lifecycle-management)
- [Overview of Git integration in Power Platform](/power-platform/alm/git-integration/overview)
- [Microsoft Power Platform CLI support for Power Pages](/power-pages/configure/power-platform-cli)
