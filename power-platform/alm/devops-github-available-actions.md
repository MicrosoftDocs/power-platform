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

# Available GitHub Actions for Microsoft Power Platform (Preview)

[This topic is pre-release documentation and is subject to change.]

Available GitHub Actions for Microsoft Power Platform are described in the following sections. In addition, example GitHub workflows using some of these actions are showcased. For more information about GitHub Actions and how to download them, go to [GitHub Actions for Microsoft Power Platform](devops-github-actions.md).

## Configure deployment credentials

Many of the actions require you to connect to a Microsoft Dataverse environment. You can add credentials as secrets in your the GitHub repository and then use them in the workflow.

## Helper tasks

The available helper tasks are described below.

### Microsoft Power Platform WhoAmI

Verifies the service connection by connecting to the service and sending a `WhoAmI` [[SDK](/dotnet/api/microsoft.crm.sdk.messages.whoamirequest)/[Web API](/dynamics365/customer-engagement/web-api/whoami)] request. This task can be useful to include early in your DevOps pipeline, to verify connectivity before processing begins.

| Parameter    | Description   |
|---------------|---------------|
| environment-url | The URL for the environment you're connecting to.|
| user-name | The username of the account you're using to connect with. |
| password-secret | The password for *user-name*. GitHub passwords are defined in **Settings** under **Secrets**. Note that you can't retrieve a secret after it has been defined and saved. |

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