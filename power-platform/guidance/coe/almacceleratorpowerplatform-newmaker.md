---
title: "ALM Accelerator for Power Platform New Maker Experience | MicrosoftDocs"
description: "The ALM Accelerator for Power Platform New Maker Experience will help you follow ALM patterns and practices. It enables you to source control your solutions and move them from your development environment to test and production environments using DevOps"
author: alvarezskinner
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
# ALM Accelerator for Power Platform New Maker Experience (Preview)

> [!NOTE]
> ALM Accelerator for Power Platform is currently in public preview. Please see Issues currently tagged as [vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the Roadmap to be completed prior to general availability. While in Public Preview it can be expected that there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the Public Preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

## Demo: ALM Accelerator New Maker Experience

Watch how to use the ALM Accelerator for Power Platform solution
[Demo Videos](https://github.com/microsoft/coe-starter-kit/CenterofExcellenceALMAccelerator/WALKTHROUGHS.md)

## Walkthrough: ALM Accelerator New Maker Experience

1. Once you have installed and configured the app, launch it from your Environment under Apps by select **ALM Accelerator for Power Platform**.

1. When prompted to create connections / grant consent create the necessary connections or accept the consent dialog.

1. If prompted to create a HTTP with Azure AD connection, enter 'https://graph.microsoft.com' for both the **Base Resource URL** and **Azure AD Resource URI**.

1. Select **Create** for each connection when prompted.

1. The first time you open the app a dialog will open and you'll be asked to **select an environment**. Next time you open the app, it will remember which environment you were working on.

1. Once the environment is selected, the main screen will display a list of all the **unmanaged solutions** in the environment. You can refresh the list using the **refresh** button if you don't see new solutions you've created:

    - **Save Solution**: Saves the current state of the solution into version control so all changes done to the solution can be tracked
    - **Publish Solution**: Allows you to request to move the solution across environments
    - **Choose a Profile**: Allows you to select a **Solution profile** to associate a solution to a **Repository** in a given **Organization** and **Project**. If you're unsure what profile to select ask your administrator to provide the name of the solution profile for your solution.
    - **Request History**: (right chevron icon): Provides a list of requests (saves and deployments) done for that solution.

1. Next step will be to choose a **Solution Profile** for the solution so you can associate it to a specific to a **Repository** in a given **Organization** and **Project** in DevOps. This selection will determine which environments you can deploy the solution into:

   - Select **Choose a Profile** for your Solution in the Solution list.
   - In the Solution Profile Dialog select a **Profile** and Select **Save**.

    > [!NOTE]
    > If you don't find a Solution Profile that suits your needs, you will need to talk to an administrator to get it created.

1. Configure the deployment setting using the **Select the Configure Deployment Settings** link under the name of the Solution. On the configuration deployment page, you'll see the following items

   - Deployment Environment List (for example, Validation, Test, and Production)

     - These environments are the ones specified in the **Solution Profile**. They correspond with the environments in which your solution will be available after you publish.

   - Connection References

      ![Connection Reference Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-connection-references.png "Connection Reference Configuration")

      - This screen lists all of the connection references in your solution and allows users to create connections in their downstream environments to hook up the connection references in the target environment.
      - If you have permissions to create connections in the target environment you'll see the + button.
         - To create a new connection **select the + button**.
         - After creating a new connection, **select the refresh button** in the top right to get the latest list of connections.
         - To select an existing connection in the target environment **select a connection from the dropdown list**.
         - To Navigate to the connection in the target environment **select the name or the status of the connection**.
      - If you don't have permissions to create connections in the target environment the + button will be disabled and you will have to request a connection be created by another user.
         - To request a connection **select the Request a Connection button**.
         - Enter the name of the team member you need to create the connection and select the user.
         - To open the preformatted email  **select send**.
         - The preformatted email will include a link for the recipient to create the required connection.

   - Environment Variables

      ![Environment Variables Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-environment-vars.png "Environment Variables Configuration")

      - This screen lists all of the environment variables in your solution and allows users to set the value of the environment variables in the downstream environment.
      - For standard environment variables (for example String, Number, JSON) **enter the value in the text box** to the right of the environment variable name
      - For data source environment variables **use the dropdowns to select the appropriate data source** to use in the downstream environment.

   - App Sharing

      ![App Sharing Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-app-sharing.png "App Sharing Configuration")

      - This screen lists all of the apps in your solution and allows users to share the apps in the downstream environment with an Azure AAD Group.
      - Use  the dropdown to **select the Azure AAD group** with which you'd like to share the app.
      - To view the Group details **select the details icon**. This button will launch a new browser window with a link to the AAD Group in the Azure portal.
      - To set the permissions **select the permissions dropdown** and set the permissions to either Can View, Can Edit or Can View and Share.

   - Component Ownership

      ![Component Ownership Configuration](media/almacceleratorpowerplatform-components/aa4pp-deployment-settings-comp-ownership.png "Component Ownership Configuration")

      - This screen lists all of the Flows in your solution. Users can configure the owner of the Flow in the downstream environment by selecting a Dataverse user.
      - Use  the **dropdown to select a Dataverse user** to own the Flow in the downstream environment.
      - To view the Flow **select the name of the Flow** to open a new window with the Flow Definition.

1. After selecting the **Solution Profile** and configuring the **Deployment Settings**, you can push your changes to Git using the **Save Solution** button. In the background, the app will push your change to version control automatically creating a branch. Repeat the pushes as you make changes to your solution so your change history is kept.

    Be sure to publish any App changes before initiating the saving of the solution. During this step you will also be asked to configure the deployment settings which will ask for the same information as detailed in the previous step.

    > [!NOTE]
    > When the publishing begins, a waiting indicator will appear. If the push is successful, a checkbox will appear otherwise a red x will appear.
    
1. Use the **Deploy Solution** button to publish your solution to other environments. Provide a **Title** and **Notes** (this information is added to the Pull Request created in DevOps) and select the **Environment** you want to deploy the solution into.

1. Depending on the **Solution Profile** configuration, the application will either create a pull request that needs to be completed in DevOps, or trigger a pipeline that someone will need to approve for it to run and complete the publishing. You'll see the progress indicator state the deployment has started. You can also use the right chevron icon to visualize the request history.

      ![Request History for a solution](media/almacceleratorpowerplatform-components/aa4pp-request-history.png "Request History for a solution")

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
