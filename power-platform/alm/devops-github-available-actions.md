---
title: "Available GitHub Actions for Microsoft Power Platform | Microsoft Docs"
description: "Learn about the available GitHub Actions to support continuous integration and delivery for Microsoft Power Platform development."
keywords: 
author: kkanakas
ms.author: kartikka
manager: kvivek
ms.custom: ""
ms.date: 06/28/2021
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Available GitHub Actions for Microsoft Power Platform

[GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions) are described in the following sections. In addition, sample GitHub workflows shown as well. For more information about GitHub Actions and how to download them, go to [GitHub Actions for Microsoft Power Platform](devops-github-actions.md).

## Configure deployment credentials

Many of the actions require you to connect to a Microsoft Dataverse environment. You can add service principal or user credentials as secrets in your GitHub repository and then use them in your workflows.

- For details on how to set up secrets in GitHub, see [Encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow) 

- For details how to set up service principal authentication for Microsoft Power Platform, see [DevOps Build tools](devops-build-tools.md#configure-service-connections-using-a-service-principal)

Once configured, you can call the Service Principal from with in your Action scripts. 

Parameters to define within your GitHub Action Script as [Environment Variables](https://docs.github.com/en/actions/reference/environment-variables):

- Application ID such as: `WF_APPLICATION_ID:<your application id>`
- Tenant ID such as: `WF_TENANT_ID:<your tenant id>`

The client Secret must be added and stored as a GitHub Secret, and will be referenced from within the workflow using a parameter like: 
`client secret: ${{secrets.CLIENT_SECRET_GITHUB_ACTIONS}}`

## Helper tasks

The available helper task is described below.

### whoAmI

Verifies the service connection by connecting to the service and sending a `WhoAmI` [[SDK](/dotnet/api/microsoft.crm.sdk.messages.whoamirequest)/[Web API](/dynamics365/customer-engagement/web-api/whoami)] request. This task can be useful to include early in your GitHub workflow, to verify connectivity before processing begins.

| Parameter    | Description   |
|---------------|---------------|
| environment-url | The URL for the environment you're connecting to.|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|

## Solution tasks

These tasks perform actions against solutions and include the following.

### import-solution

Imports a solution into a target environment.

| Parameter           | Description        |
|----------------------|--------------------------|
| environment-url| (Required) The URL for the target environment that you want to import the solution into (for example, https://YourOrg.crm.dynamics.com).|
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
| environment-url| (Required) The URL for the environment that you want to export the solution from (for example, https://YourOrg.crm.dynamics.com).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. You can't retrieve a secret after it has been defined and saved. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
 | solution-name | (Required) The name of the solution to export. Always use the solution's *name*, not its *display name*.    |
 | solution-output-file   | (Required) The path and name of the solution.zip file to export the source environment to.|
| managed        | (Required) Set to **true** to export as a managed solution; the default (**false**) is to export as an unmanaged solution.|

### unpack-solution

Takes a compressed solution file and decomposes it into multiple XML files so these files can be more easily read and managed by a source control system.

| Parameter    | Description       |
|---------------|-------------------|
| solution-file              | (Required) The path and file name of the solution.zip file to unpack.     |
| solution-folder | (Required) The path and target folder you want to unpack the solution into.      |
| solution-type | (Required) The type of solution you want to unpack. Options include **Unmanaged** (recommended), **Managed**, and **Both**. |

### pack-solution

Packs a solution represented in source control into a solution.zip file that can be imported into another environment.

| Parameter       | Description     |
|------------------|-----------------|
| solution-file              | (Required) The path and file name of the solution.zip file to pack the solution into (for example, out/CI/ALMLab.zip).     |
| solution-folder             | (Required) The path and source folder of the solution to pack.      |
| solution-type                  | (Optional) The type of solution to pack. Options include **Unmanaged** (recommended), **Managed**, and **Both**. |

### publish-solution

Publishes the solution customizations.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to publish the solution into (for example, https://YourOrg.crm.dynamics.com).|
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
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, https://YourOrg.crm.dynamics.com).|
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
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, https://YourOrg.crm.dynamics.com).|
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

Provides the ability to upgrade the solution.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, https://YourOrg.crm.dynamics.com).|
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

These tasks perform actions against packages and include the following.

### deploy-package

Provides the ability to deploy a package dll or a zip file with a package. 

> [!NOTE]
> This action is only supported on a Windows.

| Parameter    | Description       |
|---------------|-------------------|
| environment-url| (Required) The URL for the  environment that you want to clone the solution from (for example, https://YourOrg.crm.dynamics.com).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
|app-id| The application ID to authenticate with. This parameter is **required** when authenticating with Service Principal credentials.|
|client-secret| The client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal credentials.|
|tenant-id| The tenant ID when authenticating with `app-id` and `client-secret`.|
|package| (Required) The path to the package dll or zip file with a package.|

## GitHub workflow authoring

To learn more about composing GitHub workflows using GitHub actions, complete the [GitHub Actions for Microsoft Power Platform labs](https://aka.ms/poweractionslab).

More information: [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions)

### See Also

[GitHub Actions for Microsoft Power Platform](devops-github-actions.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
