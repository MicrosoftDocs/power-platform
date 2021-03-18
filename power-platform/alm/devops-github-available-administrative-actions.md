---
title: "Available GitHub Actions for Microsoft Power Platform | Microsoft Docs"
description: "Learn about the available GitHub Actions supporting continuous integration and delivery with Microsoft Power Platform."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 09/21/2020
ms.reviewer: "pehecke"
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Available GitHub Adminstrative Actions for Microsoft Power Platform (Preview)

[This topic is pre-release documentation and is subject to change.]

Available GitHub Actions for administrative functions for Microsoft Power Platform are described in the following sections. 

## Configure deployment credentials

Many of the actions require you to connect to a Microsoft Dataverse environment. You can add service principal or user credentials as secrets in your the GitHub repository and then use them in the workflow.<br/>
For details on how to setup secrets in GitHub please refer to [the following article on GitHub](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow) <br/>
To learn how to setup service principal authentication for Power Platform please refer to [following document](https://docs.microsoft.com/en-us/power-platform/alm/devops-build-tools#configure-service-connections-using-a-service-principal)<br/>

Once configured properly you can call the Service Principal from with in your Action scripts <br/>
Parameters to define within your GitHub Action Script as [Environment Variables](https://docs.github.com/en/actions/reference/environment-variables): <br/>
Application Id such as: `WF_APPLICATION_ID:<your application id>` <br/>
Tenant Id such as: `WF_TENANT_ID:<your tenant id>` <br/>

The Client Secret will be stored as a GitHub Secret, as described earlier and will be referenced from within the action script using a parameter like: <br/>
`client secret: ${{secrets.CLIENT_SECRET_GITHUB_ACTIONS}}` <br/>
## Administrative tasks

The available administrative tasks are explained below

### Microsoft Power Platform create environment

Creates an environment in the Power Platform tenant

| Parameter    | Description   |
|---------------|---------------|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
|app-id| The application id to authenticate with. This parameter is **required** when authenticating with Service Principal credentials|
|client-secret| The Client secret used to authenticate the GitHub pipeline. This parameter is **required** when authenticating with Service Principal Credentials|
|tenant-id| The tenant-id when authenticating with app-id and client-secret|
|name| name of the environment that you are going to create| 
|region| name of the region of where your environment will be created <br/> default is `unitedstates`|
|type| the type of environment (Trial,Sandbox,Production,SubscriptionBasedTrial) <br/> details about trial environments can be found at this [link](https://docs.microsoft.com/en-us/power-platform/admin/trial-environments)|
|currency| The currency to use for the environment <br/> default is `USD`|
|language| The language to use for the environment <br/> default is `English`|
|templates| The Dynamics365 templates that needs to be deployed to the environment <br/> Passed as comma separated values|
|domain| The domain name of the environment URL <br/> e.g.: `https://{contoso}0.crm.dynamics.com`|



the output will be the URL of the new environment


## Solution tasks

These tasks perform actions against solutions and include the following.

### Microsoft Power Platform import solution

Imports a solution into a target environment.

| Parameter           | Description        |
|----------------------|--------------------------|
| environment-url| (Required) The URL for the target environment that you want to import the solution into (for example, [https://powerappsactions.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for the account you're using to connect with. |
 | solution-file        | (Required) The path and file name of the solution file you want to import.   |

### Microsoft Power Platform export solution

Exports a solution from a source environment.

| Parameter      | Description     |
|-----------------|---------------------|
| environment-url| (Required) The URL for the environment that you want to export the solution from (for example, [https://powerappsactions.crm.dynamics.com](https://powerappsbuildtools.crm.dynamics.com)).|
|user-name|(Required) If you're using username/password authentication, the username of the account you're using to connect with.|
| password-secret | (Required) If you're using username/password authentication, the password for *user-name*. GitHUb passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |
 | solution-name              | (Required) The name of the solution to export.<p/>Always use the solution's *name*, not its *display name*.    |
 | solution-output-file        | (Required) The path and file name of the solution.zip file to export the source environment to.|
  | managed        | (Required) Set to **true** to export as a managed solution; the default (**false**) is to export as an unmanaged solution.

### Microsoft Power Platform unpack solution

Takes a compressed solution file and decomposes it into multiple XML files so these files can be more easily read and managed by a source control system.

| Parameter    | Description       |
|---------------|-------------------|
| solution-file              | (Required) The path and file name of the solution.zip file to unpack.     |
| solution-folder | (Required) The path and target folder you want to unpack the solution into.      |
| solution-type | (Required) The type of solution you want to unpack. Options include **Unmanaged** (recommended), **Managed**, and **Both**. |

### Microsoft Power Platform pack solution

Packs a solution represented in source control into a solution.zip file that can be imported into another environment.

| Parameter       | Description     |
|------------------|-----------------|
| solution-file              | (Required) The path and file name of the solution.zip file to pack the solution into (for example, out/CI/ALMLab.zip).     |
| solution-folder             | (Required) The path and source folder of the solution to pack.      |
| solution-type                  | (Optional) The type of solution to pack. Options include **Unmanaged** (recommended), **Managed**, and **Both**. |

## Build and release pipeline authoring

To learn about creating multiple-action workflows and pipelines through hands-on authoring by using GitHub Actions for Microsoft Power Platform, complete the [GitHub Actions for Microsoft Power Platform labs](https://aka.ms/poweractionslab).

More information: [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions)

### See Also

[GitHub Actions for Microsoft Power Platform](devops-github-actions.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]