---
title: "Implement ALM for a new project with Microsoft Power Platform"
description: "Learn how to implement ALM for a new project with Power Platform"
keywords: 
author: Mattp123
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 02/06/2025
ms.reviewer: sabrinadi
ms.topic: concept-article
search.audienceType: 
  - maker
---
# Scenario 0: ALM for a new project

If you're new to Power Apps and creating your first app, follow the
tasks described in this article to successfully deploy a functioning application to your production environment using a healthy application lifecycle management (ALM) strategy.

| Task  | Description       | More information   |
|-------|-------------------|--------------------|
| 1. Plan and implement your environment strategy.           | Determining the environments you'll need and establishing an appropriate governance model is a critical first step. At a minimum, you should have two environments: dev and production. However, we recommend that you have at least three environments: dev, test, and production. | [Environment strategy](environment-strategy-alm.md) |
| 2. Plan your solution strategy.      | Decide whether to consolidate all customizations into a single unmanaged solution or adopt a modular design with multiple solutions, and determine if each should be developed in its own isolated Microsoft Dataverse development environment. At a minimum, create a new blank solution, and create a custom [publisher](solution-concepts-alm.md#solution-publisher) for that solution. | [Organize solutions](organize-solutions.md)    |
| 3. Set up your DevOps project.     | Set up a DevOps project in which you'll later add several pipelines to perform required processing like export and deployment of your solution.         | [Setting up continuous integration and deployment](basics-alm.md#continuous-integration-and-deployment)<br /><br />[Create a project](/azure/devops/pipelines/get-started/pipelines-sign-up?view=azure-devops#create-a-project&preserve-view=true)   |
| 4. Store solution source code in DevOps. | You can either use the Dataverse Git integration or create a DevOps pipeline to export your completed unmanaged solution to a Azure DevOps repository.     |  [Dataverse Git integration](git-integration/overview.md) <br /><br /> [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?view=azure-devops&preserve-view=true)<br /><br />[Build pipeline: Export a solution from development (DEV)](devops-build-tool-tasks.md#build-pipeline-export-solution-from-development)            |
| 5. Configure and build your app.     | Create your app within the solution you created.   | Model-driven apps: [Build your first model-driven app from scratch](/powerapps/maker/model-driven-apps/build-first-model-driven-app)<br /> <br />Canvas apps: [Create an app from scratch using Microsoft Dataverse](/powerapps/maker/canvas-apps/data-platform-create-app-scratch)     |
| 6. Add any additional customizations to that solution.     | Add additional components as needed. Choose from a vast selection of components, such as flows, AI models, export to data lake configuration, web resources, plug-ins, and even other apps.  | [Use table segmentation in solutions](segmented-solutions-alm.md) <br /><br />[Create components in a solution](/powerapps/maker/common-data-service/use-solution-explorer#create-components-in-a-solution)<br /><br />[Add an existing component to a solution](/powerapps/maker/common-data-service/use-solution-explorer#add-an-existing-component-to-a-solution) |
| 7. Deploy your solution.                |Use Pipelines in Power Platform or create a DevOps pipeline to deploy your managed solution to one or more target production environments.      |[Pipelines in Power Platform](pipelines.md)  <br /><br />[Build and release pipelines](devops-build-tool-tasks.md#build-and-release-pipelines)<br /><br /> [Release pipeline: Deploy to production (PROD)](devops-build-tool-tasks.md#release-pipeline-deploy-to-production)   |
| 8. Grant access to the app.     | Assign licensing and assign security roles to share applications with users.      | [Licensing](basics-alm.md#licensing)<br /><br /> [Share a model-driven app](/powerapps/maker/model-driven-apps/share-model-driven-app)<br /><br /> [Share a canvas app](/powerapps/maker/canvas-apps/share-app)    |

### See also

[Scenario 1: Citizen development (app and flow makers)](citizen-dev-alm.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
