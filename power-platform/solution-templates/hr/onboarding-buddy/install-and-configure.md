---
title: Install and configure the Onboarding Buddy template for Power Platform
description: Learn how to install and configure the Onboarding Buddy template for Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: install-set-up-deploy
ms.date: 09/27/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and configure the Onboarding Buddy template

As a Power Platform admin, you'll access, import, install, configure, and deploy the Onboarding Buddy template for your organization.

> [!IMPORTANT]
> Two solutions will always be installed in your environment:
>
> - **Employee Experience Base**. Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
> - **Onboarding Buddy**. Contains all the components needed to enable the implementation of an Onboarding Buddy program within an organization.

To get started, follow the steps to install and configure the Onboarding Buddy template.

## Step 1: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires you to set up four new connections for the Onboarding Buddy app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

- [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
- [Office 365 Outlook connector](/connectors/office365/)
- [Office 365 Users connector](/connectors/office365users/)
- [Office 365 Groups connector](/connectors/office365groups/)

To create the connections in advance, go to **Connections**, and select **+ New Connection** on the left panel. Search for each connection listed in this section and create a connection.

## Step 2: Install from AppSource

Access the template on AppSource and install the template's solutions into a Power Platform developer (sandbox) environment that has all the connectors set up.

- Go to the Onboarding Buddy template in AppSource and select **Get it now**.
- Select the environment that you want to install the template into.
- Agree to the Terms and Privacy Statements by checking the boxes.
- Select **Install**. You'll be taken to a screen where you can view the installation status. Once the installation is complete, the status updates to *Installed*.

> [!TIP]
> You can log your questions and get support for the Onboarding Buddy template at the [**Templates-for-Power-Platform**](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site.

## Step 3: Assign security roles to the users

The Onboarding Buddy solution contains two security roles:

- **Administrator**. Assign this role to users who need access to the model-driven app administrative app and will have access to manage all reference data and see all records.
- **User**. Assign this role to all users of the Onboarding Buddy application.

Roles can be assigned from the admin portal.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Environments** on the left panel and select the environment where the solution is installed.  
1. Select **Users** > **See all**.
1. Select the user(s).
1. Select **Manage security roles** and select the appropriate roles for each user.
1. Select **Save**.
:::image type="content" source="media/install/ob-install-assign-roles.png" alt-text="Screen of Power Platform admin center showing where to select environments and users.":::

> [!NOTE]
> All licensed users, whether or not they are members of the security groups, must be assigned security roles to access data in the environments. You assign the security roles in the web application. If users don't have a security role, they'll get a *data access denied* error when trying to run an app. Users can't access environments until they're assigned at least one security role for that environment.

More information:

- [Manage application users in the Power Platform admin center](/power-platform/admin/manage-application-users)
- [Control user access to environments: security groups and licenses](/power-platform/admin/control-user-access)

## Step 4: Set cloud flows to *on*

Open the newly installed Awards and Recognition solution and verify that the cloud flow is set to the *on* status. If not, turn it on.

1. Select the cloud flow that is turned off.
1. Select **Turn on** located in the toolbar.

## Step 5: Share the apps

Share the Onboarding Buddy Admin app and Onboarding Buddy app with the appropriate people in your organization.

1. Go to [Power Apps](https://make.powerapps.com/).
1. Select **Apps** on the left panel.
1. Select the **three dots** to the right of the app you want to share.
1. Select **Share**.
1. Search for and select the appropriate security group (or individuals) that contains the members who need access to the app.
1. Select **Share**. You can also choose whether or not to include an email invitation (not required).

More information: [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

## Step 6: Configure program parameters

There are some program parameters that must be set for the application to work correctly.

Open the Onboarding Buddy Admin App and select **Configurations** to set the parameters for the program.

1. Select **New** in the top menu bar if you don't have any records yet. If there is already an existing record, select it and then select **Edit** in the top menu bar. There should only ever be one record in this table.
:::image type="content" source="media/install/ob-install-active-config-record.png" alt-text="Power Apps screen showing active configuration record.":::
1. There are three program-level settings you can tweak. Set them up with the values you desire.

    - **Days after match to send the first nudge email**. This controls when the first emails go out to the buddy and the onboarder that introduces them to the program and encourages them to engage with each other.
    - **Days prior to end of match to send the last nudge email**. This controls when the final emails go out to the buddy and the onboarder. You can use this to encourage them to wrap up any final activities.
    - **Length of Buddy Match Period (days)**. This controls how long the match lasts.
    :::image type="content" source="media/install/ob-install-config-match-duration.png" alt-text="Power Apps screen showing new configuration record detailing how long a match lasts.":::
1. Select **Save**.

## Step 7: Populate the Onboarders table

For a person to show up in the app as an Onbaorder who can be matched, you must first be enter them into the Onbaorders table.

The New Onboarders Sync flow is set to run every Saturday. It will automatically import users into the Onboarding table from AAD that have been created in the last week. Initially, though, you may have to populate existing employees that you want to be a part of the program right away.

### Manually run the flow

You can run the New Onboarders Sync flow manually to populate all new employees who join your organization in the last week. Take these steps:

1. Select **Flows** from the left panel in Power Apps.
1. Hover over the **New Onboarders Sync** flow and select **Play** (Run).
:::image type="content" source="media/install/ob-install-onboarders-sync.png" alt-text="Power Apps screen showing Cloud flows.":::

### Manually create onboarder records

If you have existing employees that you wish to add to the Onboarders table that have been in AAD for more than a week, you can manually add them.

1. Select **Onboarders** in the Onboarding Buddy Admin app.
1. Select **+New** from the top menu.
1. Populate the fields. The most critical fields to populate are:
    1. Onboarder
    1. Name
    1. Email
    1. Job Title
    1. Organization
    1. Region
1. Optionally populate the other fields.
1. Select **Save & Close** from the top menu.
1. Repeat the steps for as many Onboarders as you need to create.

## Step 8: Turn on Auditing

While this is not required, we recommend enabling the audit setting on the system, so it's easy to see who created/updated records in the future.

To do this:

1. Go to [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home)
1. Select **Environments** on the left panel and select the environment where the solution is installed.
1. Select **Settings**.
:::image type="content" source="media/install/ob-install-audit.png" alt-text="Power Platform admin center screen showing audit logs.":::
1. Select **Start Auditing**.
:::image type="content" source="media/install/ob-install-start-audit.png" alt-text="Power Platform admin center screen showing start audit checkbox.":::
