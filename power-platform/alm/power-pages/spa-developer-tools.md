---
title: CI/CD for single-page applications with developer tools
description: Learn how to develop, review, and promote a Power Pages SPA code site with Power Platform CLI and CI/CD when you can't use Git integration.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: how-to
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# CI/CD for single-page applications with developer tools

Use Git integration to track a single-page application (SPA) code site in source control. Some organizations can't connect development environments to Git. This article describes how those teams can keep the SPA project in a repository that they manage and still promote the site with solutions.

For the full SPA workflow with Git integration, see [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md).

## Prerequisites

- A Power Pages SPA code site in a development environment. SPA code sites always use the enhanced data model.
- [Power Platform CLI](/power-platform/developer/cli/introduction), installed and authenticated.
- A Git repository that you manage, in Azure DevOps, GitHub, or another Git provider.
- The site added to a custom unmanaged solution in the primary development environment. For details, see [Use solutions with Power Pages](/power-pages/configure/power-pages-solutions).

## Use the developer inner loop

If your organization can't connect development environments to Git, keep the SPA project in a repository that you manage and use this inner loop instead:

1. Develop on a feature branch, build, and upload to a development site with `pac pages upload-code-site`.
2. Review and merge the change through a pull request.
3. Build the merged commit and upload it to the primary development environment. You can run this step manually or automate it in Azure Pipelines or GitHub Actions, authenticating Power Platform CLI with a service principal. For details, see [pac auth create](/power-platform/developer/cli/reference/auth#pac-auth-create).
4. Continue with [Prepare the solution for promotion](power-pages-spa-alm.md#prepare-the-solution-for-promotion).

In this approach, don't commit build output, `node_modules`, or files that contain secrets. Build the compiled assets from a known commit instead.

To start from a site that already exists in an environment, download it with `pac pages download-code-site`. Use `pac pages upload-code-site` and `pac pages download-code-site` for SPA code sites. The `pac pages upload` and `pac pages download` commands are for design studio sites.

<!-- SME: confirm required parameters for pac pages download-code-site, and whether upload-code-site with includeSource is relevant when the repository is the source of truth -->

## Automate the upload to the primary development environment

Step 3 of the inner loop builds the merged commit and uploads it to the primary development environment. To automate it:

1. Trigger a pipeline or workflow when a pull request merges into the main branch.
2. Install dependencies and run the SPA build, such as `npm run build`.
3. Authenticate Power Platform CLI with a service principal by using [pac auth create](/power-platform/developer/cli/reference/auth#pac-auth-create). Store the credentials as pipeline secrets or GitHub secrets.
4. Run `pac pages upload-code-site` against the primary development environment.

Record the commit and build identifier for each upload so that you can trace a release back to its source. For details, see [Record release traceability](power-pages-spa-alm.md#record-release-traceability).

## Promote with solutions

After the primary development environment has the approved build, promote the site the same way as any SPA code site:

1. Add new site components and dependencies to the solution, and increment its version. For details, see [Prepare the solution for promotion](power-pages-spa-alm.md#prepare-the-solution-for-promotion).
2. Deploy the solution as managed to test and production. Use [pipelines in Power Platform](power-pages-spa-alm.md#deploy-with-pipelines-in-power-platform), or automate managed solution export and import with [Microsoft Power Platform Build Tools](build-tools.md) or [GitHub Actions for Microsoft Power Platform](github-actions.md).
3. Provide environment-specific values for each target. Don't compile them into the SPA bundle. For details, see [Manage environment-specific values in Power Pages ALM](environment-specific-values.md).
4. Reactivate the site after its first deployment, clear the cache when required, and validate it.

## Don't upload directly to test or production

Don't run `pac pages upload-code-site` against test or production environments as a substitute for solution-based promotion. That approach doesn't move the site's Dataverse dependencies as one versioned artifact and creates unmanaged changes in the target environment.

## Related content

- [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md)
- [Overview of ALM with developer tools](developer-tools-overview.md)
- [Set up source control and branching for Power Pages](source-control-developer-tools.md)
- [Roll back and hotfix Power Pages releases](rollback-hotfix.md)
- [Troubleshoot Power Pages ALM](troubleshoot-alm.md)
