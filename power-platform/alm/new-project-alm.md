---
title: "Implement ALM for a new project with Power Apps | Microsoft Docs"
description: "Learn how to implement ALM for a new project with Power Apps"
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 04/08/2020
ms.reviewer: ""
ms.service: powerapps
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "powerapps"
ms.assetid: 
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---

# Scenario 0: ALM for a new project
If you're new to Power Apps and creating your first app, follow the
tasks described in this article to successfully deploy a functioning application to your production environment using a healthy application lifecycle management (ALM) strategy.
<!--In steps 4 and 7, the cross-references go to sections in the devops-build-tools article that consist only of graphics. Are those sections incomplete? -->

| Task  | Description       | More information   |
|-------|-------------------|--------------------|
| 1. Plan and implement your environment strategy.           | Determining the environments you'll need and establishing an appropriate governance model is a critical first step. At a minimum, you should have two environments: dev and production. However, we recommend that you have three environments: dev, test, and production. | [Environment strategy](environment-strategy-alm.md) |
| 2. Create a solution and publisher.      | Start with a blank solution, and create a custom publisher for that solution.        | [Solution publisher](solution-concepts-alm.md#solution-publisher)    |
| 3. Set up your DevOps project.     | Set up a DevOps project in which you'll later add several pipelines to perform required processing like export and deployment of your solution.         | [Setting up continuous integration and deployment](basics-alm.md#continuous-integration-and-deployment)<br /><br /> [Create a project](https://docs.microsoft.com/azure/devops/pipelines/get-started/pipelines-sign-up?view=azure-devops#create-a-project)   |
| 4. Create your export from development pipeline in DevOps. | Create a DevOps pipeline to export your completed unmanaged solution to a managed solution.     | [Create your first pipeline](https://docs.microsoft.com/azure/devops/pipelines/create-first-pipeline?view=azure-devops)<br /><br />[Build and release pipelines](devops-build-tools.md#build-and-release-pipelines)<br /><br /> [Build pipeline: Export a solution from development (DEV)](devops-build-tools.md#build-pipeline-export-solution-from-development)            |
| 5. Configure and build your app.     | Create your app within the solution you created.   | Model-driven apps: [Build your first model-driven app from scratch](../maker/model-driven-apps/build-first-model-driven-app.md)<br /> <br />Canvas apps: [Create an app from scratch using Common Data Service](../maker/canvas-apps/data-platform-create-app-scratch.md)     |
| 6. Add any additional customizations to that solution.     | Add additional components as needed. Choose from a vast selection of components, such as flows, AI models, export to data lake configuration, web resources, plug-ins, and even other apps.  | [Create components in a solution](../maker/common-data-service/use-solution-explorer.md#create-components-in-a-solution)<br /><br />[Add an existing component to a solution](../maker/common-data-service/use-solution-explorer.md#add-an-existing-component-to-a-solution) |
| 7. Create a deployment pipeline in DevOps.                 | Create a DevOps pipeline to deploy your managed solution to one or more target production environments.      | [Build and release pipelines](devops-build-tools.md#build-and-release-pipelines)<br /><br /> [Release pipeline: Deploy to production (PROD)](devops-build-tools.md#release-pipeline-deploy-to-production)   |
| 8. Grant access to the app.     | Assign licensing and assign security roles to share applications with users.      | [Licensing](basics-alm.md#licensing)<br /><br /> [Share a model-driven app](../maker/model-driven-apps/share-model-driven-app.md)<br /><br /> [Share a canvas app](../maker/canvas-apps/share-app.md)    |

### See also
[Scenario 1: Citizen development (app and flow makers)](citizen-dev-alm.md)
