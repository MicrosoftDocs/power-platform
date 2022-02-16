---
title: "Configuring the ALM Accelerator for Power Platform App | MicrosoftDocs"
description: "Deployment User Settings and Profiles direct the ALM Accelerator for Power Platform on how to display UI Components and how to source control and deploy solutions."
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
# Configuring the ALM Accelerator for Power Platform app (preview)

>[!NOTE]
>The ALM Accelerator for Power Platform (AA4PP) is currently in public preview. Go to [Issues currently tagged as vnext](https://github.com/microsoft/coe-starter-kit/issues?q=is%3Aopen+is%3Aissue+label%3Aalm-accelerator+label%3Avnext) for the roadmap to be completed prior to general availability. While the tool is in public preview, there will be breaking changes and frequent updates to address feedback from preview members. Additionally, the public preview is reliant on the experimental [Power Apps Source File Pack and Unpack Utility](https://github.com/microsoft/PowerApps-Language-Tooling) that is being developed separately from AA4PP.

The ALM Accelerator is configurable based on user preferences to turn on and off certain features in the user interface depending on a user's role. A common scenario is to create an advanced maker and a maker experience to help both users familiar and unfamiliar with application lifecycle management to use the app effectively. Linked to the user settings are deployment profiles. Deployment profiles are used by the app to make decisions for the user on where and how to create branches and approvals for deployment.

In this section, we'll describe how to use the ALM Accelerator for Power Platform Administration app to configure these settings for use by the ALM Accelerator.

## Creating user settings and profiles using AA4PP administration app

To create user settings for AA4PP, follow these steps:

1. Open the **Power Platform ALM Accelerator Administration App**, and then select **Deployment User Settings**.

   ![ALM Accelerator for Power Platform Administration App](media/setup-almacceleratorpowerplatform-deployment-profiles/image-20211126094411050.png)

1. Select **New** and **Provide a Name** of the user setting. This name will only be displayed to users with access to more than one user setting option.

1. Select **User Functions to Allow or Disallow**. Below are the specific areas that are configurable in the app.
    - **Import Solutions** - Allowing this function shows the **Import Solution** command in the app.
    - **Delete Solutions** - This function shows the **Delete Solution** command in the app.
    - **Manage Solutions** - This function shows the **Manage Solutions** command in the app.
    - **Drillthrough Status** - This function allows users to drill into the DevOps pipeline runs for the promote and deploy functionality.
    - **Profile Creation** - This function provides users with the ability to create new deployment profiles in the app.
    - **Advanced Promote** - This function provides users with the ability to change between using the advanced promote functionality. This lets you specify a source and target branch or create a new branch.
    - **Advanced Deploy** - This function provides users with the ability to toggle between using the advanced deploy functionality. This lets you specify a source and target branch for a pull request.
    - **Bypass Prepare** - This function provides the user with the ability to skip the preparation step during promotion of a solution. This lets you bypass configuring deployment settings before committing to source control.

1. Update **User Labels**. Below are the specific areas that are configurable in the app related to user labels for functions. These values also show in the **Deployment History** view under the action that was executed.

    - **Deploy Solution** - Updating this label changes the text of the button for the **deployment action** in the app. The default value is **"DEPLOY SOLUTION"**.
    - **Commit Solution** - Updating this label changes the text of the button for the **promote action** in the app. The default value is **"COMMIT SOLUTION"**.
    - **Import Solution** - Updating this label changes the text of the button for the **import solution action** in the app. The default value is **"IMPORT SOLUTION"**.
    - **Delete Solution** - Updating this label changes the text of the button for the **delete solution action** in the app. The default value is **"DELETE SOLUTION"**.

1. Select **Save** to save your user settings.

1. Add **New Deployment Profiles** to your user settings. Deployment profiles are used by the AA4PP app to determine where and how to create branches during the commit stage and how to create pull requests when deploying. Below are the steps to create a deployment profile using the AA4PP Administration app to associate with one or many deployment user settings.

    > [!NOTE]
    > In addition to creating deployment profiles using the AA4PP Administration app, users who have access to user settings with **Create Profile** privileges in the AA4PP app can create profiles in the app. The AA4PP app makes some assumptions about the set-up of your pipelines based on the documentation for setting up your pipelines and doesn't provide the flexibility that the AA4PP Administration app does. It does, however, allow you to jump start this process.

## Creating ALM Accelerator profiles using the AA4PP app

If a user logs in to the AA4PP app and doesn't have a deployment user setting assigned to them, the app automatically creates a deployment user setting for them. This user setting is created with all of the functionality enabled, such as import, delete, and all advanced features.

   1. Open the ALM Accelerator for Power Platform app.

      - If the user has more than one deployment user setting shared with them, the app displays a drop-down list for the user to choose their experience.

      - If a user only has one deployment user setting shared with them, the drop-down list to choose their experience isn't displayed. Instead, their default user setting is used by the app.
      - If no user setting is shared with them, the app creates a new user deployment setting for the user and uses the default interface for the app.

   2. Create a new profile for your solution. In order to begin source controlling and deploying a solution, you must have a profile associated with that solution.
      > [!NOTE]
      > Users who have a user setting shared with them can only perform functions on solutions to which they have been assigned a profile already. If a user has a user setting shared with them that doesn't have a profile that is already assigned to a solution, they won't be able to perform actions on that profile.

      - Select **Choose a Profile** for a solution that doesn't have a profile assigned.
      - Choose an existing profile from the drop-down list or select **+** to create a new profile.
      - Enter a name for the profile, and select the **Organization**, **Project**, **Repo**, and **Target Branch**.
      - Select **Create**. Creating a new profile automatically populates the deployment environments with the default configuration for validation, test, and production. These environments' URLs will contain a placeholder for your environments actual URL.
      - Enter the URLs for your validation, test, and production environments.
      - Select **Save** to save your changes to the profile and save the profile as the default for the solution.
      - After the profile is saved, you'll be able to commit and deploy your solution. More information: ![AA4PP app with solution actions enabled after creating a new profile](media/setup-almacceleratorpowerplatform-deployment-profiles/image-20211126135223693.png)

## Sharing ALM Accelerator user settings and profiles using AA4PP administration app

In order to share user settings created for a particular user profile it is recommended that you share the user setting row with an Azure AD Group team. Sharing with an Azure AD Group team allows you to manage access to user settings and deployment profiles from Azure AD by adding the user to the group in Azure AD. Below are steps describing how to share and provide the appropriate roles to an Azure AD Group team after installing the AA4PP Solution.

1. If you haven't already created an Azure AD Group team in Microsoft Dataverse to share your user settings, follow the steps below otherwise skip to step 2.

   - Go to [https://admin.powerplatform.com](https://admin.powerplatform.com) and select the environment in which you've installed AA4PP.

   - Select **See all** under **Access - Teams**, and then select **Create Team**.

   - Enter the required fields and select **AAD Group Team** as the **Team Type**.

   - Select the **AAD Group** to use for this team, and then select **Next**.

   - Select **ALM Power App Access** and **Basic User** as the roles for the team, and then select **Save**.

1. Open the Power **Platform ALM Accelerator Administration App** and navigate to **Deployment User Settings**.

1. Open the **Deployment User Setting** that you want to share with your team, and then select **Share**.

1. Open your Azure AD Group team using **Advanced lookup** in the **Sharing** dialog.

   - In **Advanced lookup**, select **Teams**.

   - Select **All AAD Security Group Teams** from the **View** dropdown list.

   - Select the team you created previously, and then select **Done**.

1. Under **Manage Share Access** select the team, and then select **Read** and **Append** as the privileges.

1. Select **Share**.
