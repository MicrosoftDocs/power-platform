---
title: "Available GitHub Actions for Microsoft Power Platform development | Microsoft Docs"
description: "Learn about the available GitHub Actions to support continuous integration and delivery for Microsoft Power Platform development."
keywords: 
author: kkanakas
ms.subservice: alm
ms.author: kartikka
ms.date: 10/28/2026
ms.reviewer: "pehecke"
ms.topic: "article"
search.audienceType: 
  - developer
ms.custom:
  - ""
  - sfi-ropc-nochange
---

# Available GitHub Actions for Microsoft Power Platform development

The following sections describe [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions). The sections also show sample GitHub workflows. For more information about GitHub Actions and how to download them, see [GitHub Actions for Microsoft Power Platform](devops-github-actions.md).

## Configure credentials to use with GitHub Actions with Microsoft Power Platform

Many of the actions require you to connect to a Microsoft Dataverse environment. Add service principal or user credentials as secrets in your GitHub repository and then use them in your workflows.

- For details on how to set up secrets in GitHub, see [Encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow). 

- For details on how to set up service principal authentication for Microsoft Power Platform, see [DevOps Build tools](devops-build-tools.md#configure-service-connections-using-a-service-principal).

After you configure the credentials, you can call the service principal from within your Action scripts. 

Define the following parameters within your GitHub Action Script as [Environment Variables](https://docs.github.com/en/actions/reference/environment-variables):

- Application ID, such as: `WF_APPLICATION_ID:<your application id>`
- Tenant ID, such as: `WF_TENANT_ID:<your tenant id>`

Add the client secret as a GitHub secret. Reference it from within the workflow by using a parameter like: 
`client secret: ${{secrets.CLIENT_SECRET_GITHUB_ACTIONS}}`

## Helper tasks

The following helper task is available.

### actions-install

When a GitHub Actions workflow forces an install of Power Platform CLI in the context of a runner, and a timeout error occurs, use version 1 (@v1) with an additional action (`actions-install`) as shown in the following example.

>
> [!IMPORTANT]
> - Using version 1 (@v1) might lead to updates to existing GitHub actions that can result in current workflows being updated.
> - Add the **Install Power Platform Tools** task as the first task in your workflow before any other GitHub Actions for Power Platform. 

```
jobs:
    builds:
        runs-on: windows-latest   # alternate runner OS is: ubuntu-latest

    steps:
    - name: Install Power Platform Tools
        uses: microsoft/powerplatform-actions/actions-install@v1

    - name: Export Solution
         uses: microsoft/powerplatform-actions/export-solution@v1
      with:
         environment-url: 'https://myenv.crm.dynamics.com'
         user-name: 'me@myenv.onmicrosoft.com'
         password-secret: ${{ secrets.MYPASSWORD }}
         solution-name: aSolution
         solution-output-file: 'aSolution.zip'
         working-directory: 'out'

```

You can find more samples of GitHub Actions at [Power Platform Actions](https://github.com/marketplace/actions/powerplatform-actions).

### whoAmI

Verifies the service connection by connecting to the service and sending a `WhoAmI` [[SDK](/dotnet/api/microsoft.crm.sdk.messages.whoamirequest)/[Web API](/dynamics365/customer-engagement/web-api/whoami)] request. This task can be useful to include early in your GitHub workflow to verify connectivity before processing begins.

| Parameter    | Description   |
|---------------|---------------|
| environment-url | The URL for the environment you're connecting to.|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. Define GitHub passwords in **Settings** under **Secrets**. You can't retrieve a secret after you define and save it. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

## Solution tasks

These tasks perform actions against solutions and include the following.

### import-solution

Imports a solution into a target environment.

| Parameter           | Description        |
|----------------------|--------------------------|
| environment-url| (Required) The URL for the target environment that you want to import the solution into (for example, `https://YourOrg.crm.dynamics.com`).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
| solution-file        | (Required) The path and name of the solution file you want to import.   |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

### export-solution

Exports a solution from a source environment.

| Parameter      | Description     |
|-----------------|---------------------|
| environment-url| (Required) The URL for the environment that you want to export the solution from (for example, `https://YourOrg.crm.dynamics.com`).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for *user-name*. Define GitHub passwords in **Settings** under **Secrets**. You can't retrieve a secret after you define and save it. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
 | solution-name | (Required) The name of the solution to export. Always use the solution's *name*, not its *display name*.    |
 | solution-output-file   | (Required) The path and name of the solution.zip file to export the source environment to.|
| managed        | (Required) Set to **true** to export as a managed solution; the default (**false**) is to export as an unmanaged solution.|

### unpack-solution

Takes a compressed solution file and decomposes it into multiple XML files. You can more easily read and manage these files in a source control system.

| Parameter    | Description       |
|---------------|-------------------|
| solution-file              | (Required) The path and file name of the solution.zip file to unpack.     |
| solution-folder | (Required) The path and target folder where you want to unpack the solution.      |
| solution-type | (Required) The type of solution you want to unpack. Options include **Unmanaged** (recommended), **Managed**, and **Both**. |

### pack-solution

Packs a solution represented in source control into a solution.zip file that you can import into another environment.

| Parameter       | Description     |
|------------------|-----------------|
| solution-file   | (Required) The path and file name of the solution.zip file to pack the solution into (for example, `out/CI/ALMLab.zip`).     |
| solution-folder             | (Required) The path and source folder of the solution to pack.      |
| solution-type                  | (Optional) The type of solution to pack. Options include **Unmanaged** (recommended), **Managed**, and **Both**. |

### publish-solution

Publishes the solution customizations.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to publish the solution into (for example, `https://YourOrg.crm.dynamics.com`).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
| solution-file        | (Required) The path and name of the solution file you want to import.   |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

### clone-solution

Clones the solution for a given environment.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, `https://YourOrg.crm.dynamics.com`).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
| solution-file        | (Required) The path and name of the solution file you want to import.   |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|solution-name | (Required) The path and name of the solution.zip file needed to clone (for example, out/CI/ALMLab.zip).|
|solution-version | Version of the solution to clone.| 
|target-folder | Target folder to place the extracted solution into. (for example, Git repository\target-solution-folder). |
|Working-directory | Temporary folder for work in progress artifacts needed for cloning the solution. <br/> default: `root of the repository`|

### check-solution

Checks the solution file to detect inconsistencies.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, `https://YourOrg.crm.dynamics.com`).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|path| (Required) The path and name of the solution file you want to check.|
|geo| Which geo location of the Microsoft Power Platform Checker service to use. Default value is 'united states'.|
|rule-level-override | Path to file a containing a JSON array of rules and their levels. Accepted values are: Critical, High, Low, and Informational. Example: [{"Id":"meta-remove-dup-reg","OverrideLevel":"Medium"},{"Id":"il-avoid-specialized-update-ops","OverrideLevel":"Medium"}]| 
|checker-logs-artifact-name | The name of the artifact folder for which Microsoft Power Platform checker logs will be uploaded. Default value is 'CheckSolutionLogs'. |

### upgrade-solution

Upgrades the solution.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, `https://YourOrg.crm.dynamics.com`).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
| solution-file        | (Required) The path and name of the solution file you want to import.   |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|solution-name | (Required) Name of the solution to upgrade.|
|async| Upgrades the solution asynchronously.|
|max-async-wait-time| Maximum asynchronous wait time in minutes. Default value is 60 minutes.|

## Package tasks

These tasks perform actions against packages.

### deploy-package

Deploys a package DLL or a ZIP file with a package. 

> [!NOTE]
> This action is only supported on Windows.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, `https://YourOrg.crm.dynamics.com`).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|package| (Required) The path to the package DLL or ZIP file with a package.|

## Portal tasks

These tasks perform the following actions against Power Pages.

### upload-paportal

Uploads data to Power Pages.

| Parameter    | Description       |
|---------------|-------------------|
|environment-url| (Required) The URL for the  environment that you want to import the solution into (for example, `https://YourOrg.crm.dynamics.com`).|
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|upload-path|Path where the website content is stored (alias: -p).|
|deployment-profile| Upload portal data with environment details defined through [profile variables](/powerapps/maker/portals/power-apps-cli#use-deployment-profile) in deployment-profiles/\[profile-name].deployment.yaml file.|
|model-version|Indicates if the site data to be uploaded uses the standard (`1`) or [enhanced data model](/power-pages/admin/enhanced-data-model) (`2`). Default value is `1`.|

Learn more about [Microsoft Power Platform CLI support for Power Pages](/power-pages/configure/power-platform-cli).

## Catalog tasks (preview)

These tasks perform actions against the catalog in Power Platform.

> [!NOTE]
> Currently, catalog tasks for Power Platform are in preview.

### install

Install a catalog item to the target environment.

| Parameter           | Description        |
|----------------------|--------------------------|
|catalog-item-id|(Required) Catalog item to install on the target environment.|
| target-url| (Required) The URL of the target environment for the catalog item installation (for example, `https://YourOrg.crm.dynamics.com`).|
| settings | (Required) Runtime package settings for the installation framework to execute. The format of the string must be `key=value|key=value`. |
| target-version        | Target version to install. If you don't specify a version, the published version is selected.   |
|poll-status| Poll to check the status of your request.|

### submit

List all published catalog items from the current Dataverse environment (organization).

| Parameter           | Description        |
|----------------------|--------------------------|
| path |(Required) Path to catalog submission document.|
| package-zip | Path to package zip file.|
| solution-zip | Path to solution zip file. |
|poll-status| Poll to check status of your request.|

### status

Get the status of the catalog install or submit request.

| Parameter           | Description        |
|----------------------|--------------------------|
| tracking-id |(Required) Request tracking ID.|
| type | (Required) Request type. Valid values are `Install` and `Submit`. |


## GitHub workflow authoring

To learn more about composing GitHub workflows by using GitHub Actions, complete the [GitHub Actions for Microsoft Power Platform labs](https://aka.ms/poweractionslab).

For more information, see [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions).

### See Also

[GitHub Actions for Microsoft Power Platform](devops-github-actions.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
