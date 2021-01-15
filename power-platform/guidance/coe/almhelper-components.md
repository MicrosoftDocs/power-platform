---
title: "PowerOps components | MicrosoftDocs"
description: "The PowerOps components will help you follow best DevOps practices to source control and move your solution(s) from your development environment to test and production environments using GitHub."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use PowerOps components

The PowerOps components will help you follow best DevOps practices to source control and move your solution(s) from development to test to production environments using GitHub. More information: [Set up PowerOps components](setup-powerops.md)

The PowerOps components enable makers to apply source control strategies using GitHub and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition PowerOps provides makers the ability to work without intimate knowledge of the downstream technologies and to be able to switch quickly from developing solutions to source controlling the solution and ultimately pushing their apps to other environments with as few interruptions to their work as possible.

The PowerOps app shows a maker all of their projects and allows them to deploy their work in progress or final solution to a test and production environment.
Once a new project is created and approved, makers can navigate to [make.powerapps.com](https://make.powerapps.com) to build and create assets - such as apps, flows, and tables - in a solution that has been created for them.

**Prerequisite**: This app uses Microsoft Dataverse; a Premium license is therefore required for every app user.

1. Go to [make.powerapps.com](<https://make.powerapps.com>).
1. On the left pane, select **Solutions**.
1. Select the **Power Platform GitHub ALM** solution and open the **PowerOps** app. You may need to launch the app in an In Private browser session if the app fails to load.

![PowerOps app](media/git-23.png "PowerOps app")

The app dashboard shows all projects created by your user.

## Request approval for a new project

- Select **New Project** to create your first project.
- Enter a name and description (optional) and select **Create Project**.

![Request approval for a new project](media/git-26.png "Request approval for a new project")

When a user submits this request, an Approval request is sent to a pre-defined administrator. The admin will review the request and approve or reject the request. Once a project is created and approved, navigate to the maker portal to build and create resources (apps, flows, entities, and so on) under a newly created solution for your project.

![Admins can approve or reject new project requests](media/git-27.png "Admins can approve or reject new project requests")

## Create an environment and GitHub repository

When an administrator approves a project, a new environment with a Microsoft Dataverse database is created. This environment is dedicated to the maker and their solution. By default, this developer environment is set to expire in 30 days, but users can request an extension.  

![When an administrator approves a project, a new environment with a Microsoft Dataverse database is created. ](media/git-28.png "When an administrator approves a project, a new environment with a Microsoft Dataverse database is created. ")

A GitHub repository is also created. This repository will be used to persist all of the resources of the project contained in the solution.

## Open your project

When a project is approved, the **Deploy** button is activated and a link to the solution is shown. A user can navigate to the maker portal directly and open their solution in the newly created environment.

![When a project is approved, the **Deploy** button is activated](media/git-30.png "When a project is approved, the **Deploy** button is activated")

## Deploy your project to test

A maker can deploy to a test environment at any point during their development phase. No approval is required for a maker to deploy a test environment.
When deploying to test, the solution for this project is also checked in to the GitHub repository under a developer branch.

![Deploy your project to test](media/git-31.png "Deploy your project to test")

## View deployment status

PowerOps will show the status of the deployment. When a deployment is completed or fails, both the admin and the app maker will receive an email notification with the details. If the deployment is successful, the notification email will have links to the environment where the solution has been deployed.  

![View deployment status in PowerOps app](media/git-32.png "View deployment status in PowerOps app")

## View build details

Admins can monitor the progress of step by step within the **Actions** tab of the GitHub repo.
They can also check out the cloud flows used to orchestrate the deployment.

![View build details in Github](media/git-33.png "View build details in Github")

## Deploy your project to production

Before a maker can deploy to production, the deployment to test has to succeed. An approval from an administrator is required to deploy to a production environment.
When deploying to test, a pull request is created and when the deployment request is approved, the solution for the project is merged into the main branch in the GitHub repo.

![Deploy your project to production](media/git-34.png "Deploy your project to production")

## View deployment history

Makers can check the deployment history for their project by navigating to the detail pages for their project (using > arrow)

![View deployment history](media/git-34.png "View deployment history")
