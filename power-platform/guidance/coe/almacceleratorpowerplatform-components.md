---
title: "Use the ALM Accelerator for Power Platform App | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform will help you follow ALM patterns and practices. It enables you to source control your solutions and move them from your development environment to test and production environments using Azure DevOps"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
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
# Use the ALM Accelerator for Power Platform App (Preview)

> [!NOTE]
> ALM Accelerator for Power Platform is currently in public preview. Please see Issues currently tagged as [vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the Roadmap to be completed prior to general availability. While in Public Preview it can be expected that there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the Public Preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

## Demo: ALM Accelerator for Power Platform

Watch how to use the ALM Accelerator for Power Platform solution.
> [!VIDEO https://www.youtube.com/watch?v=-P3uSUTdsSY]
>

## What's in the solution

The ALM Accelerator for Power Platform is a Canvas App and a set of Azure Pipelines and templates to provide a simplified interface for developers. With the ALM Accelerator for Power Platform, developers can commit and create pull requests for their development work in the Power Platform. The combination of the Azure Pipelines and the App is what make up the full ALM Accelerator for Power Platform (AA4PP) solution. The pipelines and the App are **reference implementations**. It was developed for use by the internal development team for the CoE Starter Kit. AA4PP is open-source and is available to the public to show how healthy ALM can be achieved in the Power Platform. AA4PP can be used as is or customized for specific business scenarios.

The solution is the Dataverse Solution System. All Application Lifecycle Management in the Power Platform is based on makers creating components within a Solution. To use the AA4PP your components (Apps, Flows, Customizations, and other components) must first be included in a solution. A solution in Dataverse is a deployable package of components that AA4PP will unpack and store in Azure DevOps Git source control.

The target end user for AA4PP is the Power Platform Maker who is comfortable with Solutions, Git, Azure DevOps, and ALM concepts. If you're not already familiar with these technologies and concepts, you should consider taking the following courses.

1. [Introduction to version control with Git](/learn/paths/intro-to-vc-git/)
2. [Use Git version-control tools in Visual Studio Code](/learn/modules/use-git-from-vs-code/)
3. [Build applications with Azure DevOps](/learn/paths/build-applications-with-azure-devops/)
4. [Manage solutions in Power Apps and Power Automate](/learn/modules/manage-solutions-power-automate/)

The target user for setting up AA4PP would generally be an Administrator with a deeper understanding of Power Platform Environments and Solutions, Azure Pipelines, and Administration as well as familiarity with Azure Active Directory and Dataverse Administration.

![The Maker Team](media/almacceleratorpowerplatform-components/TheMakerTeam.png "The Maker Team")

## Pipelines

The AA4PP Pipelines are a set of YAML pipelines intended to be used with Azure DevOps. Eventually, these pipelines will be ported to support GitHub workflows, but currently only support Azure Pipelines. These reference pipelines were written to demonstrate an end to end ALM process for Power Platform solutions. The pipelines use first-party tasks provided by Microsoft, some third-party tasks and low-level PowerShell scripts to automate all of the ALM scenarios. As such, the pipelines support scenarios related to unpacking / source controlling / building and deploying a solution from a development environment. The pipelines support the ability to deploy to many environments, but only currently demonstrate deployment from a Development environment to a Build Validation to Test and ultimately to Production based on the ALM process used by the CoE Starter Kit development team.

The Pipelines handle the following.

### Import Solution

1. Select an existing Solution from Source Control
1. Import a build of that Solution from Source Control
1. Future: Handle seeding environments with Data and configuring Connection References, Environment Variables, Sharing, and Ownership

### Delete Unmanaged Solution

1. Export an Unmanaged Solution from a Development Environment as Managed.
1. Import Managed Solution to Development Environment
1. Delete the Managed Solution from a Development Environment.

### Export to Git

1. Create a New Branch Based on an Existing Branch
1. Export an Unmanaged Solution from a Development Environment
1. Unpack Solutions to Human Readable Format
1. Store Unpacked Files in a Git Repository Branch

### Create Pull Request

1. Create a Pull Request in Azure DevOps for your New Branch
1. Run a Build on a Pull Request via Branch Policy to validate your changes including running Solution Checker
1. Include Branch Policies to require additional checks such as Reviewers, Work Items Linking

### Deploy to Environment

1. Create a trigger for when your Solution is deployed to an environment
1. Build Managed Solution and Deploy based on Trigger
1. Handle Upgrade vs Update of Solution based on changes in the Solution
1. Handle Setup of the Solution in the Target Environment
   - Deploy configuration data
   - Update Connection References
   - Update Environment Variable Values
   - Share Apps with Azure Active Directory Groups
   - Activate Flows
   - Create Teams in Dataverse for Azure Active Directory Groups
   - Update Solution Component Ownership

## ALM Accelerator App

The AA4PP Canvas App provides a convenience layer on top of the AA4PP Pipelines. The AA4PP Canvas App allows Power Platform Makers to easily invoke the Azure Pipelines to perform their complex tasks without context switching between the Power Apps environment and the Azure DevOps. The goal of the App is to provider Makers with a friction free way of performing common Development and ALM tasks as described in the following.

1. Target multiple Organization / Projects and Repos in Azure DevOps
2. Get the latest version of a solution into the development environment by importing the solution
3. Remove existing work that needs to be rebased from source control by deleting an unmanaged solution
4. Push the latest changes from the development environment to source control by exporting to Git
5. Submit the changes tied to a Work Item for Review by creating a pull request
6. Monitor the progress of moving the changes between environments

> [!NOTE]
>While all of these processes can be achieved directly from Azure DevOps the App provides a simple push-button interface for performing these tasks. Admins will be able to control which processes are available for makers thru *user deployment settings*

## ALM Accelerator Flow and Maker Experience

1. Once you have installed and configured the app, launch it from your Environment under Apps.

    > [!NOTE]
    > When you first launch the app you may need to consent to the app using your connections.

2. The first time you open the app you will be asked to select an environment. Next time you open the app, it will remember which environment you were working on.

    ![Configure Settings for AA4PP](media/almacceleratorpowerplatform-components/aa4pp-environment-selection.png "Configure Settings for AA4PP")

    > [!NOTE]
    > In order for your Environment to show up in this drop down a service connection in the Azure DevOps project you just selected is required (see [Create a Service Connection for DevOps to access Power Platform](setup-almacceleratorpowerplatform.md#create-service-connections-for-devops-to-access-power-platform). Additionally, verify that you've followed the steps to reconnect the flow above if you do not see any environments in the list.

3. Once the environment is selected, the main screen will display a list of all the **unmanaged solutions** in the environment. Depending on the *user deployment settings* your user has assigned you will be able to see the following options for each solution:

    - **Commit Solution**: It commits all the changes you have done within the solution in your version control system.
    - **Deploy Solution**: Allows you to move the changes across environment.
    - **Choose a Profile**: Allows you to configure what **Organization**, **Project**, **Repository**, **Target Branch**, and **Environments** your solution can be deployed to.
    - **Delete a solution**: Deletes the solution allowing you to reimport if necessary from source control again with latest changes.
    - **Request History**: (right chevron icon): Provides a list of requests (commits and deployments) done for that solution.
    
   ![Solution List](media/almacceleratorpowerplatform-components/aa4pp-main-screen.png "Solution List")

4. You can now create a new solution from the maker portal or also import an unmanaged solution from an existing Azure DevOps project to begin making changes to it. To import a solution, use the **Import Solutions** button and select a **Profile, Solution Source, Solution Folder and Configuration (Optional)**.

   - **Profile** the configured profiles your user has access to, this profile points to an organization and project in Azure DevOps.
   
   - **Solution Source** is based on the branches in Azure DevOps for the Project you selected in the configuration.

   - **Solution Folder** is a list of folders in the selected branch that contain a **SolutionPackage folder** from a previous export.

   - **Configuration** is a directory under the config directory in the Solution Folder that contains deployment settings and configuration data. For more information on this, see the [Deployment Configuration Guide](setup-almacceleratorpowerplatform-deployment-config.md)

    > [!NOTE]
    > The idea here is that you're either pulling the latest from the Solution branch or possibly want to pull another makers branch into your own environment. The configuration allows you to ensure that all of the necessary post solution import configuration and data exists in your environment.

   ![Import Solution from Branch in Azure DevOps](media/almacceleratorpowerplatform-components/aa4pp-solution-import.png "Import Solution from Branch in Azure DevOps")

5. Once you have created or imported your solution, you are going to need to choose a **solution profile** to the solution so you can associate the solution to a specific **Organization**, **Project**, **Repository**, **Target Branch**, and **Environments** where you will be able to deploy the solution into
    
   ![Solution Profile Selection](media/almacceleratorpowerplatform-components/aa4pp-solution-profile-selection.png "Solution Profile Selection")

    > [!NOTE]
    > Depending on wether you are an admin or not, you will be able to create new deployment profiles from here. If you are a maker the likelihood is that an administrator from your organization has made some profiles available for you to choose from. If still nothing suits what you want, you will need to work with your administrator to request a new profile.

7. Once you have a profile associated, you can also begin to configure your solution for deployment. **Select the Configure Deployment Settings link** under the name of the Solution. On the configuration deployment page, you'll see the following items

   - Deployment Environments

     ![Deployment Environments List](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-environment.png "Deployment Environments List")

     - The environments listed are the one configured in the deployment steps in the deployment profiles created by the administrator.

   - Connection References

      ![Connection Reference Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-connection-references.png "Connection Reference Configuration")

      - This screen lists all of the connection references in your solution and allows users to create connections in their downstream environments to hook up the connection references in the target environment.
      - To create a new connection **select the + button**.
      - After creating a new connection, **select the refresh button** in the top right to get the latest list of connections.
      - To select an existing connection in the target environment **select a connection from the dropdown list**.
      - To Navigate to the connection in the target environment **select the name or the status of the connection**.

   - Environment Variables

      ![Environment Variables Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-environment-vars.png "Environment Variables Configuration")

      - This screen lists all of the environment variables in your solution and allows users to set the value of the environment variables in the downstream environment.
      - For standard environment variables (for example String, Number, JSON) **enter the value in the text box** to the right of the environment variable name
      - For data source environment variables **use the dropdowns to select the appropriate data source** to use in the downstream environment.

   - App Sharing

      ![App Sharing Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-app-sharing.png "App Sharing Configuration")

      - This screen lists all of the apps in your solution and allows users to share the apps in the downstream environment with an Azure AAD Group.
      - Use  the dropdown to **select the Azure AAD group** with which you'd like to share the app.
      - To view the Group details **select the details icon**. This button will launch a new browser window with a link to the AAD Group in the Azure Portal.
      - To set the permissions **select the permissions dropdown** and set the permissions to either Can View, Can Edit or Can View and Share.

   - Component Ownership

      ![Component Ownership Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-comp-ownership.png "Component Ownership Configuration")

      - This screen lists all of the Flows in your solution. Users can configure the owner of the Flow in the downstream environment by selecting a Dataverse user.
      - Use  the **dropdown to select a Dataverse user** to own the Flow in the downstream environment.
      - To view the Flow **select the name of the Flow** to open a new window with the Flow Definition.

8. Once you've configured your solution, you can push your changes to Git using the **Commit Solution** button for your solution. Depending on the permissions you are given, you will see here a toggle to **Show Advanced** options. This allows you to choose an existing branch or to create a new one with a specific naming convention. When not given permission to these options the app will create a new branch based on your username and **deployment profile** data.

    > [!NOTE]
    > Be sure to publish your changes before initiating the push.

   - Select an **existing branch** or **create a new branch** based on an existing branch and enter a **comment**. Use the hashtag notation for example `#123` to link the changes to a specific work item in Azure DevOps and Select **Commit**.
     ![Export Solution from Dataverse to New Azure DevOps Branch](media/almacceleratorpowerplatform-components/aa4pp-commit-solution.png "Export Solution from Dataverse to New Azure DevOps Branch")

   - When the push begins, a waiting indicator will appear. If the push is successful, a checkbox will appear otherwise a red x will appear. To see the progress of your push, press the progress indicator which will take you to the running pipeline in Azure DevOps.
   - Repeat the pushes as you iterate on your solution.
   
    > [!NOTE]
    > Using the progress icons links to visualize what is happening in the pipelines in Azure DevOps can be disabled for makers.

9. Once you have finished the changes in your solution and you are ready to deploy them across other environment use the **Deploy Solution** button. 

    > [!NOTE]
    > Be sure to publish your changes before initiating the push.

    Depending on the permissions, you will see the **Advanced Settings** toggle.

   - With the **Advanced Settings** toggle off, choose the environment you want to deploy to and use the **Deploy Solution** button.

       ![Create Pull Request properties](media/almacceleratorpowerplatform-components/aa4pp-deploy-solution.png "Create Pull Request properties")

   - Using the **Advanced Settings** Specify the Source and Target branch and enter a Title and Comment for your Pull Request and use the **Deploy Solution** button.

       ![Create Pull Request properties Advanced](media/almacceleratorpowerplatform-components/aa4pp-deploy-solution-advanced.png "Create Pull Request properties Advanced")

10. Once you deploy the solution the next things that happen is going to depend on the **approval type** of the **deployment step**. 
    
    - **Pull Request**: A Pull Request is created for your changes, the remaining steps to Merge and Release to Test occur in Azure DevOps. Depending on the Branch Policies and Triggers configured for your Target Branch, an Azure DevOps user can approve or reject your Pull Request based on their findings in the submitted changes. The status of the Pull Request will appear in the App.

    - **Environment**: The pipeline to deploy the solution to the target environment will be triggered, the remaining approval steps will occur in Azure DevOPs.

11. To initiate a **solution upgrade** in the target environment, you can tag a Pull Request with the **solution-upgrade** tag.

       ![Tag Pull Request for Solution Upgrade](media/setup-almacceleratorpowerplatform/image-20210524113929989.png "Tag Pull Request for Solution Upgrade")

12. Approving the PR or the pipeline execution (depending on the approval type selected for the step/environment) will start the deployment of your solution to the selected environment. If you get the approval for either your PR or pipeline execution, you'll see the progress indicator state the deployment has started. You can also use the right chevron icon to visualize the request history.

      ![Request History for a solution](media/almacceleratorpowerplatform-components/aa4pp-request-history.png "Request History for a solution")

13. For Production, you can either need to go into **advanced settings** for the deployment and choose the main branch used to trigger the deployment to production or create the PR directly in Azure DevOps

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
