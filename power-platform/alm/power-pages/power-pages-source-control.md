---
title: Use Git integration with Power Pages (preview)
description: Learn how to connect Power Pages development environments to Git, commit and pull site changes, and use Git integration as part of Power Pages application lifecycle management.
author: neerajnandwana-msft
ms.topic: how-to
ms.date: 11/13/2026
ms.author: nenandw
ms.reviewer: smurkute
contributors:
  - tyaginidhi
  - neerajnandwana-msft
ai-usage: ai-assisted
---

# Use Git integration with Power Pages (preview)

[!INCLUDE [cc-preview-features-top-note](../../includes/cc-preview-features-top-note.md)]

By using Git integration, your team can version a Power Pages site and its related solution components in Git. It's built on [Dataverse Git integration](/power-platform/alm/git-integration/overview): you connect a development environment to a Git repository, and then commit site changes to Git and pull changes made by other team members from the **Source control** page of a solution. Source control is the source of truth for development changes.

[!INCLUDE [cc-preview-features-standard-important-note](../../includes/cc-preview-features-standard-important-note.md)]

Use Git integration to:

- Track and review every change to a site through commits and pull requests.
- Let multiple makers and developers work in separate development environments and share changes through a common branch.
- Bring another development environment up to date with the changes in Git.
- Keep SPA source code, compiled assets, and site configuration together in one repository.

Git integration is part of the developer inner loop. It doesn't deploy sites to downstream environments, such as test and production. Use [pipelines in Power Platform](power-pages-pipelines.md) or managed [solutions](power-pages-solutions.md) to promote the site. For how Git integration fits into each ALM path, see [Overview of Power Pages ALM](portals-alm.md).

## Supported sites

| Site type | Supported | Notes |
|---|---|---|
| Enhanced data model site | Yes | Site components are committed as part of the solution. |
| SPA code site | Yes | Source files and compiled web files are committed together with site components. See [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md). |
| Standard data model site | No | Standard data model configuration isn't solution-aware. Use developer tools, such as `pac pages download` and a repository that you manage. See [Overview of ALM with developer tools](developer-tools-overview.md). |

## Prerequisites

- Development and target environments enabled as [Managed Environments](/power-platform/admin/managed-environment-overview). Dataverse Git integration is a Managed Environments feature.
- The System Administrator security role in each development environment that you connect to Git.
- A development environment that uses the [enhanced data model](/power-pages/admin/enhanced-data-model).
- A Power Pages site added to a custom unmanaged solution in that environment. You can't connect the default solution to Git. See [Use solutions with Power Pages](power-pages-solutions.md).
- A Git repository in Azure DevOps, with licenses and commit permissions for every user who uses Git integration. For prerequisites, see [Connect to Azure DevOps](/power-platform/alm/git-integration/connecting-to-azure-devops).

## Plan your source control setup

Git integration for Power Pages follows the platform guidance for [Git integration](/power-platform/alm/git-integration/overview) and [team development](/power-platform/alm/team-development-alm). Make these Power Pages-specific decisions before you connect:

- **Which environments to connect.** Connect only development environments. Deploy managed solutions to downstream environments, such as test and production, instead.
- **Binding strategy.** Environment binding is the recommended starting point. If the site and its dependencies are split across solutions that share components, such as shared tables or web roles, use environment binding. For the differences, see [How to choose between environment and solution binding](/power-platform/alm/git-integration/connecting-to-git#how-to-choose-between-environment-and-solution-binding).
- **Branch strategy.** Each connected environment syncs with one branch. A common approach is to connect each developer's environment to a feature branch, merge feature branches into an integration branch, such as `main`, through pull requests, and connect the primary development environment to the integration branch.
- **Multiple developers.** To get changes that other developers merged, merge the integration branch into your feature branch in your Git provider, and then select **Check for updates** and **Pull**. For connection requirements, see [Connect multiple development environments to Git](/power-platform/alm/git-integration/connecting-to-git#connect-multiple-development-environments-to-git).
- **Primary development environment.** Choose one development environment, connected to the integration branch, as the source for release solutions. Pull merged changes into it before you package a release.

## Connect a development environment to Git

1. Open [Power Pages](https://make.powerpages.microsoft.com/), select the development environment, and then select **Solutions**.
2. Connect the environment to Git by following [Connect to Git](/power-platform/alm/git-integration/connecting-to-git) for your provider.
3. Open the solution that contains the site and select **Source control** to validate the connection.

A site that you import into another development environment so you can connect it is inactive. [Reactivate the site](power-pages-solutions.md#reactivate-the-site-in-the-target-environment) before you validate it.

## Understand the repository layout

Git integration writes each site to its own folder alongside the other solution objects:

```text
<Git folder>/
├── entities/
├── publishers/
├── solutions/
├── powerpagesites/
│   └── <site-name>/              # Design studio site (enhanced data model)
│       ├── web-pages/
│       ├── web-files/
│       ├── site-settings/
│       └── <other site component folders>
└── powerpagescodesites/
    └── <site-name>/              # SPA code site
        ├── src/                  # SPA source, when includeSource is true
        ├── powerpages.config.json
        └── .powerpages-site/
            ├── website.yml
            ├── source-files/     # Source-file metadata
            ├── web-files/        # Compiled HTML, CSS, and JavaScript
            ├── site-settings/
            ├── table-permissions/
            └── <other site component folders>
```

Design studio sites store site component folders directly under `powerpagesites/<site-name>/`. SPA code sites store them under `powerpagescodesites/<site-name>/.powerpages-site/`, so that the SPA project files stay at the root of the site folder. If two components in the same folder have the same name, Git integration appends a hash to the file name.

## Work with changes

Use **Check for updates**, **Pull**, and **Commit** on the solution's **Source control** page, and resolve conflicts, as described in [Source control repository operations](/power-platform/alm/git-integration/source-control-operations). For Power Pages sites:

- After you pull, validate the site before you commit. If a pulled change doesn't appear on the site, [clear the server-side cache](/power-pages/admin/clear-server-side-cache).
- Before you commit, add any new site components to the solution. Components that aren't in the solution aren't tracked.
- After you commit, open a pull request in your Git provider to merge the changes into your integration branch.

### Design studio sites

Changes that you make in design studio or the Power Pages Management app are tracked as pending changes in the solution. Commit them through **Source control**.

### SPA code sites

Upload SPA changes to the development site with `pac pages upload-code-site`, and then commit them through **Source control**. Set `includeSource` to `true` in `powerpages.config.json` so that the upload stores source files as components of the site. Source files and compiled web files are then committed together with the rest of the site and promoted with the solution. For the full workflow, see [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md).

<!-- SME: reconcile with platform code-first guidance (two copies in source control) -->

## Promote changes to test and production

Git integration doesn't deploy to downstream environments. After you merge changes:

1. Pull the merged changes into the primary development environment, which is connected to the integration branch, and validate the site.
2. Add any new site components and dependencies to the solution, and increment its version.
3. Deploy the solution as managed through [pipelines in Power Platform](power-pages-pipelines.md) or managed solution export and import.

## Limitations and considerations

- A commit includes all pending changes in the solution. Remove an object from the solution before you commit if it isn't ready.
- Site components that you create after you add the site to a solution aren't added to the solution automatically. Add them before you commit, or they aren't tracked.
- Related Dataverse tables aren't added automatically when you add a site to a solution. Add them separately.
- Standard data model sites aren't supported.
- When a site component is deleted in Git, **Pull** asks whether to remove it from the solution or delete it from the environment. For details, see [Pull changes](/power-platform/alm/git-integration/source-control-operations#pull-changes-available-from-source-control-repository).
- Renaming a site component changes its path in Git. Commit a rename separately from other changes, and don't rename the same component in Git and in an environment before they're in sync. After you commit or pull a rename, select **Check for updates** and confirm that no changes or conflicts remain for the renamed component or its child components, such as form metadata, advanced form steps, and content pages.
- Don't store secrets or environment-specific values in committed files. Use environment variables and secret environment variables.

## Troubleshoot source control

| Symptom | Likely cause | Resolution |
|---|---|---|
| **Site** isn't available when you add existing objects to a solution | The site uses the standard data model | Use the CLI-based approach for standard data model sites, or [migrate the site to the enhanced data model](/power-pages/admin/migrate-enhanced-data-model) |
| A site component isn't in the commit | The component isn't in the solution | Add it with **Add existing** > **Site** > **Site Component**, and then commit |
| Objects you didn't change appear in **Changes** | Another solution component changed, or the environment was updated outside source control | Review the changes before you commit, and remove objects that aren't ready |
| Commit or pull is blocked by conflicts | The same object changed in the environment and in Git | Resolve the conflicts as described in [Conflict resolution](/power-platform/alm/git-integration/source-control-operations#conflict-resolution), pull, validate the site, and then commit |
| Shared component can't be added to a second bound solution | Solution binding allows each object in only one source location | Use environment binding for split solutions that share components |
| SPA source isn't in the repository | `includeSource` is `false`, or the upload wasn't committed | Set `includeSource` to `true`, upload again, and commit |
| Pulled changes don't appear on the site | The site cache is stale | [Clear the server-side cache](/power-pages/admin/clear-server-side-cache) |

## Related content

- [Overview of Power Pages ALM](portals-alm.md)
- [Plan ALM for Power Pages](plan-alm.md)
- [Develop and promote a Power Pages SPA code site across environments](power-pages-spa-alm.md)
- [Use solutions with Power Pages](power-pages-solutions.md)
- [Deploy Power Pages sites with pipelines in Power Platform](power-pages-pipelines.md)
- [Set up source control and branching for Power Pages](source-control-developer-tools.md)
- [Overview of Git integration in Power Platform](/power-platform/alm/git-integration/overview)
- [Connect to Git](/power-platform/alm/git-integration/connecting-to-git)
- [Source control repository operations](/power-platform/alm/git-integration/source-control-operations)
