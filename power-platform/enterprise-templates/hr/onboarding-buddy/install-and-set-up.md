---
title: Install and set up the Onboarding Buddy template
description: Learn how to install, set up, and deploy the Onboarding Buddy template for Microsoft Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 03/07/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up the Onboarding Buddy template

As a Power Platform admin, you install, set up, and deploy the Onboarding Buddy template solutions for your organization. This article covers the following steps:

## Step 1: Review prerequisites

Make sure that you have the required license and an environment and data policy in place before you start.

### Confirm licensing

Make sure that your organization has the necessary licensing to use enterprise templates. Power Apps usage rights that are included with Microsoft 365 and Office 365 licenses aren't sufficient. You need one of the following Power Apps plans:

- Power Apps Premium
- Power Apps per app
- Power Apps per app pay-as-you-go-meter
- Power Apps use rights included with Dynamics 365 licenses

More license details are available in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

> [!TIP]
> A free [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/) is a great way to install the template for evaluation purposes.

### Create environment and data policies

It's important to have a cohesive environment and data policy and required resources in place.

- **Administrators**

  Make sure that admins with the necessary privileges are available to assign licenses and create environments:

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licenses
  - Power Platform Administrator to create environments

  [Learn more about Microsoft Power Platform administration](/power-platform/admin/).

- **Environments**

  - Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment).
  - Make sure that a Power Platform environment is set up with a Dataverse database.
  - Make sure that environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment.

  [Learn more about Power Platform environments](/power-platform/admin/environments-overview).

- **Data loss prevention policies**

  Make sure that the environment has access to the connectors used by the Onboarding Buddy template:

  - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook connector](/connectors/office365/)
  - [Office 365 Users connector](/connectors/office365users/)
  - [Office 365 Groups connector](/connectors/office365groups/)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be set up manually. You need to set up four new connections for the Onboarding Buddy app.

It's best to create the connections before you import the solution. If you create the connections during import, you have to jump back and forth between browser windows.

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and go to **Connections**.

1. Create a connection with each of these connectors:

    - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook connector](/connectors/office365/)
    - [Office 365 Users connector](/connectors/office365users/)
    - [Office 365 Groups connector](/connectors/office365groups/)

[Learn how to manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections).

## Step 3: Install solution files

You have two options for installing the Onboarding Buddy solution:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.
- [Download a managed or unmanaged version of the solution files and manually import them into your environment](#download-and-manually-install-solution-files).

### Install from AppSource

1. Go to the [Onboarding Buddy template in AppSource](<https://aka.ms/AccessOnboardingBuddyTemplate>) and select **Get it now**.

1. In the **Install Onboarding Buddy** window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select the developer environment that you prepared in the [review prerequisites step](#step-1-review-prerequisites).

1. Agree to the *Terms and Privacy* statements when prompted.

1. Select **Install**.

Two solutions are installed in your environment, **Employee Experience Base** and **Onboarding Buddy**. [Learn more about the Onboarding Buddy template solutions](./overview.md).

### Download and manually install solution files

1. Download the following managed or unmanaged solution files:

    - Managed:
      - [mpa_EmployeeExperienceBase_managed.zip](https://aka.ms/EEBaseManagedSolution)
      - [mpa_OnboardingBuddy_managed.zip](https://aka.ms/OnboardingBuddyManagedSolution)
    - Unmanaged:
      - [mpa_EmployeeExperienceBase_unmanaged.zip](<https://aka.ms/EEBaseUnmanagedSolution>)
      - [mpa_OnboardingBuddy_unmanaged.zip](https://aka.ms/OnboardingBuddyUnmanagedSolution)

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared in the [review prerequisites step](#step-1-review-prerequisites).

1. In the left side panel, select **Solutions**.

1. Select **Import solution**, and then find and select the `mpa_EmployeeExperienceBase` file you downloaded.

1. Select **Next**, and then select **Import**.

1. After you receive the message that the import was successful, repeat steps 4 and 5 to import the `mpa_Onboarding Buddy` file you downloaded.

1. Select **Next** and **Next** again.

1. For each of the connections listed, select the connection that was created in the import steps.

1. Select **Next**.

1. Skip the environment variable setup for now. The required URL values only become available after the apps are imported into the environment.

1. Select **Import** to start importing the **Onboarding Buddy** solution.

[Learn more about solutions](/power-platform/alm/solution-concepts-alm).

## Step 4: Assign security roles

The Onboarding Buddy solution contains two security roles:

- **Administrator**: Assign this role to users who need access to the model-driven administration app to manage all reference data and view all records.
- **User**: Assign this role to all users of the Onboarding Buddy application.

All licensed users, whether or not they're members of a security group, must have a security role assigned. If users don't have a security role, they get a "data access denied" error when they try to run the app. Users can't access environments until they're assigned at least one security role for that environment.

Assign security roles in the Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. In the left side panel, select **Environments**.

1. Select the environment where the solution is installed.

1. Select **Users** > **See all**.

1. Select user(s), select **Manage security roles**, and then select the appropriate roles for each user.

1. Select **Save**.

- [Learn how to manage application users in the Power Platform admin center](/power-platform/admin/manage-application-users).
- [Learn how to control user access to environments with security groups and licenses](/power-platform/admin/control-user-access).

## Step 5: Share the apps with program admins

If program managers need to contribute to configuring the Onboarding Buddy program, [share both the Onboarding Buddy Admin app and the Onboarding Buddy app with them](#step-9-share-the-onboarding-buddy-app).

## Step 6: Configure program parameters

1. Open the Onboarding Buddy Admin app and select **Configurations**.

1. Select **New** if you don't have any configurations yet, or select **Edit** if a configuration has been created. This table should only ever contain one record.

1. Set the three program-level options:

    - **Days after match to send first nudge email** determines when the first emails go out to Buddies and Onboarders. These emails introduce the program and encourage matches to engage with each other.
    - **Days prior to end of match to send the last nudge email** determines when the final emails go out to Buddies and Onboarders. These emails encourage matches to wrap up any final activities.
    - **Length of Buddy Match Period (days)** determines how long matches last.

    :::image type="content" source="./media/install/ob-install-config-match-duration.png" alt-text="Screenshot of three configuration options in the Onboarding Buddy Admin app.":::

1. Select **Save & Close**.

## Step 7: Populate the Onboarders table

The **New Onboarders Sync** flow runs every Saturday, automatically importing into the `Onboarding` table new employees who were set up in Microsoft Entra ID in the previous week. If you want new employees to be part of the program right away, enter them into the `Onboarders` table. You have two options, either run the flow or enter the records manually.

### Run the flow

1. In Power Apps, in the left side panel, select **Flows**.

1. Hover over the **New Onboarders Sync** flow and select the **Play** icon (**Run**).

:::image type="content" source="media/install/ob-install-onboarders-sync.png" alt-text="Screenshot of the Power Apps Cloud flows page, with the Play icon highlighted.":::

### Manually create Onboarder records

1. In the Onboarding Buddy Admin app, select **Onboarders**.

1. Select **New**.

1. Enter information about the new employee. The most critical fields to populate are:

    - Onboarder
    - Name
    - Email
    - Job Title
    - Organization
    - Region

1. Select **Save & Close**.

1. Repeat for as many Onboarders as you need to create.

## Step 8: Turn on cloud flows

1. In Power Apps, in the left side panel, select **Solutions**.

1. Select the **Onboarding Buddy** solution.

1. In the left side panel, select **Cloud flows (4)**.

1. Select *each of the four flows* and make sure it's turned on.

## Step 9: Share the Onboarding Buddy app

Share the Onboarding Buddy app with the users in your organization.

> [!TIP]
>
> Share the app with the Onboarding Buddy program managers first so that they can configure the app to meet your organization's needs. After that configuration is complete, share the app to the wider organization.

1. Go to [Power Apps](https://make.powerapps.com/) and select the environment that contains the solution.

1. In the left side panel, select **Solutions**.

1. Select **Onboarding Buddy**.

1. In the left side panel, select **Apps**.

1. Select the **Onboarding Buddy canvas app** and select **More actions** (**&hellip;**) > **Share**.

1. Search for and select the security group or individuals who need access to the app. You can also verify user security roles here.

1. Add an optional email message.

1. Select **Share**.

[Learn how to share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app).

> [!NOTE]
> If the Onboarding Buddy apps aren't shared with you and you can't access them directly in Power Apps, contact your administrator.

## Step 10: Turn on auditing (optional)

Auditing isn't required, but we recommend turning it on so that it's easy to see who creates and updates records in the future.

1. Go to the [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home) and select the environment where the solution is installed.

1. Select **Settings**, and then select **Start Auditing**.

### Next step

[Learn how to customize the Onboarding Buddy app](customize.md).

### See also

- [Get started managing the Onboarding Buddy app](manage.md)
- [Get started using the Onboarding Buddy app](use.md)
