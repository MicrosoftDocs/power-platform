---
title: Overview of ALM with developer tools
description: Learn how Power Platform CLI, Microsoft Power Platform Build Tools, and GitHub Actions support code-first ALM for Power Pages sites of every type.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: overview
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# Overview of ALM with developer tools

Developer tools give code-first developers control over how a Power Pages site moves from development to production. You keep the site in a Git repository that you manage, review changes through pull requests, and deploy with Azure Pipelines or GitHub workflows.

This article describes when to use developer tools and how they fit together. It follows [ALM for developers](/power-platform/alm/alm-for-developers) in the Power Platform documentation. For the built-in alternative, see [Use Git integration with Power Pages](power-pages-source-control.md) and [Deploy Power Pages sites with pipelines in Power Platform](/power-pages/configure/power-pages-pipelines).

## When to use developer tools

- **Standard data model sites:** Developer tools are required. Standard data model configuration isn't solution-aware, so you can't promote it with Dataverse solutions, Git integration, or pipelines in Power Platform. Download the configuration as files, store them in source control, and upload them to each target environment.
- **Enhanced data model sites and SPA code sites:** Developer tools are optional. Consider them when you need code-first flexibility, when your organization already invests in Azure DevOps or GitHub, or when you need custom quality gates in your release process.

To check which data model a site uses, see [Plan ALM for Power Pages](plan-alm.md#identify-your-sites-data-model).

## How the toolchain fits together

A typical developer tools workflow looks like this:

1. Download the site from a development environment with Power Platform CLI.
2. Commit the files to a feature branch in your repository.
3. Open a pull request, and merge the reviewed change into the main branch.
4. Run CI/CD in Azure Pipelines or GitHub Actions to package the change as an artifact.
5. Deploy the artifact to a test environment.
6. Validate the site in test.
7. After approval, deploy the same artifact to production.

## Tools

### Power Platform CLI

[Power Platform CLI](/power-pages/configure/power-platform-cli) downloads and uploads Power Pages site content. For a walkthrough, see [Tutorial: Use Microsoft Power Platform CLI with Power Pages](/power-pages/configure/power-platform-cli-tutorial).

| Command | Use it to |
|---|---|
| `pac pages download` | Download design studio site content. Use `--modelVersion 1` for standard data model sites or `--modelVersion 2` for enhanced data model sites. |
| `pac pages upload` | Upload design studio site content. Use `--modelVersion` to match the data model, and `--deploymentProfile` to apply environment-specific values during upload. |
| `pac pages download-code-site` | Download an SPA code site. |
| `pac pages upload-code-site` | Upload an SPA code site to a development environment. |

Use `pac pages upload-code-site` and `pac pages download-code-site` for SPA code sites. The `pac pages upload` and `pac pages download` commands are for design studio sites.

### Microsoft Power Platform Build Tools

[Microsoft Power Platform Build Tools](/power-platform/alm/devops-build-tools) add Power Platform tasks to Azure Pipelines. For Power Pages, use:

- **Power Platform Download PAPortal** and **Power Platform Upload PAPortal** to move design studio site content.
- Solution tasks, such as **Power Platform Export Solution** and **Power Platform Import Solution**, to move enhanced data model and SPA code sites as solutions.

For details, see [Automate Power Pages deployments with Microsoft Power Platform Build Tools](build-tools.md).

### GitHub Actions for Microsoft Power Platform

[GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-actions) add Power Platform actions to GitHub workflows. For Power Pages, use:

- The `upload-paportal` portal task to upload design studio site content to a target environment.
- Solution actions, such as `export-solution` and `import-solution`, to move enhanced data model and SPA code sites as solutions.

For details, see [Automate Power Pages deployments with GitHub Actions](github-actions.md).

## Combine developer tools with pipelines in Power Platform

Developer tools and built-in tools work together. Power Platform recommends that you use pipelines for core deployment and [extend pipelines](/power-platform/alm/extend-pipelines) when you need to integrate with other CI/CD tools. For example, you can run a GitHub workflow as part of a pipeline. For details, see [Extend pipelines using GitHub Actions](/power-platform/alm/extend-pipelines-github-export).

## Enhanced data model sites with developer tools

Enhanced data model sites are solution-aware, so you can promote them with solutions even when you use developer tools. Add the site and its dependencies to a solution as described in [Use solutions with Power Pages](/power-pages/configure/power-pages-solutions), and then export and import the solution with Build Tools or GitHub Actions. Provide environment-specific values in a [deployment settings file](/power-platform/alm/conn-ref-env-variables-build-tools).

<!-- SME: confirm recommended pattern (solution export/pack vs pac pages download --modelVersion 2) -->

For SPA code sites, see [CI/CD for single-page applications with developer tools](spa-developer-tools.md).

## Next steps

- [Set up source control and branching for Power Pages](source-control-developer-tools.md)
- [Automate Power Pages deployments with Microsoft Power Platform Build Tools](build-tools.md)
- [Automate Power Pages deployments with GitHub Actions](github-actions.md)

## Related content

- [Plan ALM for Power Pages](plan-alm.md)
- [Manage environment-specific values in Power Pages ALM](environment-specific-values.md)
- [Roll back and hotfix Power Pages releases](rollback-hotfix.md)
- [Troubleshoot Power Pages ALM](troubleshoot-alm.md)
- [ALM for developers](/power-platform/alm/alm-for-developers)
- [Microsoft Power Platform Build Tools tasks](/power-platform/alm/devops-build-tool-tasks)
- [Available GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-available-actions)
