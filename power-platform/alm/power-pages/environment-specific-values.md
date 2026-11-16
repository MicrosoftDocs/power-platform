---
title: Manage environment-specific values in Power Pages ALM
description: Learn how to manage values that differ between development, test, and production when you deploy Power Pages sites with built-in or developer tools.
author: neerajnandwana-msft
ms.author: nenandw
ms.reviewer: smurkute
ms.topic: how-to
ms.date: 11/02/2026
ai-usage: ai-assisted
contributors:
  - neerajnandwana-msft
---

# Manage environment-specific values in Power Pages ALM

When you promote a Power Pages site, most of its configuration stays the same in every environment. Some values must change, such as the URL of an external service or the client ID for an identity provider. This article explains how to provide those values for each ALM approach so that you don't edit the site directly in test or production.

## What differs between environments

Common examples of values that differ between environments include:

- URLs and identifiers of external services and APIs.
- Identity provider settings, such as client IDs and secrets.
- Feature settings that you turn on in one environment but not another.
- Connections that cloud flows use.

Don't store test or production values in the Git repository, in compiled files, or directly in site settings that move between environments.

## Built-in tools

For enhanced data model and SPA code sites that you deploy with solutions, use:

- **Environment variables with site settings:** Link a site setting to an environment variable so that the setting takes its value from the environment. For steps, see [Use environment variables with site settings](/power-pages/configure/environment-variables-for-site-settings).
- **Values provided at deployment:** When you deploy with pipelines in Power Platform, provide the value of each environment variable for the target environment. For details, see [Pipelines](/power-pages/configure/environment-variables-for-site-settings#pipelines) and [Deploy Power Pages sites with pipelines in Power Platform](/power-pages/configure/power-pages-pipelines).
- **Connection references:** Provide target connections for cloud flows when you deploy.
- **Secrets:** Use secret environment variables backed by Azure Key Vault for credentials and keys. For steps, see [Configure environment variables as secrets](/power-pages/configure/environment-variables-for-site-settings#configure-environment-variables-as-secrets).

## Developer tools for standard data model sites

Standard data model sites can't use environment variables with solutions. Use deployment profiles with Power Platform CLI instead.

A deployment profile is a YAML file that overrides specific record values during upload. To use one:

1. Create a folder named `deployment-profiles` inside the folder that contains the downloaded site content.
2. Create a file for each target environment named `<profile-name>.deployment.yml`, such as `test.deployment.yml` or `prod.deployment.yml`.
3. In the file, list the table name, the record ID, and the column values to override. For example:

    ```yml
    adx_sitesetting:
        - adx_sitesettingid: 4ad86900-b5d7-43ac-1234-482529724970
          adx_value: ${OS.FacebookAppId}
          adx_name: Authentication/OpenAuth/Facebook/AppId
    ```

4. Upload with the `--deploymentProfile` parameter:

    ```powershell
    pac pages upload --path "C:\portals\starter-portal" --deploymentProfile test --modelVersion 1
    ```

Use the `OS` variable, such as `${OS.FacebookAppId}`, to read a value from an operating system environment variable instead of storing it in the file. In CI/CD, set that environment variable from a pipeline secret.

For a walkthrough, see [Upload the changes using deployment profile](/power-pages/configure/power-platform-cli-tutorial#upload-the-changes-using-deployment-profile). For the parameter reference, see [Use deployment profile](/power-pages/configure/power-platform-cli#use-deployment-profile). In GitHub Actions, the `upload-paportal` action accepts a `deployment-profile` parameter. For details, see [Automate Power Pages deployments with GitHub Actions](github-actions.md).

## Developer tools for enhanced data model sites

When you deploy a solution with Microsoft Power Platform Build Tools or GitHub Actions for Microsoft Power Platform, provide environment variable values and connection references in a deployment settings file. For steps to generate and use the file, see [Pre-populate connection references and environment variables for automated deployments](/power-platform/alm/conn-ref-env-variables-build-tools).

Keep one deployment settings file for each target environment. Don't put secret values in a file that you commit. Use secret environment variables backed by Azure Key Vault instead.

## SPA code sites

Don't compile environment-specific values into the SPA bundle at build time. The same compiled bundle is deployed to every environment that receives the solution, so retrieve environment-specific values at runtime instead. For details, see [Configure environment-specific values](power-pages-spa-alm.md#configure-environment-specific-values).

<!-- SME: confirm the recommended runtime pattern for SPA code sites to read environment-specific values, such as site settings exposed through the Web API -->

## Never commit secrets

Whatever approach you use:

- Don't commit client secrets, keys, passwords, or connection strings to the repository.
- Store CI/CD credentials as Azure DevOps secret variables, service connections, or GitHub secrets.
- Use secret environment variables backed by Azure Key Vault for secrets that the site uses at runtime.

## Clear the server-side cache

After you update an environment variable value, refresh the corresponding site settings so that the site uses the new value. If the change still doesn't appear on the site, clear the server-side cache. For details, see [Clear cache after updates](/power-pages/configure/environment-variables-for-site-settings#clear-cache-after-updates) and [How server-side caching works in Power Pages](/power-pages/admin/clear-server-side-cache).

## Related content

- [Plan ALM for Power Pages](plan-alm.md)
- [Use environment variables with site settings](/power-pages/configure/environment-variables-for-site-settings)
- [Automate Power Pages deployments with Microsoft Power Platform Build Tools](build-tools.md)
- [Automate Power Pages deployments with GitHub Actions](github-actions.md)
- [Troubleshoot Power Pages ALM](troubleshoot-alm.md)
