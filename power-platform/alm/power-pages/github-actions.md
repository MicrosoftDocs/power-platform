---
title: Automate Power Pages deployments with GitHub Actions
description: Learn how to use GitHub Actions for Microsoft Power Platform to deploy Power Pages sites to test and production environments from a GitHub workflow.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: how-to
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# Automate Power Pages deployments with GitHub Actions

By using [GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-actions), you can build GitHub workflows that deploy Power Pages sites. Use them when your team keeps the site in a GitHub repository and wants reviewed, repeatable deployments to test and production.

This article covers the Power Pages-specific actions and patterns. For every action and parameter, see [Available GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-available-actions).

## Prerequisites

- A GitHub repository that contains the site content. For details, see [Set up source control and branching for Power Pages](source-control-developer-tools.md).
- A Microsoft Entra app registration added as an application user, with the required security roles, in each target environment.
- Credentials for the app registration stored in GitHub:
  - **Federated credentials:** Configure OpenID Connect (OIDC) so that the workflow authenticates without a client secret. For steps, see [Tutorial: Use OIDC/FIC authentication with GitHub Actions for Microsoft Power Platform](/power-platform/alm/tutorials/github-actions-oidc-fic).
  - **Client secret:** Store the client secret as a GitHub secret, and reference it from the workflow. For details, see [Configure credentials to use with GitHub Actions](/power-platform/alm/devops-github-available-actions#configure-credentials-to-use-with-github-actions-with-microsoft-power-platform).

<!-- SME: confirm that upload-paportal supports OIDC/FIC authentication -->

## Workflow overview

A typical workflow for a Power Pages site:

1. Runs when a pull request merges into the main branch, or on demand.
2. Installs Power Platform CLI on the runner with the `actions-install` action.
3. Deploys the site to the test environment.
4. Waits for approval, and then deploys the same content to production.

Use [GitHub environments](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment) for test and production. Store the environment URL and credentials for each target in its environment, and add required reviewers to the production environment so that a person approves each production deployment.

## Deploy a site with portal tasks

The [`upload-paportal`](/power-platform/alm/devops-github-available-actions#upload-paportal) action uploads Power Pages website content to a target environment. Use it to deploy standard data model sites. It accepts these Power Pages-specific parameters:

| Parameter | Description |
|---|---|
| `upload-path` | Path where the website content is stored. |
| `deployment-profile` | Upload site data with environment details defined in the `deployment-profiles/[profile-name].deployment.yaml` file. |
| `model-version` | Whether the site data uses the standard (`1`) or enhanced (`2`) data model. The default value is `1`. |

The following job deploys a standard data model site to the test environment with a client secret:

```yml
jobs:
  deploy-test:
    runs-on: windows-latest
    environment: test
    steps:
    - uses: actions/checkout@v4

    - name: Install Power Platform Tools
      uses: microsoft/powerplatform-actions/actions-install@v1

    - name: Upload Power Pages site
      uses: microsoft/powerplatform-actions/upload-paportal@v1
      with:
        environment-url: ${{ vars.ENVIRONMENT_URL }}
        app-id: ${{ vars.CLIENT_ID }}
        client-secret: ${{ secrets.CLIENT_SECRET }}
        tenant-id: ${{ vars.TENANT_ID }}
        upload-path: site
        deployment-profile: test
        model-version: 1
```

Add a similar `deploy-production` job that uses the `production` environment, the `prod` deployment profile, and `needs: deploy-test`.

Because the content comes from your repository rather than from the target environment, the upload is a full upload. For details, see [Understand delta and full uploads](source-control-developer-tools.md#understand-delta-and-full-uploads).

## Deploy enhanced data model and SPA code sites with solutions

For enhanced data model and SPA code sites, promote the site as a solution:

1. Add the site and its dependencies to a solution. For details, see [Use solutions with Power Pages](/power-pages/configure/power-pages-solutions).
2. Use the [`export-solution`](/power-platform/alm/devops-github-available-actions#export-solution) action to export the solution from the primary development environment as managed. Set `managed` to `true`.
3. Use the [`import-solution`](/power-platform/alm/devops-github-available-actions#import-solution) action to import the same solution file into each target environment.
4. After the first deployment to a target environment, [reactivate the site](/power-pages/configure/power-pages-solutions#reactivate-the-site-in-the-target-environment).

You can also store the unpacked solution in the repository with `unpack-solution` and build it with `pack-solution`, and run `check-solution` as a quality gate. For SPA code sites, see [CI/CD for single-page applications with developer tools](spa-developer-tools.md).

<!-- SME: confirm how to provide environment variable values and connection references to import-solution in GitHub Actions -->

## Related content

- [Overview of ALM with developer tools](developer-tools-overview.md)
- [Automate Power Pages deployments with Microsoft Power Platform Build Tools](build-tools.md)
- [Manage environment-specific values in Power Pages ALM](environment-specific-values.md)
- [Roll back and hotfix Power Pages releases](rollback-hotfix.md)
- [GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-actions)
- [Extend pipelines using GitHub Actions](/power-platform/alm/extend-pipelines-github-export)
