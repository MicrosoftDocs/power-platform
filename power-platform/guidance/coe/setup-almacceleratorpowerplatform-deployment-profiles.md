---
title: "Configuring the ALM Accelerator for Power Platform deployment user settings and profiles | MicrosoftDocs"
description: "Deployment user settings and profiles direct the ALM Accelerator for Power Platform app on how to display UI components and how to source-control and deploy solutions."
author: mikefactorial
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: v-mikeochs
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Configuring deployment user settings and profiles for the ALM Accelerator for Power Platform app (preview)

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. Go to [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the roadmap to be completed prior to general availability. While the tool is in public preview, there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the public preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that's being developed separately from the ALM accelerator for Microsoft Power Platform.

Depending on a user's role, you can configure the application lifecycle management (ALM) accelerator by turning on and off certain features in the UI, based on user preference and experience. To help all users use the app effectively, a common scenario is to create both a maker experience (for users who are unfamiliar with ALM) and an advanced maker experience (for users who are very familiar with ALM concepts). Deployment profiles are linked to user settings. The app uses deployment profiles to make decisions for the user on where and how to create branches and approvals for deployment.

> [!NOTE]
> For more information on different experience see [Advanced Maker experience](/power-platform/guidance/coe/almacceleratorpowerplatform-advancedmaker) and  [Maker experience](/power-platform/guidance/coe/almacceleratorpowerplatform-newmaker).

In this section, we'll describe how to use the ALM Accelerator for Power Platform Administration app to configure these settings for use by the ALM accelerator.

## Creating user settings and profiles with the ALM Accelerator for Power Platform Administration app

To create user settings for the ALM accelerator for Microsoft Power Platform, follow these steps:

1. Open the **ALM Accelerator for Power Platform Administration**, and then select **Deployment User Settings**.

   ![The ALM Accelerator for Power Platform Administration app.](media/setup-almacceleratorpowerplatform-deployment-profiles/image-20211126094411050.png)

1. Select **New**, and then **Provide a Name** for the user setting. This name will only be displayed to users who have access to more than one user setting option.

1. Select **User Functions to Allow or Disallow**. The following areas are configurable in the app:

    - **Import Solutions** - Allowing this function shows the **Import Solution** command in the app.
    - **Delete Solutions** - This function shows the **Delete Solution** command in the app.
    - **Manage Solutions** - This function shows the **Manage Solutions** command in the app.
    - **Drillthrough Status** - This function allows users to drill into the Azure DevOps pipeline runs for the promote and deploy functionality.
    - **Profile Creation** - This function provides users with the ability to create new deployment profiles in the app.
    - **Profile Updates** - This function provides users with the ability to update deployment profiles settings in the app.
    - **Advanced Promote** - This function provides users with the ability to change between using the advanced promote functionality. They can specify a source and target branch, or create a new branch.
    - **Advanced Deploy** - This function provides users with the ability to switch between using the advanced deploy functionality. They can specify a source and target branch for a pull request.
    - **Bypass Prepare** - This function provides the user with the ability to skip the preparation step during the promotion of a solution. They can bypass needing to configure deployment settings before committing to source control.
    - **Show All Solutions** - This function provides users with the ability to see all solutions in the selected environment.

1. Update **User Labels**. The following areas are configurable in the app related to user labels for functions. These values also appear in the **Deployment History** view under the action that was executed:

    - **Deploy Solution** - Updating this label changes the text of the button for the deployment action in the app. The default value is **"DEPLOY SOLUTION"**.
    - **Commit Solution** - Updating this label changes the text of the button for the promote action in the app. The default value is **"COMMIT SOLUTION"**.
    - **Import Solution** - Updating this label changes the text of the button for the import solution action in the app. The default value is **"IMPORT SOLUTION"**.
    - **Delete Solution** - Updating this label changes the text of the button for the delete solution action in the app. The default value is **"DELETE SOLUTION"**.

1. Select **Save** to save your user settings.

Next, you'll add new deployment profiles to your user settings. Deployment profiles are used by the ALM Accelerator for Power Platform app to determine where and how to create branches during the commit stage, and how to create pull requests when deploying. The following section describes the steps to create a deployment profile with the ALM Accelerator for Power Platform Administration app to associate with one or many deployment user settings.

   > [!NOTE]
   > In addition to your creating deployment profiles by using the ALM Accelerator for Power Platform Administration app, users who have **Create Profile** privileges in the ALM Accelerator for Power Platform app can create deployment profiles in the app. The ALM Accelerator for Power Platform app makes some assumptions about the setup of your pipelines based on the documentation for setting up your pipelines, and doesn't provide the flexibility that the ALM Accelerator for Power Platform Administration app does. It does, however, allow you to jump-start this process.

## Creating ALM accelerator profiles by using the ALM Accelerator for Power Platform app

If a user signs in to the ALM Accelerator for Power Platform app and doesn't have a deployment user setting assigned to them, the app automatically creates a deployment user setting for that user. This user setting is created with all functionality enabled, including import, delete, and all advanced features.

1. Open the ALM Accelerator for Power Platform app.

   - If the user has more than one deployment user setting shared with them, the app displays a dropdown list for the user to choose their experience.

   - If a user only has one deployment user setting shared with them, the dropdown list to choose their experience isn't displayed. Instead, their default user setting is used by the app.

   - If no user setting is shared with the user, the app creates a new user deployment setting for the user and uses the default interface for the app.

2. Create a new profile for your solution. To begin source-controlling and deploying a solution, you must have a profile associated with that solution.

   > [!NOTE]
   > Users who have a user setting shared with them can only perform functions on solutions to which they've been assigned a profile already. If a user has a user setting shared with them that doesn't have a profile that's already assigned to a solution, they won't be able to perform actions on that solution.<!--note from editor: Edit okay? I'm confused by the switch between "perform functions on solutions" and "perform actions on that profile."-->

   1. For a solution that doesn't have a profile assigned, select **Choose a Profile**.

   1. Choose an existing profile from the dropdown list, or select **+** to create a new profile.

   1. Enter a name for the profile, and select the **Organization**, **Project**, **Repo**, and **Target Branch**.

   1. Select **Create**. Creating a new profile automatically populates the deployment environments with the default configuration for validation, test, and production. These environments' URLs will contain a placeholder for your environment's actual URL.

   1. Enter the URLs for your validation, test, and production environments.

   1. Select **Save** to save your changes to the profile and save the profile as the default for the solution.

After the profile is saved, you'll be able to commit and deploy your solution.<!--note from editor: Is it okay that this screenshot shows a different name for the app rather than "ALM Accelerator for Power Platform"?-->

![Solution actions in the ALM Accelerator for Power Platform app are enabled after creating a new profile.](media/setup-almacceleratorpowerplatform-deployment-profiles/image-20211126135223693.png)

## Sharing ALM accelerator user settings and profiles by using the ALM Accelerator for Power Platform Administration app

To share user settings created for a particular user profile, we recommend that you share the user setting row with an Azure Active Directory (Azure AD) Group team. Sharing with an Azure AD Group team allows you to manage access to user settings and deployment profiles from Azure AD by adding the user to the group in Azure AD. The following steps describe how to share and provide the appropriate roles to an Azure AD Group team after installing the ALM Accelerator for Power Platform app.

1. If you haven't already created an Azure AD Group team in Microsoft Dataverse to share your user settings, perform the following steps; otherwise, skip to step 2.

   1. Go to [https://admin.powerplatform.com](https://admin.powerplatform.com) and select the environment in which you've installed the ALM Accelerator for Power Platform app.

   1. Under **Access -Teams**, select **See all**, and then select **Create Team**.

   1. Enter the required fields, and select **AAD Group Team** as the **Team Type**.

   1. Select the **AAD Group** to use for this team, and then select **Next**.

   1. Select **ALM Power App Access** and **Basic User** as the roles for the team, and then select **Save**.

1. Open the ALM Accelerator for Power Platform Administration app, and go to **Deployment User Settings**.

1. Open the **Deployment User Setting** that you want to share with your team, and then select **Share**.

1. Open your Azure AD Group team by using **Advanced lookup** in the **Sharing** dialog.

   1. In **Advanced lookup**, select **Teams**.

   1. From the **View** dropdown list, select **All AAD Security Group Teams**.

   1. Select the team you created previously, and then select **Done**.

1. Under **Manage Share Access**, select the team, and then select **Read** and **Append** as the privileges.

1. Select **Share**.
