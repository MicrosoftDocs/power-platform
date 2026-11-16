---
title: Troubleshoot Power Pages ALM
description: Find causes and resolutions for common problems when you deploy Power Pages sites across environments with built-in tools or developer tools.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: troubleshooting-general
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# Troubleshoot Power Pages ALM

This article describes common problems that you might encounter when you move Power Pages sites between environments, along with their causes and resolutions. For problems specific to one workflow, see [Troubleshoot source control](power-pages-source-control.md#troubleshoot-source-control) and [Troubleshoot common issues](power-pages-spa-alm.md#troubleshoot-common-issues) for SPA code sites.

## Changes aren't visible after deployment

**Cause:** The site in the target environment still serves cached configuration.

**Resolution:** Clear the server-side cache of the target site, and then validate the site. For details, see [How server-side caching works in Power Pages](/power-pages/admin/clear-server-side-cache).

## Target doesn't reflect a managed solution update

**Cause:** Someone edited the site directly in the target environment. The edit creates an unmanaged layer that sits above the managed solution and hides its changes.

**Resolution:** Remove the unmanaged layer from the affected components, and then make future changes only in development. For details, see [Solution layers and merge behavior](/power-platform/alm/solution-layers-alm). To prevent direct edits, see [Plan ALM for Power Pages](plan-alm.md).

## Imported site is inactive

**Cause:** The first deployment of a site to an environment imports the site configuration but doesn't activate the site.

**Resolution:** Reactivate the site in the target environment. For details, see [Reactivate the site in the target environment](/power-pages/configure/power-pages-solutions#reactivate-the-site-in-the-target-environment). Later deployments of the same site don't require reactivation.

## Site components are missing from the solution

**Cause:** The component was created after the site was added to the solution, so the solution doesn't include it.

**Resolution:** In the solution, select **Add existing** > **Site** > **Site Component**, add the missing components, and then export or deploy again.

## Pipeline reports missing dependencies

**Cause:** The solution references related tables, cloud flows, connection references, or environment variables that aren't in the solution or the target environment.

**Resolution:** Add the dependencies to the solution, or deploy them to the target environment first. Provide values for environment variables and connection references during deployment. For details, see [Deploy Power Pages sites with pipelines in Power Platform](/power-pages/configure/power-pages-pipelines).

## Web API returns 404 or an authorization error

**Cause:** A 404 error usually means that a required table or column isn't in the target environment. An authorization error usually means that a table permission, web role, Web API site setting, or authentication setting is missing.

**Resolution:** Add the Dataverse tables and columns, table permissions, web roles, and site settings to the solution, and then redeploy.

## Uploads are full instead of delta

**Cause:** Power Platform CLI uses the environment manifest file to upload only changed content. If that file is missing or was created for another environment, the upload includes all content.

**Resolution:** Keep the environment manifest file on the computer or agent that uploads to each environment, and don't commit it. For details, see [Understand delta and full uploads](source-control-developer-tools.md#understand-delta-and-full-uploads).

## Deleted records still appear in the target environment

**Cause:** A record was deleted from the local site content, but the delete wasn't tracked, so the upload didn't remove it from the target environment.

**Resolution:** Commit the delete-tracking manifest file so that uploads to other environments can apply the delete. For steps, see [Delete records across environments](source-control-developer-tools.md#delete-records-across-environments).

## Upload fails because a file is too large

**Cause:** A file in the site content exceeds the maximum attachment size of the target environment.

**Resolution:** Make sure that the target environment's maximum file size is at least as large as the source environment's. For details, see [Email tab](/power-platform/admin/system-settings-dialog-box-email-tab) in system settings.

## Upload fails because of long file paths on Windows

**Cause:** Downloaded site content can contain deep folder structures with file paths that exceed the Windows path length limit.

**Resolution:** Download the site to a folder with a short path, such as `C:\sites`. For details, see [Maximum path length limitation in Windows](/windows/win32/fileio/maximum-file-path-limitation).

## Solutions, Git integration, or pipelines aren't available for a site

**Cause:** The site uses the standard data model. Standard data model site configuration isn't solution-aware, so you can't add the site to a solution, commit it with Git integration, or deploy it with pipelines in Power Platform.

**Resolution:** Use developer tools for the standard data model site. For details, see [Overview of ALM with developer tools](developer-tools-overview.md). Alternatively, [migrate the site to the enhanced data model](/power-pages/admin/migrate-enhanced-data-model).

## Related content

- [Plan ALM for Power Pages](plan-alm.md)
- [Roll back and hotfix Power Pages releases](rollback-hotfix.md)
- [Manage environment-specific values in Power Pages ALM](environment-specific-values.md)
- [Microsoft Power Platform CLI commands for Power Pages](/power-pages/configure/power-platform-cli)
