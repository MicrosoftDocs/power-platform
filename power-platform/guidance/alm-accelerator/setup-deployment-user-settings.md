---
title: Configure deployment user settings
description: Learn how to use deployment user settings to create a tailored experience for your makers in the ALM Accelerator for Power Platform app.
ms.topic: how-to
ms.date: 04/07/2023
ms.subservice: guidance-toolkit
author: jenschristianschroder
ms.author: jeschro
ms.reviewer: sericks
ms.custom: bap-template
---

# Configure deployment user settings

You can customize the user experience in the ALM Accelerator for Power Platform by using deployment user settings to turn on or off some of the features in the UI. To help all makers use the app effectively, you can create separate experiences for users who are unfamiliar with application lifecycle management (ALM) and for those who are more experienced. User settings are linked to [deployment profiles](./setup-deployment-user-profiles.md).

This section covers how to use the ALM Accelerator administration app to configure user settings. You don't need to do this manually, however. If a user doesn't have an experience assigned, the ALM Accelerator app automatically creates one when the user signs in. The default user setting enables all the app's functionality, including import, delete, and all advanced features.

## Create user settings with the administration app

1. Open the ALM Accelerator administration app, and then select **Deployment User Settings**.

    :::image type="content" source="media/setup-almacceleratorpowerplatform-deployment-profiles/image-20211126094411050.png" alt-text="Screenshot of the ALM Accelerator administration app.":::<!-- EDITOR'S NOTE: Please crop, highlight, and rename the screenshot IAW our [screenshot guidelines](/bacx/screenshots-for-bap?branch=main) -->

1. Select **New**.

1. Enter a name for the user setting. The name is only displayed to users who have more than one user setting assigned to them.

1. Select the following **User Functions** to allow or disallow in the ALM Accelerator canvas app:

    - **Import Solutions**: Allow this function to show the **Import Solution** command in the app.
    - **Delete Solutions**: Allow this function to show the **Delete Solution** command in the app.
    - **Manage Solutions**: Allow this function to show the **Manage Solutions** command in the app.
    - **Drillthrough Status**: Allow this function to enable users to drill into promote and deploy pipeline runs in the app.
    - **Profile Creation**: Allow this function to enable users to create deployment profiles in the app.
    - **Profile Updates**: Allow this function to enable users to update deployment profiles in the app.
    - **Advanced Deploy**: Allow this function to enable users to specify a source and target branch for a pull request using the advanced deploy functionality.
    - **Advanced Promote**: Allow this function to enable users to specify a source and target branch, or create a branch, using the advanced promote functionality.
    - **Bypass Prepare**: Allow this function to enable users to skip the preparation step during the promotion of a solution, bypassing the need to configure deployment settings before committing to source control.
    - **Bypass Prepare Default**: Sets the **Bypass Prepare** toggle to True or False in the ALM Accelerator app depending on whether or not **Bypass Prepare** is allowed.
    - **Deployment Configuration**: Allow this function to enable users to skip the preparation step during the promotion of a solution, and bypass the need to configure deployment settings before they commit to source control.
    - **Show All Solutions**: Allow this function to enable users to see all solutions in the selected environment.
    - **Bypass Approval**: Allow this function to enable users to skip the approval of their pull requests during the deployment of a solution to test environments.
    - **Bypass Approval Default**: Sets the **Bypass Approval** toggle to True or False in the ALM Accelerator app depending on whether or not **Bypass Approval** is allowed.
    - **Commit Portals**: Allow this function to enable users to include the Power Apps portal and Power Pages website when the solution is committed to source control.
    - **Commit Portals Default**: Sets the **Include Power Apps Portal/Power Pages** toggle to True or False in the ALM Accelerator app depending on whether or not **Commit Portals** is allowed.
    - **Publish Customizations**: Allow this function to enable users to publish customizations when the solution is committed to source control or skip publishing to save time.
    - **Publish Customizations Default**: Sets the **Publish Customizations** toggle to True or False in the ALM Accelerator app depending on whether or not **Publish Customizations** is allowed.
    - **Allow Import Managed**: Allow this function to enable users to import managed and unmanaged solutions into their maker environments.
    - **Import Managed Default**: Sets the **Allow Import Managed** toggle to True or False in the ALM Accelerator app depending on whether or not **Allow Import Managed** is allowed.

1. Configure **User Labels**. These values also appear in the **Deployment History** view under the action that was executed.

    - **Deploy Solution**: Enter a label or set the value to blank to use the default label, **DEPLOY SOLUTION**.
    - **Commit Solution**: Enter a label or set the value to blank to use the default label, **COMMIT SOLUTION**.
    - **Import Solution**: Enter a label or set the value to blank to use the default label, **IMPORT SOLUTION**.
    - **Delete Solution**: Enter a label or set the value to blank to use the default label, **DELETE SOLUTION**.

1. Select **Save**.

## Share user settings with the ALM Accelerator administration app

To share user settings created for a particular user profile, we recommend that you share the user setting row with a Microsoft Entra group team. Sharing with a Microsoft Entra group team allows you to manage access to user settings and deployment profiles by adding the user to the group in Microsoft Entra ID.

### Create a Microsoft Entra group team

If you already have a Microsoft Entra group team in Microsoft Dataverse to share user settings, skip this section.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.com), and then select the environment in which you installed the ALM Accelerator app.

1. Under **Access -Teams**, select **See all**, and then select **Create Team**.

1. Enter the required fields, and then select **Microsoft Entra Group Team** as the **Team Type**.

1. Select the **Microsoft Entra Group** to use for this team, and then select **Next**.

1. Select **ALM Power App Access** and **Basic User** as the roles for the team.

1. Select **Save**.

### Share user settings with a Microsoft Entra group team

1. Open the ALM Accelerator administration app and go to **Deployment User Settings**.

1. Open the user setting that you want to share with your team, and then select **Share**.

1. Use **Advanced lookup** to search for and select your Microsoft Entra group team in your organization's Microsoft Entra security group teams.

1. Select **Done**.

1. Under **Manage Share Access**, select the team, and then select **Read** and **Append** as the privileges.

1. Select **Share**.

> [!div class="nextstepaction"]
> [Configure deployment profiles](./setup-deployment-user-profiles.md)

## Read next

- [Advanced maker experience](./advanced-maker-experience.md)
- [New maker experience](./new-maker-experience.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]