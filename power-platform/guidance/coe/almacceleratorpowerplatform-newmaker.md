---
title: "ALM Accelerator for Power Platform new maker experience | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform new maker experience will help you follow ALM patterns and practices. It enables you to source control your solutions and move them from your development environment to test and production environments using DevOps"
author: alvarezskinner
manager: devkeydet

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
# ALM Accelerator for Power Platform new maker experience (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

> [!NOTE]
> ALM Accelerator for Power Platform (AA4PP) is currently in public preview. Go to [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the roadmap to be completed prior to general availability. While the tool is in public preview, there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the public preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

## Demo: ALM Accelerator new maker experience

Watch how to use the ALM Accelerator for Power Platform solution.
[Demo Videos](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md)

## Walk-through: ALM Accelerator new maker experience

> [!IMPORTANT]
> The following user experience has been configured using the ALM Accelerator for Power Platform Administration app that is installed with the ALM accelerator solution. For more information on how to use the administration app and configure and share experiences, see [Creating user settings and profiles](setup-almacceleratorpowerplatform-deployment-profiles.md)

1. Once you have installed and configured the app, launch it from your environment under **Apps** by selecting **ALM Accelerator for Power Platform**.

1. When prompted to create connections and grant consent, create the necessary connections or accept the consent dialog.

1. If prompted to create an HTTP with Azure AD connection, enter 'https://graph.microsoft.com' for both the **Base Resource URL** and **Azure AD Resource URI**.

1. Select **Create** for each connection when prompted.

1. The first time you open the app a dialog opens and you are asked to select an **Environment**. Next time you open the app, it remembers which environment you were working on.

1. Once the environment is selected, the main screen displays a list of all the **unmanaged solutions** in the environment. You can refresh the list by selecting **Refresh** if you don't see new solutions you've created:

    - **Save Solution**: Saves the current state of the solution into version control so all changes done to the solution can be tracked. Additionally, the save will create your deployment pipelines in Azure DevOps as part of the save process.
    - **Publish Solution**: Allows you to request to move the solution across environments.
    - **Choose a Profile**: Allows you to select a **Solution profile** to associate a solution to a **Repository** in a given **Organization** and **Project**. If you're unsure what profile to select, ask your administrator to provide the name of the solution profile for your solution.
    - **Request History**: (right chevron icon): Provides a list of requests (saves and deployments) done for that solution.

1. Next step is to choose a **Solution Profile** for the solution so you can associate it to a specific repository in a given organization and project in DevOps. This selection will determine which environments you can deploy the solution into:

   - Select **Choose a Profile** for your solution in the solution list.
   - In the **Solution Profile** dialog select a **Profile**, and then select **Save**.

    > [!NOTE]
    > If you don't find a solution profile that suits your needs, contact an administrator to get it created.

1. Configure the deployment setting by selecting the **Configure Deployment Settings** link under the name of the solution. On the configuration deployment page, you'll see the following items:

   - **Deployment Environment List** (for example, validation, test, and production)

     - These environments are the ones specified in the **Solution Profile**. They correspond with the environments in which your solution will be available after you publish.

   - **Connection References**

      :::image type="content" source="media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-connection-references.png" alt-text="Connection Reference configuration":::

      - This screen lists all of the connection references in your solution and allows users to create connections in their downstream environments to hook up the connection references in the target environment.
      - If you have permissions to create connections in the target environment, the **+** button is displayed.
         - To create a new connection, select **+**.
         - After creating a new connection, select **Refresh** on the top right to get the latest list of connections.
         - To select an existing connection in the target environment, select a connection from the dropdown list.
         - To open the connection in the target environment, select the name or the status of the connection.
      - If you don't have permission to create connections in the target environment, the + button will be disabled and you'll have to request a connection be created by another user.
         - To request a connection, select **Request a Connection**.
         - Enter the name of the team member you need to create the connection, and select the user.
         - To open the preformatted email, select **Send**.
         - The preformatted email includes a link for the recipient to create the required connection.

   - **Environment Variables**

      :::image type="content" source="media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-environment-vars.png" alt-text="Environment Variables configuration":::

      - This screen lists all of the environment variables in your solution and allows users to set the value of the environment variables in the downstream environment.
      - For standard environment variables, such as string, number, or JSON, enter the value in the text box to the right of the environment variable name.
      - For data source environment variables, select the appropriate data source from the dropdown lists to use in the downstream environment.

   - **App Sharing**

      :::image type="content" source="media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-app-sharing.png" alt-text="App Sharing configuration":::

      - This screen lists all of the apps in your solution and allows users to share the apps in the downstream environment with an Azure AD Group.
      - Use  the dropdown list to select the Azure AD group with which you'd like to share the app.
      - To view the group details select **Details**. This button opens a new browser tab with a link to the Azure AD group in the Azure portal.
      - To set the permissions, select the permissions dropdown list and set the permissions to either **Can View**, **Can Edit**, or **Can View and Share**.

   - **Component Ownership**

       :::image type="content" source="media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-comp-ownership.png" alt-text="Component Ownership configuration":::

      - This screen lists all of the flows in your solution. Users can configure the owner of the flow in the downstream environment by selecting a Dataverse user.
      - Use  the dropdown list to select a Dataverse user to own the flow in the downstream environment.
      - To view the flow, select the name of the flow to open a new tab with the flow definition.

1. After you select the **Solution Profile** and configure the **Deployment Settings**, push your changes to Git by selecting **Save Solution**. In the background, the app pushes your change to version control automatically creating a branch. Repeat the pushes as you make changes to your solution so your change history is kept.

    Be sure to publish any app changes before initiating the saving of the solution. During this step you'll be asked to configure the deployment settings, which will ask for the same information as detailed in the previous step.

    > [!NOTE]
    > When the publishing begins, a waiting indicator appears. When the push is successful, a checkbox appears, otherwise a red x appears.

1. Use **Deploy Solution** to publish your solution to other environments. Provide a **Title** and **Notes**. This information is added to the pull request created in DevOps. Select the **Environment** you want to deploy the solution into.

1. Depending on the **Solution Profile** configuration, the application either creates a pull request that needs to be completed in DevOps, or trigger a pipeline that someone must approve for it to run and complete the publishing. You'll see the progress indicator state the deployment has started. You can also use the right chevron icon to visualize the request history.

      ![Request History for a solution](media/almacceleratorpowerplatform-components/aa4pp-request-history.png "Request History for a solution")

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
