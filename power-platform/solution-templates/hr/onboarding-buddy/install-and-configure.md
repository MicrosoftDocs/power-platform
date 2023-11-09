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

## Step 1: Review prerequisites

Review the requirements, identify opportunities and develop a plan of action that suits your organization's needs.

### Confirm licensing

Confirm your organization has the necessary licensing to use enterprise templates. You need:

- One of the following Power Apps plans:

  - Power Apps Premium
  - Power Apps per app
  - Power Apps per app pay-as-you-go-meter
  - Power Apps use rights included with Dynamics 365 licenses

> [!NOTE]
>
> Power Apps use rights included with Microsoft 365 and Office 365 licenses will not suffice to install the template.

More license details are available in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)

> [!TIP]
> A free Developer Plan is a great way to install the template for evaluation purposes. More information: [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)

### Set up environments and data policies

It's important to have a cohesive environment and data policy strategy and setup for enterprise templates to securely deploy your solutions. To successfully install and manage the Onboarding Buddy template, confirm these resources and practices are in place.

- **Administrators** - Be sure admins with the necessary privileges are available to coordinate to assign licensing and create environments.

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licensing
  - Power Platform Administrator to create environments if needed

  More information: [Microsoft Power Platform admin](/power-platform/admin/)

- **Environments** - Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in setting up and managing environments. Also consider:

  - A Power Platform Environment with a Dataverse database installed is set up
  - Environment Maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment

  More information: [Environment overview](/power-platform/admin/environments-overview)

- **Data loss prevention policies** - Ensure the environment has access to the connectors used by the Onboarding Buddy template:

  - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook connector](/connectors/office365/)
  - [Office 365 Users connector](/connectors/office365users/)
  - [Office 365 Groups connector](/connectors/office365groups/)

  More information: [Environment overview](/power-platform/admin/environments-overview)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires you to set up four new connections for the Onboarding Buddy app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

To create the connections in advance, take these steps:

1. Go to [Power Apps maker portal](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:

    - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook connector](/connectors/office365/)
    - [Office 365 Users connector](/connectors/office365users/)
    - [Office 365 Groups connector](/connectors/office365groups/)

   More information: [Manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 3: Install solution files

You have two options to consider for installing the Onboarding Buddy template to the environment you prepared for it:

- You can access the template on [AppSource](https://appsource.microsoft.com/home) where selecting the *Get it now* button automatically takes you to an *install window* in the Power Platform admin center.
- You can download either a *managed* or an *unmanaged* version of the solution files and manually import them into your environment according to your organization's requirements.

> [!TIP]
>
> You can log your questions and get support for the Onboarding Buddy template at the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site.

### Install from AppSource

1. Go to the [Onboarding Buddy template in AppSource](<https://appsource.microsoft.com/product/dynamics-365/powerplatformtemplates.mpa-onboardingbuddy?exp=ubp8&tab=Overview>) and select **Get it now**.
1. Select the developer environment that you prepared for the template.
   :::image type="content" source="media/install/ob-install-env.png" alt-text="Select the environment in which to install the template.":::
1. Agree to the *Terms and Privacy* statements by selecting the boxes.
1. Select **Install**. You are taken to a screen where you can view the installation status. Once the installation is complete, the status shows as *Installed*.

> [!IMPORTANT]
> Two solutions will always be installed in your environment:
>
> - **Employee Experience Base**. Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
> - **Onboarding Buddy**. Contains all the components needed to enable the implementation of an Onboarding Buddy program within an organization.

### Download and manually install solution files

You also have the option to download *managed* or *unmanaged* solution files to manually install into your prepared environment according to your organization's requirements:

1. Download the following managed or unmanaged solution files:

    - Managed
      - [mpa_EmployeeExperienceBase_managed.zip](https://aka.ms/EEBaseManagedSolution)
      - [mpa_OnboardingBuddy_managed.zip](https://aka.ms/OnboardingBuddyManagedSolution)
    - Unmanaged
      - [mpa_EmployeeExperienceBase_unmanaged.zip](<https://aka.ms/EEBaseUnmanagedSolution>)
      - [mpa_OnboardingBuddy_unmanaged.zip](https://aka.ms/OnboardingBuddyUnmanagedSolution)

1. Go to [Power Apps maker portal](https://make.preview.powerapps.com/) and select the environment you prepared for the solution.
1. Select **Solutions** on the left-side panel.
1. Select **Import solution**.
1. Browse for and select either the **managed** or **unmanaged version** of the *mpa_EmployeeExperienceBase* file downloaded in previous step.
1. Select **Next**.
1. Select **Import**. This starts the import process of the *Employee Experience Base* solution.
1. Wait for the *Employee Experience Base* solution to finish importing. The import process can take a few minutes at which point you will be notified with a *Success* message.
1. Browse for and select either the **managed** or **unmanaged** version of the *mpa_Onboarding Buddy* file downloaded in previous step.
1. Select **Next** and **Next** again.
1. For each of the connections listed, select the *existing connection that was created in the previous step*.
1. Select **Next**.
1. Ignore entering values for the environment variables as this is completed in another step later. Since the apps have not been imported into the environment yet, we are unable to capture what their URL values are at the moment.
1. Select **Import** which starts the import process of the *Onboarding Buddy* solution.
Wait for the *Onboarding Buddy* solution to finish importing. The import often takes a few minutes at which point you are notified with a *Success* message.

More information: [Solution concepts](/power-platform/alm/solution-concepts-alm)

## Step 4: Assign security roles

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

## Step 5: Share the apps with program admins

You may have program managers who need to contribute to the configuration steps. In this case, follow the directions in [step nine](#step-9-share-the-onboarding-buddy-app) to share both the Onboarding Buddy Admin app and the Onboarding Buddy app specifically with them.

## Step 6: Configure program parameters

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

## Step 7: Populate the Onboarders table

For a new employee to show up in the app as an Onbaorder who can be matched, you must first enter them into the Onbaorders table.

The *New Onboarders Sync* flow is set to run every Saturday. It automatically imports new employees set up in AAD in the last week into the Onboarding table. Initially, though, you may have to populate existing employees that you want to be a part of the program right away.

### Manually run the flow

You can run the New Onboarders Sync flow manually to populate all new employees who join your organization in the last week. Take these steps:

1. Select **Flows** on the left-side menu in Power Apps.
1. Hover over the **New Onboarders Sync** flow and select **Play** (Run).
:::image type="content" source="media/install/ob-install-onboarders-sync.png" alt-text="Power Apps screen showing Cloud flows.":::

### Manually create onboarder records

You can manually add existing employees that have been set up in Entra ID for more than a week to the Onboarders table.

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

## Step 8: Set cloud flows to *on*

Open the newly installed Onboarding Buddy solutions and verify that the cloud flows are set to the *on* status. If not, turn the status to *on*.

1. Select **Solutions** on left-side panel.
1. Select the **Onboarding Buddy** solution from the list.
1. Select **Cloud flows (4)** on the left-side panel.
1. Select *each of the four flows* in the list to verify that each one is turned on.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

## Step 9: Share the Onboarding Buddy app

Share the Onboarding Buddy app with the users in your organization.

> [!NOTE]
>
> Share the app with the Onboarding Buddy program manager(s) first so they can configure the app to meet your organization's needs. Once that configuration is complete, deploy the app to the wider organization.

1. Go to [Power Apps](https://make.powerapps.com/).
1. Select **Apps** on the left-side panel.
1. Select the **three dots** to the right of the app you want to share.
1. Select **Share**.
1. Search for and select the appropriate security group (or individuals) that contains the members who need access to the app. You can also verify user security roles from the *Share* screen.
1. Select **Share**. You can also choose whether or not to include an email invitation (not required).

More information: [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

## Step 10: Turn on Auditing

While auditing is not required, we recommend enabling the audit setting on the system, so it's easy to see who creates and updates records in the future.

Take these steps to enable the audit settings:

1. Go to [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home)
1. Select **Environments** on the left-side menu and select the environment where the solution is installed.
1. Select **Settings**.
1. Select **Start Auditing**.

## Next step

- [Learn how to customize the Onboarding Buddy app](customize.md)

## See also

- [Get started managing the Onboarding Buddy app](manage.md)
- [Get started using the Onboarding Buddy app](use.md)
