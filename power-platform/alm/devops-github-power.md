---
title: "GitHub Actions for the Power Platform | Microsoft Docs"
description: "Learn about the ALM-related tools, APIs, and services that are available to developers when using Azure DevOps."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 06/04/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# Preview: GitHub Actions for the Power Platform

[This topic is pre-release documentation and is subject to change.]

[GitHub Actions](https://help.github.com/articles/about-github-actions) enable developers to build automated software development lifecycle workflows.

With GitHub Actions for the Power Platform you can create workflows that you can set up in your repository to build, test, package, release and deploy apps, automations, bots and other components built on the Power Platform. avaiable actions include: 

<ul><li>Import/export of application metadata (also known as
solutions) that contains the various platform components such as customer engagement apps (Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation), canvas apps, model-driven apps, UI flows, virtual agents, AI Builder models, and connectors between development environments and source control</li></ul>
<ul><li>Deploying to downstream environments</li></ul>

<ul><li>Provisioning or de-provisioning
environments</li></ul>

<ul><li>Perform static analysis check against solutions by using the Power Apps checker service</li></ul>


GitHub actions for the Power Platform can be used along with any other available
GitHub actions to compose your build and release workflows. Workflows
that teams commonly put in place include provisioning development environments, Export from Development environment to source control, generate builds, and release.

## Key concepts
GitHub Actions enable you to create custom software development life cycle (SDLC) workflows directly in your GitHub repository. For an overview of GitHub Actions and core concepts, review the following articles:

<ul><LI> [About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions) </li></ul>

<ul><LI>[Core concepts](https://help.github.com/actions/getting-started-with-github-actions/core-concepts-for-github-actions) </li></ul>

<ul><LI> [About packaging with GitHub Actions](https://help.github.com/en/actions/publishing-packages-with-github-actions/about-packaging-with-github-actions) </li></ul>

## What are GitHub actions for the Power Platform?

The GitHub actions for the Power Platform are a collection of Power Platform&ndash;specific GitHub actions that eliminate the need to manually download custom tooling and
scripts to manage the application lifecycle of apps built on the Power Platform. The tasks can be used
individually to perform a simple task, such as importing a solution into a
downstream environment, or used together in a workflow to orchestrate a
scenario such as "generate a build artifact", "deploy to test", or "harvest maker
changes." The build tasks can largely be categorized into four types:

- Helper

- Quality check

- Solution

- Environment management

For more information about the available tasks see [GitHub Power Platform Actions](devops-github-power-actions.md). 

## Get GitHub actions for the Power Platform

GitHub actions for the Power Platform can added to your repo 
from [GitHub Marketplace](https://github.com/marketplace?type=actions).

## Connection to environments

To interact with a Power Platform environment, a secret must be created that enables the various GitHub actions to perform the required task. Two types of connections are available:

- Username/password: Configured as a generic service connection with username and password. Note that username/password does not support multi-factor authentication.
- Service principal and client secret: (recommended) This connection type uses service principal based authentication and supports multi-factor authentication.

## Configure service connections using a service principal

To configure a connection using service principal, you must first create an application registration in Azure Active Directory (AAD) with the required permissions and then create the associated Application User in the Power Platform environment you want to connect to. We have offered a script to facilitate some of the steps required in the section below, while detailed information with manual step-by-step instructions are available [here](https://docs.microsoft.com/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#azure-application-registration).

### Create service principal and client secret using PowerShell

This PowerShell script assists in creating and configuring the service principal to be used with the Microsoft Power Platform Build Tools tasks. It first registers an Application object and corresponding Service Principal Name (SPN) in AAD.

This application is then added as an administrator user to the Power Platform tenant itself.

**Installation**

Download the following PowerShell cmdlet: https://pabuildtools.blob.core.windows.net/spn-docs-4133a3fe/New-CrmServicePrincipal.ps1

<ul><li>Open a regular Windows PowerShell command prompt (standard, not PS core)
</li></ul> 
<ul><li>Navigate to the folder where you saved the script, and unblock the script using the following command: `Unblock-File New-CrmServicePrincipal.ps1`
</li></ul>
<ul><li>Run the script: `.\New-CrmServicePrincipal.ps1`</li></ul>

The script will prompt two times with AAD login dialogs:


<ul><li>1st prompt: to login as administrator to the AAD instance associated with the Microsoft Power Platform tenant
</li></ul> 
<ul><li>2nd prompt: to login as tenant administrator to the Microsoft Power Platform tenant itself
</li></ul>


Once successful, 3 columns are displayed:

<ul><li>Power Platform TenantId</li></ul>
<ul><li>Application ID</li></ul>
<ul><li>Client Secret (in clear text)</li></ul>

Use the information displayed to configure the Power Platform service connection. 

> [!IMPORTANT]
> Keep the client secret safe and secure. Once the PowerShell command prompt is cleared, you cannot retrieve the same client secret again.


### Configure environment with the Application ID
The Application ID must be added as an Application User in the Power Platform environment you are connecting to. Information on how to add an application user is available [here](https://docs.microsoft.com/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#application-user-creation) 

Ensure that the added Application User has the system administrator role assigned (available from “Manage Roles” in the security settings for the application user).

## Frequently asked questions (FAQs)

**Do the GitHub actions only work for Power Apps?**  

*The GitHub actions work for both canvas and model-driven apps, Power Virtual Agents, UI Flows and traditional flows, AI Builder, custom connectors and dataflows, all of which can now be added to a solution. This also includes customer engagement apps (Dynamics 365 Sales, Customer Service, Field Service, Marketing, and Project Service Automation). Separate build tasks are available for Finance and Operations applications.*

**Can I include flow and canvas apps?**

*Yes, flows and canvas apps are solution aware so if these are added to your solution, they can participate in the lifecycle of your app.  However, some steps still require manual configurations. This will be addressed later this year when we introduce environment variables and connectors A list of current limitations are available here: [Known limitations](/powerapps/maker/common-data-service/use-solution-explorer#known-limitations).*

**How much does the GitHub actions for the Power Platform cost?**

*The GitHub actions are available at no cost. However, a valid GitHub subscription is required to utilize the actions on GitHub. 2000 action minutes/month are available for free to get started. More information is available [GitHub Pricing](https://github.com/pricing/).*

**How can developers use the results of the Checker task?**

*The output of the Checker task is a [Sarif file](https://sarifweb.azurewebsites.net/) and both VS Code and Visual Studio extensions are available for viewing and taking action on Sarif files.*

### See Also

[Available GitHub Actions](devops-github-power-actions.md)
