---
title: "GitHub Actions for Microsoft Power Platform | Microsoft Docs"
description: "Learn about the ALM-related tools and services that are available to developers when using GitHub and Microsoft Power Platform."
keywords: 
author: mikkelsen2000
ms.author: pemikkel
manager: kvivek
ms.custom: ""
ms.date: 09/22/2020
ms.reviewer: "pehecke"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - developer
search.app: 
  - PowerApps
  - D365CE
---

# GitHub Actions for Microsoft Power Platform (Preview)

[This topic is pre-release documentation and is subject to change.]

[GitHub Actions](https://help.github.com/articles/about-github-actions) enable developers to build automated software development lifecycle workflows. With GitHub Actions for Microsoft Power Platform you can create workflows in your repository to build, test, package, release and deploy apps, perform automation, manage bots and other components built on Microsoft Power Platform. Available GitHub Actions include the following capabilities:

<ul><li>Import/export of application metadata (also known as
solutions) that contain the various platform components such as customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), canvas apps, model-driven apps, UI flows, virtual agents, AI Builder models, and connectors between development environments and source control.</li></ul>
<ul><li>Deploying to downstream environments.</li></ul>
<ul><li>Provisioning or de-provisioning environments. (Available in late 2020)</li></ul>
<ul><li>Perform static analysis check against solutions by using the Power Apps checker service (Available in late 2020)</li></ul>

GitHub Actions for Microsoft Power Platform can be used along with any other available GitHub Actions to compose your build and release workflows. Workflows that teams commonly put in place include provisioning development environments, export from development environment to source control, generate builds, and release.

> [!NOTE]
> GitHub Actions for Microsoft Power Platform are supported only for a Microsoft Dataverse environment with a database. More information: [Create an environment with a database](/power-platform/admin/create-environment#create-an-environment-with-a-database)

## Key concepts
GitHub Actions enable you to create custom software development life cycle (SDLC) workflows directly in your GitHub repository. For an overview of GitHub Actions and core concepts, review the following articles:

[About GitHub Actions](https://help.github.com/actions/getting-started-with-github-actions/about-github-actions)

[Core concepts](https://help.github.com/actions/getting-started-with-github-actions/core-concepts-for-github-actions)

[About packaging with GitHub Actions](https://help.github.com/en/actions/publishing-packages-with-github-actions/about-packaging-with-github-actions)

## What are GitHub Actions for Microsoft Power Platform?

The GitHub Actions for Microsoft Power Platform are a collection of Microsoft Power Platform&ndash;specific GitHub Actions that eliminate the need to manually download custom tooling and
scripts to manage the application lifecycle of apps built on Microsoft Power Platform. The tasks can be used
individually, such as importing a solution into a
downstream environment, or used together in a workflow to orchestrate a
scenario such as "generate a build artifact", "deploy to test", or "harvest maker changes." The build tasks can largely be categorized into four types:

- Helper

- Quality check

- Solution

- Environment management

For more information on individual tasks, see [GitHub Actions for Microsoft Power Platform](devops-github-available-actions.md).

## Get GitHub Actions for Microsoft Power Platform

You can use GitHub Actions for Microsoft Power Platform by adding the actions in your workflow definition file (.yml). Sample workflow definitions are available 
from [GitHub actions lab](https://github.com/microsoft/powerplatform-actions-lab).

## Connection to environments

To interact with a Dataverse environment, a secret must be created that enables the various GitHub Actions to perform the required task. Two types of connections are available:

- Username/password: Configured as a generic service connection with username and password. Note that username/password does not support multi-factor authentication.
- Service principal and client secret: This connection type uses service principal based authentication and supports multi-factor authentication (Service principal authentication available in late 2020).

## Available runners
GitHub Actions for Microsoft Power Platform can only run on windows agent. Cross platform compatibility will be available in late 2020

## Frequently asked questions (FAQs)

**Do the GitHub Actions only work for Power Apps?**  

*The GitHub Actions work for both canvas and model-driven apps, Power Virtual Agents, UI flows and traditional flows, AI Builder, custom connectors and data-flows, all of which can now be added to a solution. Also included customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).*

**Can I include flow and canvas apps?**

*Yes, flows and canvas apps are solution aware, so if these components are added to your solution they can participate in the lifecycle of your app.  However, some steps still require manual configurations, which will be addressed later this year when we introduce environment variables and connectors. A list of current limitations is available here: [Known limitations](/powerapps/maker/common-data-service/use-solution-explorer#known-limitations).*

**How much does the GitHub Actions for Microsoft Power Platform cost?**

*The GitHub Actions are available at no cost. However, a valid GitHub subscription is required to utilize the actions on GitHub. To get started, 2000 action minutes/month are available for free. More information is available [GitHub Pricing](https://github.com/pricing/).*

### See Also

[Available GitHub Actions](devops-github-available-actions.md)
