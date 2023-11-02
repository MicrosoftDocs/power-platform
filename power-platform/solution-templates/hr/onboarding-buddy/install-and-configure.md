---
title: Install and configure the Onboarding Buddy template for Power Platform
description: Learn how to install and configure the Onboarding Buddy template for Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 09/29/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and configure the Onboarding Buddy template

As a Power Platform admin, you install, configure, and deploy the Onboarding Buddy template's solutions for your organization. To get started, follow the steps.

To get started, follow the steps to install and configure the Onboarding Buddy template.

## Step 1: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires you to set up four new connections for the Onboarding Buddy app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

- [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
- [Office 365 Outlook connector](/connectors/office365/)
- [Office 365 Users connector](/connectors/office365users/)
- [Office 365 Groups connector](/connectors/office365groups/)

To create the connections in advance, go to **Connections**, and select **+ New Connection** on the left-side menu. Search for each connection listed in this section and create a connection.

## Step 2: Install from AppSource

Access the template on AppSource and install the template's solutions into a Power Platform developer (sandbox) environment that has all the connectors set up.

- Go to the Onboarding Buddy template in AppSource and select **Get it now**.
- Select the environment that you want to install the template into.
- Agree to the Terms and Privacy Statements by checking the boxes.
- Select **Install**. You're taken to a screen where you can view the installation status. Once the installation is complete, the status updates to *Installed*.

> [!IMPORTANT]
> Two solutions will always be installed in your environment:
>
> - **Employee Experience Base**. Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
> - **Onboarding Buddy**. Contains all the components needed to enable the implementation of an Onboarding Buddy program within an organization.

> [!TIP]
> You can log your questions and get support for the Onboarding Buddy template at the [**Templates-for-Power-Platform**](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site.

## Step 3: Assign security roles

The Onboarding Buddy solution contains two security roles:

- **Administrator**. Assign this role to users who need access to the model-driven administrative app to manage all reference data and see all records.
- **User**. Assign this role to all users of the Onboarding Buddy application.

Roles can be assigned from the admin portal.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Environments** on the left-side menu and select the environment where the solution is installed.  
1. Select **Users** > **See all**.
1. Select the user(s).
1. Select **Manage security roles** and select the appropriate roles for each user.
1. Select **Save**.

> [!NOTE]
> All licensed users, whether or not they are members of the security groups, must be assigned security roles to access data in the environments. You can also assign the security roles in the web application. If users don't have a security role, they'll get a *data access denied* error when trying to run an app. Users can't access environments until they're assigned at least one security role for that environment.

More information:

- [Manage application users in the Power Platform admin center](/power-platform/admin/manage-application-users)
- [Control user access to environments: security groups and licenses](/power-platform/admin/control-user-access)

## Step 4: Share the apps with program admins

You may have program managers who need to contribute to the configuration steps. In this case, follow the directions in [step eight](#step-8-share-the-onboarding-buddy-app) to share both the Onboarding Buddy Admin app and the Onboarding Buddy app specifically with them.

## Step 5: Configure program parameters

There are some program parameters that must be set for the application to work correctly.

Open the Onboarding Buddy Admin App and select **Configurations** to set the parameters for the program.

1. Select **New** in the top menu bar if you don't have any records yet. If there is already an existing record, select it and then select **Edit** in the top menu bar. There should only ever be one record in this table.
:::image type="content" source="media/install/ob-install-active-config-record.png" alt-text="Power Apps screen showing active configuration record.":::
1. There are three program-level settings you can tweak. Set them up with the values you desire.

    - **Days after match to send the first nudge email** - Controls when the first emails go out to the Buddies and Onboarders. You can use the initial emails to  introduces people to the program and encourages matches to engage with each other.
    - **Days prior to end of match to send the last nudge email** - Controls when the final emails go out to the Buddies and Onboarders. You can use the final emails to encourage matches to wrap up any final activities.
    - **Length of Buddy Match Period (days)** - Controls how long matches last.
    :::image type="content" source="media/install/ob-install-config-match-duration.png" alt-text="Power Apps screen showing new configuration record detailing how long a match lasts.":::
1. Select **Save**.

## Step 6: Populate the Onboarders table

For a new employee to show up in the app as an Onbaorder who can be matched, you must first enter them into the Onbaorders table.

The *New Onboarders Sync* flow is set to run every Saturday. It automatically imports new employees set up in AAD in the last week into the Onboarding table. Initially, though, you may have to populate existing employees that you want to be a part of the program right away.

### Manually run the flow

You can run the New Onboarders Sync flow manually to populate all new employees who join your organization in the last week. Take these steps:

1. Select **Flows** on the left-side menu in Power Apps.
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

## Step 7: Set cloud flows to *on*

Open the newly installed Onboarding Buddy solutions and verify that the cloud flows are set to the *on* status. If not, turn the status to *on*.

1. 1. Select **Solutions** on left-side panel.
1. Select the **Onboarding Buddy** solution from the list.
1. Select **Cloud flows (4)** on the left-side panel.
1. Select *each of the four flows* in the list to verify that each one is turned on.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

## Step 8: Share the Onboarding Buddy app

Share the Onboarding Buddy app with the users in your organization.

1. Go to [Power Apps](https://make.powerapps.com/).
1. Select **Apps** on the left-side panel.
1. Select the **three dots** to the right of the app you want to share.
1. Select **Share**.
1. Search for and select the appropriate security group (or individuals) that contains the members who need access to the app. You can also verify user security roles from the *Share* screen.
1. Select **Share**. You can also choose whether or not to include an email invitation (not required).

More information: [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

## Step 9: Turn on Auditing

While auditing is not required, we recommend enabling the audit setting on the system, so it's easy to see who creates and updates records in the future.

To do this:

1. Go to [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home)
1. Select **Environments** on the left-side menu and select the environment where the solution is installed.
1. Select **Settings**.
1. Select **Start Auditing**.

## Next step

- [Learn how to customize the Onboarding Buddy app](customize.md)

## See also

- [Get started managing the Onboarding Buddy app](manage.md)
- [Get started using the Onboarding Buddy app](use.md)
