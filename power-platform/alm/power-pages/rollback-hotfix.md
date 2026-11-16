---
title: Roll back and hotfix Power Pages releases
description: Learn how to plan for rollback, redeploy a previous Power Pages release, and ship a hotfix with built-in tools or developer tools.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: how-to
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# Roll back and hotfix Power Pages releases

Even with testing, a release can introduce a problem in production. This article explains how to prepare so that you can return a Power Pages site to a known good release, and how to ship a targeted fix without releasing unfinished work.

## Plan for rollback

You can only roll back to a release that you can identify and reproduce. For every release:

- **Use four-part solution versions.** Use a version such as `1.2.0.0`, and increment it before you create a new deployable artifact. Don't reuse a version for different solution contents.
- **Tag the source.** Create a Git tag for the commit that produced the release.
- **Keep the artifacts.** Retain the managed solution file or the downloaded site content that you deployed, in your pipeline or CI/CD system.
- **Record release traceability.** Record the Git commit or tag, the build identifier, the solution unique name and version, the pipeline run or import record, the target environment, and the validation result. For details, see [Record release traceability](power-pages-spa-alm.md#record-release-traceability).

## Roll back with built-in tools

If you deploy enhanced data model or SPA code sites with pipelines in Power Platform, you can redeploy a previous solution version from the pipeline run history:

1. Ensure that the **Allow redeployments of older versions** setting is enabled for the pipeline.
2. On the **Pipelines** page, select the pipeline, and then select **Run history**.
3. Find the successful deployment that you want to redeploy, select the vertical ellipses next to the start time, and then select **Redeploy**.

For prerequisites and details, see [Redeploy past solution versions](/power-platform/alm/redeploy-past-solution-versions).

> [!WARNING]
> Redeploying overwrites the most recent version and any data within that version. This operation is irreversible, and the lost data is unrecoverable. Updates, including new tables, are also removed.

If the setting is disabled, you can deploy or import only higher solution versions. As a workaround, admins can download the artifact from the pipelines host, increment the solution version in the `solution.xml` file, and then import it manually into the target environment.

A managed solution rollback works only if nobody edited the site directly in the target environment. Those edits create an unmanaged layer that hides managed solution changes. For details, see [Solution layers and merge behavior](/power-platform/alm/solution-layers-alm).

After the rollback, clear the server-side cache and validate the site.

## Roll back with developer tools

By using developer tools, redeploy the tagged artifact of the last known good release:

- **Enhanced data model and SPA code sites:** Rerun the release pipeline or workflow for the tagged managed solution artifact. Use a higher solution version, or follow the workaround in the previous section, because only higher versions can be imported without the redeployment setting.
- **Standard data model sites:** Check out the release tag, and upload the site content to the target environment by using Power Platform CLI or your release pipeline. Use the deployment profile for the target environment.

<!-- SME: confirm handling of records created after the tag and whether --forceUploadAll is recommended -->

If anyone created records in the target environment after the tag, those records might remain after you upload the older content. Review the site for such records, and validate the site after the rollback.

## Ship a hotfix

To fix a production problem without releasing other work that's in progress:

1. Create a hotfix branch from the tag of the release that's in production.
2. Make the fix in a development environment that matches that branch, and commit it to the hotfix branch.
3. Build the release artifact from the hotfix branch. For solutions, increment the solution version.
4. Deploy the artifact to test and validate the fix.
5. After approval, deploy the same artifact to production, and tag the release.
6. Merge the hotfix branch back into the main branch so that the next release includes the fix.

If you use Git integration, connect the development environment that you use for the hotfix to the hotfix branch. For details, see [Use Git integration with Power Pages](power-pages-source-control.md#plan-your-source-control-setup).

## Test rollback in a sandbox

Don't wait for a production incident to try your rollback process. Periodically rehearse it in a sandbox environment:

1. Deploy two consecutive releases to a sandbox environment.
2. Roll back to the first release by using the process in this article.
3. Validate the site, including sign-in, Web API calls, and environment-specific values.
4. Record how long the rollback took and any manual steps that it needed.

## Related content

- [Plan ALM for Power Pages](plan-alm.md)
- [Deploy Power Pages sites with pipelines in Power Platform](/power-pages/configure/power-pages-pipelines)
- [Set up source control and branching for Power Pages](source-control-developer-tools.md)
- [Troubleshoot Power Pages ALM](troubleshoot-alm.md)
- [Redeploy past solution versions](/power-platform/alm/redeploy-past-solution-versions)
