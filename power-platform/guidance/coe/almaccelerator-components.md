---
title: "ALM Accelerator for Makers | MicrosoftDocs"
description: "ALM Accelerator for Makers will help you follow ALM patterns and practices to implement source control and move your solutions from your development environment to test and production environments by using GitHub."
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/18/2021
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use the ALM Accelerator for Makers app (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

> [!IMPORTANT]
> The ALM Accelerator for Makers components are for reference only. For more robust deployment configurations, including components that need to be configured as part of—or after—solution deployment, we recommend that you use the ALM Accelerator for Power Platform app. More information: [Set up ALM Accelerator for Power Platform components](setup-almacceleratorpowerplatform-cli.md) and [Use ALM Accelerator for Power Platform components](almacceleratorpowerplatform-components.md)

Use the ALM Accelerator for Makers app to follow application lifecycle management (ALM) patterns and practices for source control, and move your solutions from development to test to production environments by using GitHub. More information: [Set up ALM Accelerator for Makers components](setup-almaccelerator.md)

ALM Accelerator for Makers enables makers to apply source control strategies by using GitHub, and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, ALM Accelerator for Makers helps makers work without needing to know about downstream technologies. Makers can switch quickly from developing solutions to implementing source control for the solution&mdash;and, ultimately, push their apps to other environments with as few interruptions to their work as possible.

Makers can use the ALM Accelerator for Makers app to view all their projects, and deploy their work in progress or completed solution to a test or production environment. After a new project has been created and approved, makers can go to [make.powerapps.com](https://make.powerapps.com) to build and create assets&mdash;such as apps, flows, and tables&mdash;in a solution that has been created for them.

## License requirements for users of ALM Accelerator for Makers

ALM Accelerator for Makers uses the following premium Power Platform features

- Dataverse
- Custom Connector

For Makers to use the features of the ALM Accelerator they to have a GitHub account. GitHub free plan is supported. Please note the benefits of using a GitHub paid plan here [configure github organizational secrets](setup-almaccelerator.md#configure-github-org-secrets)

## Prerequisite

This app uses Microsoft Dataverse, and a Premium license is required for every app user.

1. Go to [make.powerapps.com](https://make.powerapps.com).
1. On the left pane, select **Solutions**.
1. Select the **Power Platform GitHub ALM** solution, and then select **ALM Accelerator for Makers**. You might need to open the app in a private browser session if the app fails to load. The app dashboard shows all projects created by your user.

   ![ALM Accelerator for Makers app.](media/git-23.png "ALM Accelerator for Makers app")

## Request approval for a new project

1. Select **New Project** to create your first project.
1. Enter a name and description (optional), and then select **Create Project**.

When a user submits this request, an approval request is sent to a predefined administrator. The administrator reviews the request, and then approves or rejects it. After a project is created and approved, go to make.powerapps.com to build and create resources (apps, flows, tables, and so on) under the newly created solution for your project.

## Create an environment and GitHub repository

When an administrator approves a project, a new environment with a Dataverse database is created. This environment is dedicated to the maker and their solution. By default, this developer environment is set to expire in 30 days, but users can request an extension.

A GitHub repository is also created. This repository will be used to persist all of the resources of the project contained in the solution.

## Open your project

When a project is approved, the **Deploy** button is activated and a link to the solution is shown. A user can go to make.powerapps.com directly and open their solution in the newly created environment by selecting **Open project solution**.

## Deploy your project to test

A maker can deploy to a test environment at any point during their development phase. No approval is required for a maker to deploy to a test environment. When deploying to test, the solution for this project is also checked in to the GitHub repository under a developer branch.

1. Select **Deploy** for the project you want to move to test.
1. In the **Deployment** dialog, select the test environment, and then enter any **Notes** associated with the deployment.
1. Select **Deploy**.

## View deployment status

ALM Accelerator for Makers displays the status of the deployment. When a deployment is completed or fails, both the admin and the app maker receive an email notification with the details. When the deployment is successful, the notification email includes links to the environment where the solution has been deployed.  

![View deployment status in ALM Accelerator for Makers.](media/git-32.png "View deployment status in ALM Accelerator for Makers")

## View build details

Admins can monitor progress step by step on the **Actions** tab of the GitHub repo. They can also check out the cloud flows used to orchestrate the deployment.

![View build details in Github.](media/git-33.png "View build details in Github")

## Deploy your project to production

Before a maker can deploy their project to production, the project must have been successfully deployed to the test environment. Also, an approval from an administrator is required to deploy to a production environment. When deploying to test, a pull request is created and when the deployment request is approved, the solution for the project is merged into the main branch in the GitHub repo.

1. Select **Deploy** for the project you want to move to production.
1. In the **Deployment** dialog, select the production environment, and then enter any **Notes** associated with the deployment.
1. Select **Deploy**.

## View deployment history

Makers can check the deployment history for their project by opening the detail pages for their project and selecting **>**.

:::image type="content" source="media/git-35.png" alt-text="View deployment history":::

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
