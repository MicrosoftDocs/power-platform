---
title: Develop and promote a Power Pages SPA code site across environments
description: Learn how to combine Git integration, Power Platform CLI, Dataverse solutions, and pipelines in Power Platform to promote a single-page application (SPA) code site from development to production.
author: neerajnandwana-msft
ms.topic: how-to
ms.date: 11/02/2026
ms.author: nenandw
ms.reviewer: smurkute
contributors:
  - tyaginidhi
  - neerajnandwana-msft
ai-usage: ai-assisted
---

# Develop and promote a Power Pages SPA code site across environments

A Power Pages single-page application (SPA) code site has two connected lifecycle paths:

- **Source and build path (inner loop):** Develop, build, and test the SPA locally. Use Power Platform CLI to upload the source and compiled assets to a development environment, and use [Dataverse Git integration](power-pages-source-control.md) to commit the site and its solution components to Git.
- **Promotion path (outer loop):** Add the site and its Dataverse dependencies to a solution, and promote that solution as a managed solution to downstream environments, such as test and production, by using pipelines in Power Platform or solution export and import.

Git is the source of truth for development changes. The primary development environment holds the release-ready site. A managed Dataverse solution is the deployable artifact that moves between environments.

This article describes the end-to-end process. For SPA setup, `powerpages.config.json` fields, and Power Platform CLI command reference, see [Create and deploy a single-page application in Power Pages](/power-pages/configure/create-code-sites). For other site types, see [Overview of Power Pages ALM](portals-alm.md).

> [!IMPORTANT]
> Use one Git repository and branch strategy for the SPA project and its Power Pages solution components. Don't maintain a second repository only for SPA source. Connect only development environments to Git. Promote managed solutions to test and production instead of connecting those environments to Git.

## Scope

This article applies to static SPA code sites hosted in Power Pages, such as sites built with React, Angular, Vue, or statically built Astro projects. Server-rendered frameworks and design studio sites are out of scope.

## Prerequisites

- Development, test, and production environments that use the [enhanced data model](/power-pages/admin/enhanced-data-model) and are enabled as [Managed Environments](/power-platform/admin/managed-environment-overview). Dataverse Git integration is a Managed Environments feature.
- The System Administrator security role in each development environment that you connect to Git.
- A Power Pages SPA site on version 9.7.4.x or later in the development environment, and the required permissions in each environment.
- JavaScript (`.js`) file uploads allowed in each environment. For details, see [Allow JavaScript file uploads](/power-pages/configure/create-code-sites#allow-javascript-file-uploads).
- The development environment connected to a Git repository and branch through [Git integration](power-pages-source-control.md). Start with environment binding, which is the recommended starting point, and use it if the site is split across solutions that share components.
- A local clone of the connected repository and branch.
- Node.js and the package manager required by the SPA framework.
- [Power Platform CLI](/power-platform/developer/cli/introduction) version 1.44.x or later, installed and authenticated.
- A `powerpages.config.json` file in the SPA project root.
- An unmanaged Dataverse solution in the development environment that contains the site.
- A configured pipeline in Power Platform, if you plan to deploy with pipelines. For details, see [Set up pipelines in Power Platform](/power-platform/alm/set-up-pipelines).

## Architecture

The following architecture shows how local SPA development, Power Platform CLI, Git integration, Dataverse solutions, and pipelines in Power Platform form one governed ALM process.

<!-- FOLLOW-UP: regenerate diagram from SVG source with Git integration / pipelines in Power Platform terms -->
:::image type="complex" source="../media/power-pages/power-pages-spa-alm/power-pages-spa-alm-reference-architecture.png" alt-text="Diagram of the Power Pages SPA application lifecycle management reference architecture with Git integration and pipelines in Power Platform.":::
   The diagram shows six stages in two rows. First, the development environment is connected through Git integration to a Git repository in Azure DevOps that stores solution files and the code site under powerpagescodesites, and changes are reviewed through feature branches, pull requests, and CI. Second, in the developer inner loop, developers edit the source in src, run npm run build to produce compiled assets in dist, and use pac pages upload-code-site with includeSource set to true, validating and repeating as needed. Third, the development site holds the source file components and compiled web files; developers validate the site, pull and resolve conflicts, and commit through Git integration. Fourth, an unmanaged solution containing the site and its components, Dataverse dependencies, and environment variables is versioned and builds the managed solution. Fifth, pipelines in Power Platform deploy it with preflight validation, environment values, connection references, approvals, and history. Sixth, the same managed solution reaches test or user acceptance testing and then production, where the site is activated, its cache cleared, and the site validated. The key principle is to commit development changes through Git integration and promote one managed solution with pipelines.
:::image-end:::

## Release promotion lifecycle

The following lifecycle shows the standard path from a feature branch to production.

<!-- FOLLOW-UP: regenerate diagram from SVG source with Git integration / pipelines in Power Platform terms -->
:::image type="complex" source="../media/power-pages/power-pages-spa-alm/power-pages-spa-release-promotion-lifecycle.png" alt-text="Diagram of the Power Pages SPA release promotion lifecycle from feature branch to production.":::
   The lifecycle has eight stages. First, check for Git updates and pull them into the development environment that's connected to the feature branch. Second, pull the same branch locally, and use Power Platform CLI to download or reconcile the code site only when needed. Third, edit the framework source in src, build compiled HTML, CSS, and JavaScript into dist, and run tests. Fourth, use pac pages upload-code-site to upload source files and compiled web files to development, and repeat until the SPA is release-ready. Fifth, validate the development site, commit the changes to the feature branch through Git integration, and review and merge the pull request into the integration branch. Sixth, pull the merged changes into the primary development environment, which is connected to the integration branch, add dependencies to the solution, and increment its version. Seventh, use a pipeline in Power Platform to validate and deploy to test or user acceptance testing, and complete technical and business approval. Eighth, promote the same approved artifact to production, activate the site, clear its cache, validate it, and record the release. Release traceability links the Git commit, SPA build ID, solution version, pipeline run, target environment, and validation result.
:::image-end:::

| Loop | Purpose | Source of truth | Output |
|---|---|---|---|
| Inner loop | Build, test, upload, validate, and review SPA and site changes | Connected Git repository and the approved branch | A reviewed commit and a validated site in development |
| Outer loop | Package and promote the validated site | Managed solution built from the primary development environment | The same managed solution deployed to test and production |

The handoff from the inner loop to the outer loop happens only after the approved changes are pulled into the primary development environment, validated, and included in the release solution.

## Understand the deployment boundary

| Artifact | Where you author it | How you promote it |
|---|---|---|
| SPA source code | SPA project in the connected repository | Git branches and pull requests. Use `pac pages upload-code-site` to upload it to development when `includeSource` is `true` |
| Compiled HTML, CSS, JavaScript, and static assets | Folder set by `compiledPath`, such as `dist` | Use `pac pages upload-code-site` to upload them to development. Git integration commits them. Dataverse solution promotes them. |
| Source control representation of the site | `powerpagescodesites/<site-name>/.powerpages-site/` in the repository | Git integration commit and pull |
| Site settings, content snippets, web roles, table permissions, and server logic | Development environment | Dataverse solution |
| Tables, columns, cloud flows, and connection references | Development environment | Dataverse solution |
| Environment-specific values | Environment variables and deployment settings | Values supplied for each target stage |
| Secrets | Azure Key Vault | Secret environment variables |

> [!IMPORTANT]
> Adding a site to a solution doesn't automatically add site components that you create later. Before every release, compare the development site with the solution and add missing components.

## Understand the code site folder layout

After you commit through Git integration, the connected repository contains the editable SPA project and the serialized Power Pages components. For example, a React and Vite code site can appear in this form:

```text
<Git folder>/
├── entities/
├── publishers/
├── solutions/
└── powerpagescodesites/
    └── <site-name>/
        ├── src/                         # Editable framework source, such as React components
        ├── public/                      # Static source assets
        ├── index.html                   # SPA entry HTML
        ├── package.json                 # Framework scripts and dependencies
        ├── powerpages.config.json       # Power Platform CLI upload configuration
        └── .powerpages-site/
            ├── website.yml              # Website component metadata
            ├── source-files/            # Source-file metadata, one YAML file per source file
            ├── web-files/               # Deployed compiled HTML, CSS, and JavaScript
            ├── site-settings/
            ├── table-permissions/
            └── <other site component folders>
```

Power Pages represents the SPA in two ways:

- **Source files:** When `includeSource` is `true`, `pac pages upload-code-site` uploads the source files to the site. Git integration writes each file at its original path, such as `src/App.tsx`, and writes matching metadata under `.powerpages-site/source-files`. For example, `.powerpages-site/source-files/App.tsx/App.tsx.sourcefile.yml` records `partialurl: src/App.tsx`. It isn't a second copy of the source.
- **Compiled assets:** The browser doesn't run the files in `src` directly. The framework build compiles them into HTML, CSS, and JavaScript in the folder set by `compiledPath`. Power Platform CLI uploads those files as web files, and Git integration writes them under `.powerpages-site/web-files`.

<!-- SME: reconcile with platform code-first guidance (two copies in source control) -->

> [!NOTE]
> `src` is a framework convention, not a Power Pages requirement. Power Pages relies on the project root, the `compiledPath` folder, `defaultLandingPage`, and the uploaded file paths.

Code sites use `powerpagescodesites/<site-name>/`. Design studio sites use `powerpagesites/<site-name>/`.

## Configure powerpages.config.json

Define the compiled output, landing page, source upload, and stale-bundle cleanup in `powerpages.config.json`:

```json
{
  "$schema": "https://www.schemastore.org/powerpages.config.json",
  "siteName": "Contoso SPA",
  "compiledPath": "dist",
  "defaultLandingPage": "index.html",
  "includeSource": true,
  "sourceExcludePatterns": [
    "node_modules/**",
    ".env*"
  ],
  "bundleFilePatterns": [
    "index-*.js",
    "index-*.css"
  ]
}
```

- Set `includeSource` to `true` so that the SPA source is uploaded to the site and committed through Git integration together with the compiled assets.
  <!-- SME: reconcile with platform code-first guidance (two copies in source control) -->
- Use `sourceExcludePatterns` to exclude dependencies, local settings, secrets, and anything else that isn't required.
- Configure `bundleFilePatterns` so that each upload removes old content-hashed bundles before it uploads the new build. Without cleanup, stale bundles stay in the site's web files, get committed to Git, and are included in the solution that you promote. For details, see [Code splitting and bundle cleanup](/power-pages/configure/create-code-sites#code-splitting-and-bundle-cleanup).

## Develop, upload, and commit

Each change follows the same inner loop: start from the latest branch state, build and upload to the development site, and then commit through Git integration.

### Start from the latest branch state

1. In the development environment, open the solution in Power Pages and select **Source control**.
2. Select **Check for updates**, resolve any conflicts, and then select **Pull**. Validate the site.
3. Pull the same branch to your local clone.
4. If your local project doesn't match the development site, for example, when you set up a new workstation, reconcile it from the site. Run this command from `powerpagescodesites/<site-name>` in your local clone:

   ```powershell
   pac pages download-code-site `
     --environment "https://contoso-dev.crm.dynamics.com" `
     --path "." `
     --webSiteId "00000000-0000-0000-0000-000000000000" `
     --overwrite
   ```

### Build and upload

1. Authenticate to the development environment and confirm the active profile:

   ```powershell
   pac auth create --environment "https://contoso-dev.crm.dynamics.com"
   pac auth list
   ```

2. Edit the source, restore dependencies, build the SPA, and run your tests:

   ```powershell
   npm ci
   npm run build
   npm test
   ```

3. Upload the source and compiled assets to the development site. Run this command from `powerpagescodesites/<site-name>` in your local clone:

   ```powershell
   pac pages upload-code-site --rootPath "."
   ```

   The command reads `powerpages.config.json`, uploads the contents of `compiledPath`, and uploads source files when `includeSource` is `true`.

4. Validate the site in development, and repeat until the change is ready.

> [!IMPORTANT]
> Use `pac pages upload-code-site` and `pac pages download-code-site` for SPA code sites. The `pac pages upload` and `pac pages download` commands are for design studio sites.

### Commit and review

1. In the development environment, check for updates, pull any incoming changes, and validate the site again.
2. Commit the changes through **Source control**. For the steps and Power Pages considerations, see [Work with changes](power-pages-source-control.md#work-with-changes).
3. In your Git provider, open a pull request to merge the changes into the integration branch, and complete branch-policy checks, such as code review and a CI build of the SPA.

Don't push SPA source changes directly from your local clone to the connected branch. Upload them to the development site and commit them through **Source control** so that the source files, compiled web files, and site metadata stay in sync.

## Prepare the release candidate in the primary development environment

Use one designated development environment, connected to the integration branch, as the source for every release. After the pull request is merged:

1. In the primary development environment, open the solution and select **Source control**.
2. Select **Check for updates**, and then **Pull** the merged changes.
3. Validate the site. The solution captures the site as it exists in this environment, so a solution exported before the pull contains the previous build.

## Prepare the solution for promotion

In the primary development environment:

1. Open [Power Pages](https://make.powerpages.microsoft.com/) and select **Solutions**.
2. Open the unmanaged solution for the site.
3. If the site isn't already in the solution, select **Add existing** > **Site** > **Site**, select the site, and include all objects or select the required objects.
4. Add components created since the site was added by selecting **Add existing** > **Site** > **Site Component**.
5. Add related Dataverse tables, columns, cloud flows, connection references, and environment variable definitions.
6. Resolve missing dependencies.
7. Increment the solution version.

For detailed steps, see [Use solutions with Power Pages](power-pages-solutions.md).

Include, as applicable:

- The website and site language records.
- Source files and web files, including the compiled SPA assets.
- Server logic and its configuration.
- Site settings and content snippets that the SPA uses.
- Web roles and table permissions.
- Dataverse tables and columns that the SPA calls through the Web API.
- Cloud flows and connection references.
- Environment variable definitions.

## Configure environment-specific values

Don't store test or production values in the Git repository, in the compiled SPA, or directly in site settings that move between environments. Instead, use the following options:

- **Environment variables** for URLs, identifiers, and feature settings that differ by environment. For details, see [Use environment variables with site settings](environment-variables-for-site-settings.md).
- **Connection references** for cloud flows.
- **Secret environment variables** backed by Azure Key Vault for credentials and keys.
- **Deployment settings** in the pipeline to provide target-specific values.

Don't compile environment-specific values into the SPA bundle at build time. The same compiled bundle is deployed to every environment that receives the solution, so retrieve environment-specific values at runtime instead.

## Deploy with pipelines in Power Platform

Pipelines in Power Platform provide the recommended path for governed promotion. Set up and run the pipeline as described in [Set up pipelines in Power Platform](/power-platform/alm/set-up-pipelines) and [Deploy Power Pages sites with pipelines in Power Platform](power-pages-pipelines.md). For SPA code sites:

- **Before you deploy:** Confirm that the primary development environment contains the approved branch state and that the solution contains all required components.
- **During deployment:** Provide target values for environment variables and connection references when prompted.
- **After deployment:** Reactivate the site after its first deployment to a target environment. Clear the target site's cache when changes don't appear, and validate the site.

Promote the same solution version from test to production. New development changes require a new solution version and a new pipeline run.

> [!TIP]
> The [Power Pages plugin for GitHub Copilot CLI and Claude Code](/power-pages/configure/create-code-site-using-claude-code) can help with these steps, such as setting up a solution, configuring a pipeline, and running a deployment. Review its plan and generated configuration before you approve changes.

## Alternative: Export and import a managed solution

If you can't use pipelines in Power Platform:

1. Export the solution from the primary development environment as managed.
2. Import the same file into test and validate the site.
3. After approval, import the same file into user acceptance testing and production in sequence.
4. Provide environment variable values and connection references in each target.
5. Reactivate the site after its first deployment, clear the cache when required, and validate it.

You can automate export and import with Microsoft Power Platform Build Tools or GitHub Actions for Microsoft Power Platform. For details, see [Automate Power Pages deployments with Microsoft Power Platform Build Tools](build-tools.md) and [Automate Power Pages deployments with GitHub Actions](github-actions.md).

Don't run `pac pages upload-code-site` against test or production environments as a substitute for solution-based promotion. That approach doesn't move the site's Dataverse dependencies as one versioned artifact and creates unmanaged changes in the target environment.

## If you don't use Git integration

If your organization can't connect development environments to Git, keep the SPA project in a repository that you manage, build and upload it to development with Power Platform CLI, and then [prepare the solution for promotion](#prepare-the-solution-for-promotion). For the inner loop and CI/CD guidance, see [CI/CD for single-page applications with developer tools](spa-developer-tools.md).

## Record release traceability

Use a four-part solution version, such as `1.2.0.0`, and increment it before you create a new deployable artifact. Don't reuse a version for different solution contents.

For each release, record:

- The Git commit or tag.
- The SPA build identifier.
- The solution unique name and version.
- The pipeline run or import record.
- The target environment.
- The validation result.

## Validate the target site

After deployment, verify that:

- The expected managed solution version is installed.
- The site is active and reachable.
- The SPA loads without missing static assets.
- Client-side routes work after a browser refresh.
- Sign-in and authentication work.
- Web API calls succeed and table permissions enforce the intended access.
- Server logic returns the expected responses.
- Environment variables and connection references have target-specific values.
- The browser console and network trace show no blocking errors.

## Troubleshoot common issues

| Symptom | Likely cause | Resolution |
|---|---|---|
| SPA source isn't in the repository | `includeSource` is missing or `false`, or the changes weren't committed through Git integration | Set `includeSource` to `true`, upload again, and commit through **Source control** |
| `.powerpages-site/source-files` contains only YAML files | This folder stores source-file metadata, not the source | Use the `partialurl` value in each YAML file to find the source, such as `src/App.tsx` |
| Upload contains no compiled files | The build didn't run, or `compiledPath` is incorrect | Build the SPA and confirm the folder set by `compiledPath` |
| JavaScript upload or import fails | `.js` is a blocked attachment type in the environment | Remove `js` from the blocked attachments list, and then retry. See [Allow JavaScript file uploads](/power-pages/configure/create-code-sites#allow-javascript-file-uploads) |
| Old bundle files accumulate in the repository or solution | `bundleFilePatterns` doesn't match the build output | Update `bundleFilePatterns`, upload again, and commit |
| Development shows an older SPA after a merge | The merged branch wasn't pulled into the environment | Select **Check for updates** and **Pull** in **Source control**, and then validate |
| Target shows an older SPA | The solution was exported or deployed before the approved changes were pulled into the primary development environment | Pull the approved branch, increment the version, and redeploy |
| A new site feature is missing in the target | The component was created after the site was added to the solution | Add it with **Add existing** > **Site** > **Site Component**, and then redeploy |
| Web API returns 404 | A required table or column isn't in the target | Add the Dataverse components to the solution |
| Web API returns an authorization error | A table permission, web role, or authentication setting is missing | Add or correct the security components |
| Pipeline reports missing dependencies | Related tables, flows, connection references, or environment variables aren't in the solution | Add the dependencies or provide deployment settings |
| Imported site is inactive | The first deployment requires activation | Reactivate the site in the target environment |
| Target doesn't reflect a managed solution update | Someone edited the site in the target environment, creating an unmanaged layer | Remove the unmanaged layer. See [Solution layers](/power-platform/alm/solution-layers-alm) |
| Changes aren't visible after deployment | The target site cache is stale | [Clear the server-side cache](/power-pages/admin/clear-server-side-cache) |

For Git integration errors and conflicts, see [Use Git integration with Power Pages](power-pages-source-control.md#troubleshoot-source-control). For issues across all ALM approaches, see [Troubleshoot Power Pages ALM](troubleshoot-alm.md).

## Related content

- [Overview of Power Pages ALM](portals-alm.md)
- [Use Git integration with Power Pages](power-pages-source-control.md)
- [CI/CD for single-page applications with developer tools](spa-developer-tools.md)
- [Create and deploy a single-page application in Power Pages](/power-pages/configure/create-code-sites)
- [Create and deploy an SPA using GitHub Spark and Codespaces](/power-pages/configure/create-code-site-using-codespace)
- [Use solutions with Power Pages](power-pages-solutions.md)
- [Deploy Power Pages sites with pipelines in Power Platform](power-pages-pipelines.md)
- [Use environment variables with site settings](environment-variables-for-site-settings.md)
- [Power Platform CLI pages command group](/power-platform/developer/cli/reference/pages)
- [Overview of Git integration in Power Platform](/power-platform/alm/git-integration/overview)
- [Overview of pipelines in Power Platform](/power-platform/alm/pipelines)
- [Application lifecycle management with Microsoft Power Platform](/power-platform/alm/)
