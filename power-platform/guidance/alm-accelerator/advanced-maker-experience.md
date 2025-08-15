---
title: ALM Accelerator for Power Platform advanced maker experience
description: Learn how advanced makers can use the ALM Accelerator for Power Platform.
ms.topic: how-to
ms.date: 04/12/2023
ms.subservice: guidance-toolkit
author: alvarezskinner
manager: devkeydet
ms.author: mapichle
ms.reviewer: sericks
ms.custom:
  - bap-template
  - sfi-image-nochange
---

# ALM Accelerator for Power Platform advanced maker experience

## Demo: ALM accelerator advanced maker experience

Watch the [demo video](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md#advanced-maker-experience-in-the-alm-accelerator-for-power-platform) to learn more about the advanced maker experience in the ALM Accelerator.

## Configure advanced maker settings

The following table describes how to configure the **User Functions** settings in the ALM Accelerator app to turn on the advanced maker experience.

| Field | Value | Description |
|-------|-------|-------------|
| Import Solutions | Allowed | Allow this function to show the **Import Solution** command in the app. |
| Delete Solutions | Allowed | Allow this function to show the **Delete Solution** command in the app. |
| Manage Solutions | Allowed | Allow this function to show the **Manage Solutions** command in the app. |
| Drillthrough Status | Allowed | Allow this function to enable users to drill into promote and deploy pipeline runs in the app. |
| Profile Creation | Allowed | Allow this function to enable users to create deployment profiles in the app. |
| Profile Updates | Allowed | Allow this function to enable users to update deployment profiles in the app. |
| Advanced Promote | Allowed | Allow this function to enable users to specify a source and target branch, or create a branch, using the advanced promote functionality. |
| Advanced Deploy | Allowed | Allow this function to enable users to specify a source and target branch for a pull request using the advanced deploy functionality. |
| Bypass Prepare | Allowed | Allow this function to enable users to skip the preparation step during the promotion of a solution, bypassing the need to configure deployment settings before committing to source control. |
| Show All Solutions | Allowed | Allow this function to enable users to see all solutions in the selected environment. |

The following table shows how the **User Labels** are configured for the advanced maker experience.

| Field | Description |
|-------|-------------|
| Deploy Solution | Enter a label or set the value to blank to use the default label, **DEPLOY SOLUTION**. |
| Commit Solution | Enter a label or set the value to blank to use the default label, **COMMIT SOLUTION**. |
| Import Solution | Enter a label or set the value to blank to use the default label, **IMPORT SOLUTION**. |
| Delete Solution | Enter a label or set the value to blank to use the default label, **DELETE SOLUTION**. |

## Walk-through: ALM Accelerator advanced maker experience

The ALM Accelerator administration app was used to configure the following user experience. The administrator app is installed with the ALM Accelerator. [Learn how to use the administration app to configure and share experiences](setup-deployment-user-profiles.md).

### Start the ALM Accelerator advanced maker experience

1. Select **Apps** > **ALM Accelerator for Power Platform**.

1. Create connections and grant consent when prompted.

1. If you're prompted to create an HTTP with Microsoft Entra connection, enter *https://graph.microsoft.com* for both the **Base Resource URL** and **Azure AD Resource URI**.

1. Select **Create** for each connection when prompted.

1. The first time you open the app, select an environment.

   The next time you open the app, it remembers which environment you were working in.

   A list of the unmanaged solutions in the environment appears. Depending on your user deployment settings, the following options are available for each solution:

   - **Commit Solution**: Commits all the changes you've made in the solution to your version control system. Deployment pipelines are created as part of the commit process.
   - **Deploy Solution**: Allows you to move the changes across environments.
   - **Choose a Profile**: Allows you to configure what organization, project, repository, target branch, and environments your solution can be deployed to.
   - **Delete Solution**: Deletes the solution. If necessary, import it again from source control with the latest changes.
   - **Import Solution**: Imports an unmanaged solution into your maker environment from source control.
   - **Request History** (**>**): Lists commits and deployments requested and completed for the solution.

    :::image type="content" source="media/aa4pp-main-screen.png" alt-text="Screenshot of the solution list in the ALM Accelerator advanced maker experience.":::

### Select a deployment profile for a solution

Create a solution in the Power Apps design studio or import an unmanaged solution from an Azure DevOps project. Then choose a profile to associate the solution with a specific organization, project, repository, target branch, and environments where you can deploy it.

1. To import a solution, select **Import Solution**, and then select a **Profile**, **Solution Source**, **Solution Folder**, and **Configuration**.

   - **Profile**: Points to an organization and project in Azure DevOps.

   - **Solution Source**: Select the branch in Azure DevOps that contains the project you selected in the configuration.

   - **Solution Folder**: From the list of folders in the selected branch that contain a **SolutionPackage folder** from a previous export, select the one that contains your solution.

   - **Configuration** (Optional): Select a directory under the config directory in the **Solution Folder** that contains deployment settings and configuration data. [Learn more about deployment configuration settings](setup-data-deployment-configuration.md).

   You're either pulling the latest changes from the solution branch or pulling another maker's branch into your environment. The **Configuration** setting makes sure that all the necessary post-solution import configuration data exists in your environment.

   :::image type="content" source="media/aa4pp-solution-import.png" alt-text="Screenshot of importing a solution from a branch in Azure DevOps.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

1. Find your solution in the list and select **Choose a Profile**.

1. Select a profile, and then select **Save**.

   > [!NOTE]
   > If you're an admin, you can create deployment profiles here. If you're a maker, an administrator might have made some available for you to choose from. If the profile you want isn't available, ask your administrator to create it for you.

### Configure the solution for deployment

After you've associated a profile with your solution, you can configure the solution for deployment.

1. Under the name of the solution, select **Configure Deployment Settings**.

1. Configure the following settings:

   - **Deployment Environment List**

     - The environments in the list are the ones that are configured in the deployment steps in the deployment profiles. Select an environment to deploy the solution to.

   - **Connection References**

      :::image type="content" source="media/aa4pp-deployment-settings-connection-references.png" alt-text="Screenshot of Connection Reference configuration in the ALM Accelerator.":::

      - All the connection references in your solution are listed. Users can create connections in their downstream environments to hook up the connection references in the target environment.
      - To create a connection, select **+**. After you create a connection, select **Refresh** in the upper-right corner to update the list.
      - To select a connection in the target environment, select a connection in the list.
      - To locate the connection in the target environment, select the connection's name or status.

   - **Environment Variables**

      :::image type="content" source="media/aa4pp-deployment-settings-environment-vars.png" alt-text="Screenshot of Environment Variables configuration in the ALM Accelerator.":::

      - All the environment variables in your solution are listed. Users can set the value of the environment variables in their downstream environments.
      - For standard environment variables like string, number, and JSON, enter the value in the text box to the right of the variable name.
      - For data source environment variables, use the dropdown lists to select the appropriate data source to use in the downstream environment.

   - **Canvas Apps**

      :::image type="content" source="media/aa4pp-deployment-settings-app-sharing.png" alt-text="Screenshot of App Sharing configuration in the ALM Accelerator.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

      - All the apps in your solution are listed. Users can share them in their downstream environments with a Microsoft Entra group.
      - Use the dropdown list to select the **Azure AAD group** with which you'd like to share the app.
      - To view the group details, select the details icon. A new browser tab opens with a link to the Microsoft Entra group in the Azure portal.
      - Use the permissions dropdown list to set the permissions to **Can View**, **Can Edit**, or **Can View and Share**.

   - **Group Teams**

      :::image type="content" source="media/aa4pp-deployment-settings-group-teams.png" alt-text="Screenshot of Group Teams configuration in the ALM Accelerator.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

      - Dataverse Teams of type **AAD Security Group** are listed. Users can configure new Group Teams for sharing flows and custom connectors.
      - To add a new Group Team configuration, select **'+'**. Enter a **Team Name**, select an **AAD Group** that the team should be linked to, and select **Security Roles** as required. The list of security roles is based on the roles available in the selected development environment. Add any custom security roles to the solution to make sure they're available in the target environment.

   - **Flows**

      :::image type="content" source="media/aa4pp-deployment-settings-flows.png" alt-text="Screenshot of Flow configuration in the ALM Accelerator.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

      - All the flows in your solution are listed. Users can configure the owner of the flow, Dataverse Team sharing, the user with which to activate the flow, whether a flow should be activated or not, and the sequence of flow activation in their downstream environments.
      - To view the flow, select its name. The flow definition opens in a new browser tab.
      - Use the **Owner** list to select a Dataverse user to own the flow in the downstream environment.
      - Use the **Team Sharing** list to select the Dataverse Team to share the flow to. The list includes Dataverse Teams in the downstream environment and Dataverse Teams that are configured in the Group Teams settings.
      - Use the **Activation User** list to select the user to activate the flow.
      - In the **Flows to Activate and Order** column, select the checkbox to indicate whether a flow should be activated or not. Use the up and down arrows to place the rows in the order in which they should be activated. The sequencing of activation is particularly useful if the solution includes parent and child flows, where child flows must be activated before parent flows.

   - **Custom Connectors**

      :::image type="content" source="media/aa4pp-deployment-settings-custom-connectors.png" alt-text="Screenshot of Custom Connectors configuration in the ALM Accelerator.":::<!-- EDITOR'S NOTE: Please crop the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

      - All the custom connectors in the solution are listed. Users can configure sharing of custom connectors to Dataverse Teams in their downstream environments.
      - Use the **Sharing** list to select the Dataverse Team to share the custom connector to. The list includes Dataverse Teams in the downstream environment and Dataverse Teams that are configured in the Group Teams settings.

1. Publish any changes to your app.

1. Select **Commit Solution** to push your changes to Git.

   Be sure to publish any app changes before you start a commit.

1. Depending on your permissions, you may be able to select **Show Advanced** and then select a branch or create one with a specific naming convention. If you don't have those permissions, the app creates a branch based on your username and deployment profile data.

1. Enter a commit comment. Use the hashtag notation (for example, **#123**) to link the changes to a specific work item in Azure DevOps.

1. Select **Prepare Solution**.

1. Confirm your solution configuration, and then select **Commit Solution**.

A waiting indicator appears when the push begins. When the push succeeds, a checkbox appears. A red **X** indicates the push failed. To see the progress of your push, select the progress indicator, which takes you to the running pipeline in Azure DevOps.

> [!NOTE]
> Using the progress icons to visualize what's happening in the pipelines in Azure DevOps can be disabled for makers.

### Deploy the solution

1. When you're ready to deploy your changes across other environments, select **Deploy Solution**.

1. Depending on your permissions, you may be able to select **Advanced Settings**, specify the **Source** and **Target** branch, and enter a **Title** and **Comment** for your pull request. If you don't have those permissions, select an environment to deploy to.

1. Select **Deploy Solution**.

1. The next steps depend on the approval type of the deployment step.

     - **Pull Request:** A pull request is created for your changes. The remaining steps to merge and release to the test environment occur in Azure DevOps. Depending on the branch policies and triggers configured for your target branch, an Azure DevOps user can approve or reject your pull request based on their findings in the submitted changes. The status of the pull request appears in the app.

     - **Environment:** The pipeline to deploy the solution to the target environment is triggered. The remaining approval steps occur in Azure DevOps.

1. To initiate a solution upgrade in the target environment, add the **solution-upgrade** tag to a pull request.

   The deployment of your solution to the selected environment starts with the approval of the pull request or the pipeline execution, depending on the approval type. When the progress indicator appears, it means the deployment has started. Select the right angle bracket (**>**) to visualize the request history.

   :::image type="content" source="media/aa4pp-request-history.png" alt-text="Screenshot of the request history of a solution in the ALM Accelerator.":::

1. For deployment to production, either open the **Advanced Settings** and select the main branch used to trigger the deployment, or create a pull request directly in Azure DevOps.

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
