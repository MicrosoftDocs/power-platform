---
title: Install and set up the Expense Reimbursement template for Power Platform
description: Learn how to install, set up, and deploy the Expense Reimbursement template for Microsoft Power Platform.
author: tverhasselt
ms.author: thoverh
contributors:
  - microsoft-george
  - nghiemdoan-msft
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 04/02/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up the Expense Reimbursement template

As a Power Platform admin, you install, set up, and deploy the Expense Reimbursement template solutions for your organization. This article covers the following steps:

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

  Make sure that the environment has access to the connectors used by the Expense Reimbursement template:

  - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook connector](/connectors/office365/)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be set up manually. You need to set up three new connections for the Expense Reimbursement app.

It's best to create the connections before you import the solution. If you create the connections during import, you have to jump back and forth between browser windows.

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and go to **Connections**.

1. Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:

    - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook connector](/connectors/office365/)
    - [Teams](/connectors/teams/)

[Learn how to manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections).

## Step 3: Install Approvals solution

The Expense Reimbursement template leverages Power Automate Approvals to approve or reject requests. By default, Power Platform environments are not set up with the required Approvals database that gets created the first time a flow with the Approvals connector is run in that environment by an administrator. Perform these steps to create the Approvals database:

1. Go to the [Power Automate maker portal](https://make.preview.powerautomate.com/environments/) and select your targeted deployment environment.
1. Select **+ Create** on left pane.
1. Select **Instant cloud flow** underneath the *Start from blank* section.
1. Choose **Manually trigger a flow** and then select **Create**.
1. Select **+ New step**.
1. Search on *Approvals* and choose **Create an approval**.
1. Enter the following properties on the *Create an approval* step:
    - **Approval type** – *Approve/Reject – First to respond*
    - **Title** – *Test*
    - **Assigned to** – *select your email address*
1. Select **Save**.
1. Select **Test Manually** and then **Test** again.
1. Select **Continue** and then **Run flow**, followed by **Done**.
1. *Delete* the flow you just created, as it is no longer needed.

> [!NOTE]
>
> It can take a few minutes for the database provisioning to complete, and you'll notice this delay the first time you run this flow. Once this first-time flow run is complete, subsequent approval flows will be faster.

More information: [Get started with Power Automate approvals](/power-automate/get-started-approvals)

## Step 4: Install solution files

You have two options for installing the Expense Reimbursement solution:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.
- [Download a managed or unmanaged version of the solution files and manually import them into your environment](#download-and-manually-install-solution-files).

### Install from AppSource

1. Go to the [Expense Reimbursement template in AppSource](<https://aka.ms/AccessExpenseReimbursementTemplate>) and select **Get it now**.

1. In the **Install Expense Reimbursement** window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select the developer environment that you prepared in the [review prerequisites step](#step-1-review-prerequisites).

1. Agree to the *Terms and Privacy* statements when prompted.

1. Select **Install**.

Two solutions are installed in your environment, **Employee Experience Base** and **Expense Reimbursement**. [Learn more about the Expense Reimbursement template solutions](./overview.md).

### Download and manually install solution files

1. Download the following managed or unmanaged solution files:

    - Managed:
      - [mpa_EmployeeExperienceBase_managed.zip](https://aka.ms/EEBaseManagedSolution)
      - [mpa_ExpenseReimbursement_managed.zip](https://aka.ms/OnboardingBuddyManagedSolution)
    - Unmanaged:
      - [mpa_EmployeeExperienceBase_unmanaged.zip](<https://aka.ms/EEBaseUnmanagedSolution>)
      - [mpa_ExpenseReimbursement_unmanaged.zip](https://aka.ms/ExpenseReimbursementUnmanagedSolution)

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared in the [review prerequisites step](#step-1-review-prerequisites).

1. In the left side panel, select **Solutions**.

1. Select **Import solution**, and then find and select the `mpa_EmployeeExperienceBase` file you downloaded.

1. Select **Next**, and then select **Import**.

1. After you receive the message that the import was successful, repeat steps 4 and 5 to import the `mpa_ExpenseReimbursement` file you downloaded.

1. Select **Next** and **Next** again.

1. For each of the connections listed, select the connection that was created in the import steps.

1. Select **Next**.

1. Skip the environment variable setup for now. The required URL values only become available after the apps are imported into the environment.

1. Select **Import** to start importing the **Expense Reimbursement** solution.

[Learn more about solutions](/power-platform/alm/solution-concepts-alm).

## Step 5: Assign Security Roles

The Expense Reimbursement solution contains two security roles.

- **Administrator**: Assign this role to users who need access to the expense reimbursement data in the model-driven administration app. Admins can:

  - View expense reimbursement data
  - Process expense reimbursements
  - Create new refund categories and programs
  - Delete expense reimbursement data

- **User**: Assign this role to all users who will view and submit expenses through the Expense Reimbursement canvas app.

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

## Step 6: Turn on cloud flows

Verify that the cloud flows are turned on in the newly installed Expense Reimbursement solution. Turn on any flows that are not already set to *on*.

1. In [Power Apps](https://make.preview.powerapps.com/), in the left side panel, select **Solutions**.

1. Select the **Onboarding Buddy** solution.

1. In the left side panel, select **Cloud flows**.

1. Select *each of the four flows* and make sure it's turned on.

## Step 7: Share the apps

Share the Expense Reimbursement app with the users in your organization.

> [!TIP]
>
> Share the app with the Expense Reimbursement program managers first so that they can configure the app to meet your organization's needs. After that configuration is complete, share the app to the wider organization.

1. Go to [Power Apps](https://make.powerapps.com/) and select the environment that contains the solution.

1. In the left side panel, select **Solutions**.

1. Select **Expense Reimbursement**.

1. In the left side panel, select **Apps**.

1. Select the **Expense Reimbursement canvas app** and select **More actions** (**&hellip;**) > **Share**.

1. Search for and select the security group or individuals who need access to the app. You can also verify user security roles here.

1. Add an optional email message.

1. Select **Share**.

[Learn how to share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app).

> [!NOTE]
> If the Expense Reimbursement app isn't shared with you and you can't access it directly in Power Apps, contact your administrator.

## Step 7: Turn on auditing (optional)

Auditing isn't required, but we recommend turning it on so that it's easy to see who creates and updates records in the future.

1. Go to the [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home) and select the environment where the solution is installed.

1. Select **Settings**, and then select **Start Auditing**.

### Next step

[Learn how to manage the Expense Reimbursement app](manage.md).

### See also

[Get started using the Expense Reimbursement app](use.md)
