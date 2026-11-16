---
title: Set up source control and branching for Power Pages
description: Learn how to download a Power Pages site with Power Platform CLI, store it in Git, configure .gitignore, and use a branching strategy with developer tools.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: how-to
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# Set up source control and branching for Power Pages

When you use developer tools, you store the Power Pages site in a Git repository that you manage. You download the site with Power Platform CLI, commit the files, and review changes through pull requests before CI/CD deploys them.

Use this approach for standard data model sites, which can't use Git integration. You can also use it for enhanced data model and SPA code sites when you can't use Git integration. If you can, Git integration is the recommended starting point for those sites. For details, see [Use Git integration with Power Pages](power-pages-source-control.md).

## Prerequisites

- [Power Platform CLI](/power-platform/developer/cli/introduction), installed and authenticated to the development environment. For steps, see [Tutorial: Use Microsoft Power Platform CLI with Power Pages](/power-pages/configure/power-platform-cli-tutorial).
- A Git repository in Azure DevOps, GitHub, or another Git provider, with permission to create branches and pull requests.
- The site ID and data model of the site. Run `pac pages list -v` to list the sites in the environment and show whether each one uses the standard or enhanced data model.

## Download the site into your repository

Download the site from the development environment into a folder in your local clone of the repository.

- **Standard data model sites:** Use `pac pages download` with `--modelVersion 1`.

    ```powershell
    pac pages download --path "C:\repos\contoso-site" --webSiteId <website-id> --modelVersion 1
    ```

- **Enhanced data model sites:** Use `pac pages download --modelVersion 2`.

    ```powershell
    pac pages download --path "C:\repos\contoso-site" --webSiteId <website-id> --modelVersion 2
    ```

- **SPA code sites:** Use `pac pages download-code-site`, or commit the SPA project that you upload with `pac pages upload-code-site`. For the SPA workflow, see [CI/CD for single-page applications with developer tools](spa-developer-tools.md).

<!-- SME: confirm required parameters for pac pages download-code-site -->

Use `--overwrite` when you download into a folder that already contains site content. For all parameters, see [Microsoft Power Platform CLI support for Power Pages](/power-pages/configure/power-platform-cli#microsoft-power-platform-cli-commands-for-portals).

Promote enhanced data model and SPA code sites with solutions, even when you store their files in a repository that you manage. For details, see [Overview of ALM with developer tools](developer-tools-overview.md#enhanced-data-model-sites-with-developer-tools).

## Configure .gitignore

When you run `pac pages download`, it generates two [manifest files](/power-pages/configure/power-platform-cli#manifest-files) along with the site content. Treat these files differently in source control:

- **`org-url-manifest.yml`:** The [environment manifest file](/power-pages/configure/power-platform-cli#environment-manifest-file-org-url-manifestyml) tracks changes since the last download from one specific environment. This tracking helps ensure that uploads to the same environment include only changed content. This file isn't designed to track changes across environments. Add it to `.gitignore`.
- **`manifest.yml`:** The [delete tracking manifest file](/power-pages/configure/power-platform-cli#delete-tracking-manifest-file-manifestyml) tracks records that you delete from the environment. Power Platform CLI uses it regardless of which environment you're connected to, so an upload can delete the same records in a different environment. Keep it in source control.

Also, exclude files that contain secrets. For SPA code sites, don't commit build output or `node_modules`.

A `.gitignore` entry for the environment manifest file might look like this:

```text
# Environment-specific Power Platform CLI manifest
*-manifest.yml
!manifest.yml
```

<!-- SME: confirm the exact environment manifest file name pattern for the .gitignore example -->

## Suggested repository structure

The following structure is a recommendation. Adapt it to your team's conventions.

```text
<repository>/
├── site/                       # Output of pac pages download
│   ├── deployment-profiles/    # Deployment profiles for each target environment
│   │   ├── test.deployment.yml
│   │   └── prod.deployment.yml
│   ├── manifest.yml            # Delete tracking manifest, kept in source control
│   └── <site content folders>
├── pipelines/                  # Azure Pipelines or GitHub workflow definitions
└── .gitignore
```

For more information about deployment profiles, see [Manage environment-specific values in Power Pages ALM](environment-specific-values.md).

## Branching strategy

Branches serve the developer inner loop. Deploy to downstream environments through CI/CD, not by merging branches that environments sync with.

- **Main branch:** Holds the reviewed state of the site. CI/CD builds release artifacts from this branch.
- **Feature branches:** Each developer works in a feature branch, uploads changes to their own development environment, and downloads the result to commit.
- **Pull requests:** Merge feature branches into the main branch through pull requests so that changes are reviewed before they're released.
- **Hotfix branches:** Create a hotfix branch from the tag of the release that's in production. For details, see [Roll back and hotfix Power Pages releases](rollback-hotfix.md).

Before you start new work, pull the latest main branch into your feature branch, and upload it to your development environment so that the environment and the branch match.

## Understand delta and full uploads

`pac pages upload` uses the environment manifest file to decide what to upload:

- **Delta upload:** When you download from and upload to the same environment, Power Platform CLI detects local changes and uploads only the updated files.
- **Full upload:** When you download from one environment and upload to another, Power Platform CLI uploads all content. The manifest files don't carry state across environments.

Use `--forceUploadAll` to push all local files when you suspect a delta upload failed, for example when only part of your changes appear, or when the last server state no longer matches your branch because you rebased or cherry-picked commits. This parameter is available only in Power Platform CLI. Azure DevOps tasks don't surface it.

## Delete records across environments

To delete site records in one environment and delete the same records in another environment:

1. Run `pac pages download` before you delete the records.
2. Delete the records in the development environment.
3. Run `pac pages download` again. The delete tracking manifest file, `manifest.yml`, records the deletions.
4. Commit `manifest.yml` with the rest of your changes.
5. Run `pac pages upload` against the target environment. The upload removes the corresponding records.

## Related content

- [Overview of ALM with developer tools](developer-tools-overview.md)
- [Microsoft Power Platform CLI support for Power Pages](/power-pages/configure/power-platform-cli)
- [Tutorial: Use Microsoft Power Platform CLI with Power Pages](/power-pages/configure/power-platform-cli-tutorial)
- [Automate Power Pages deployments with Microsoft Power Platform Build Tools](build-tools.md)
- [Automate Power Pages deployments with GitHub Actions](github-actions.md)
- [ALM for developers](/power-platform/alm/alm-for-developers)
