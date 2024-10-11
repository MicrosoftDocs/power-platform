---
title: Install and set up Expense Reimbursement template for Power Platform
description: Learn how to install, set up, and deploy the Expense Reimbursement template for Microsoft Power Platform.
author: tverhasselt
contributors:
  - microsoft-george
  - nghiemdoan-msft
  - EllenWehrle
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 07/02/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up Expense Reimbursement template

Enterprise templates for Power Platform are enterprise-ready solutions that are designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security](/power-platform/guidance/adoption/admin-best-practices) practices.

Establish a centralized team of key stakeholders, product owners, developers, and Power Platform administrators. Be sure to review Power Platform best practices and administration resource links and develop plans that suit your organization's needs.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up the Expense Reimbursement template.

## Step 1: Review prerequisites

Make sure that you have the required license and an environment and data policy in place before you start.

### Confirm licensing

Make sure that your organization has the necessary licensing to use enterprise templates. Power Apps usage rights that are included with Microsoft 365 and Office 365 licenses aren't sufficient. More license details are available in the [Microsoft Power Platform Licensing Guide.](https://go.microsoft.com/fwlink/?linkid=2085130) You need one of the following Power Apps plans:

- Power Apps Premium
- Power Apps per app
- Power Apps per app pay-as-you-go-meter
- Power Apps use rights included with Dynamics 365 licenses

> [!TIP]
> A free [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/) is a great way to install the template for evaluation purposes.

### Create environment and data policies

It's important to have a cohesive environment and data policy and to ensure the required resources are in place.

- **Administrators**

  Make sure that admins with the necessary privileges are available to assign licenses and create environments:

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licenses.
  - Power Platform Administrator to create environments.

  [Learn more about Microsoft Power Platform administration.](/power-platform/admin/)

- **Environments**: Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Create and prepare a Power Platform developer environment specifically for the Expense Reimbursement solution files. Also consider:

  - The Power Platform environment is set up with a Dataverse database
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment

  [Learn more about Power Platform environments.](/power-platform/admin/environments-overview)

- **Data loss prevention policies**

  Make sure that the environment has access to the connectors used by the Expense Reimbursement template:

  - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook connector](/connectors/office365/)
  
  [Learn more about data loss prevention policies.](/power-platform/admin/wp-data-loss-prevention)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be set up manually. You need to set up three new connections for the Expense Reimbursement app.

It's best to create the connections before you import the solution. If you create the connections during import, you have to jump back and forth between browser windows.

1. Sign in to [Power Apps.](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:

    - [Microsoft Dataverse connector](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook connector](/connectors/office365/)
    - [Teams](/connectors/teams/)

  [Learn how to manage connections in canvas apps.](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 3: Create approvals database

The Expense Reimbursement solution leverages Power Automate Approvals to approve or reject requests.

By default, Power Platform environments aren't set up with the required database for approvals. The database is created the first time a flow with the [Approvals connector](/connectors/approvals/) is run in that environment by an administrator.

Take these steps to create the database for approvals:

1. Go to the [Power Automate maker portal](https://make.preview.powerautomate.com/environments/) and select your targeted deployment environment.
1. Select **+ Create**.
1. Select **Instant cloud flow** underneath the *Create from blank* section.
1. Choose **Manually trigger a flow** and then select **Create**.
1. Select **+ New step**.
1. Search on *Approvals* and choose **Create an approval**.
1. Enter the following properties on the *Create an approval* step:
    - **Approval type**: *Approve/Reject – First to respond*
    - **Title**: *Test*
    - **Assigned to**: *select your email address*
1. Select **Save**.
1. Select **Test Manually** and then **Test** again.
1. Select **Continue** and then **Run flow**, followed by **Done**.
1. Delete the *flow* you created, as it is no longer needed.

[Learn how to get started with Power Automate approvals.](/power-automate/get-started-approvals)

> [!NOTE]
>
> It can take a few minutes for the database provisioning to complete, and you'll notice this delay the first time you run this flow. Once you complete this first-time flow run, subsequent approval flows will be faster.

## Step 4: Install solution files

You have two options for installing the Expense Reimbursement template:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.
- [Download a managed or unmanaged version of the solution files and manually import them into your environment.](#download-and-manually-install-solution-files)

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Expense Reimbursement template.

### Install from AppSource

AppSource is a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [Expense Reimbursement template in AppSource](<https://aka.ms/AccessExpenseReimbursementTemplate>) and select **Get it now**.

1. In the **Install Expense Reimbursement** window in the [Power Platform admin center,](https://admin.powerplatform.microsoft.com/) select the developer environment that you prepared in the [review prerequisites step.](#step-1-review-prerequisites)

1. Agree to the *Terms and Privacy* statements when prompted.

1. Select **Install**. Two [solutions](/power-platform/alm/solution-concepts-alm) are installed in your environment:

    - **Employee Experience Base**
    - **Expense Reimbursement**.

    Go to the [Expense Reimbursement overview article](./overview.md) to learn more about the two solutions.

> [!IMPORTANT]
> Two solutions are always installed in your environment:
>
> - **Employee Experience Base**. Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
> - **Expense Reimbursement**. Contains all the components needed to enable the implementation of the Expense Reimbursement program within an organization.

### Download and manually install solution files

Managed and unmanaged solution files are available for you to download and manually install. Take these steps to download and import the solutions directly into the development environment that you prepared for it in the [review prerequisites step](#step-1-review-prerequisites).

1. Download solution files.

    - Managed:
      - [mpa_EmployeeExperienceBase_managed.zip](https://aka.ms/EEBaseManagedSolution)
      - [mpa_ExpenseReimbursement_managed.zip](https://aka.ms/mpa_ExpenseReimbursement_managed.zip)
    - Unmanaged:
      - [mpa_EmployeeExperienceBase_unmanaged.zip](<https://aka.ms/EEBaseUnmanagedSolution>)
      - [mpa_ExpenseReimbursement.zip](https://aka.ms/ExpenseReimbursementUnManagedSolution)

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared in the [review prerequisites step](#step-1-review-prerequisites).

1.Select **Solutions**.

1. Select **Import solution**, and then find and select the `mpa_EmployeeExperienceBase` file you downloaded.

1. Select **Next**, and then select **Import**.

1. After you receive the message that the import was successful, repeat steps 4 and 5 to import the `mpa_ExpenseReimbursement` file you downloaded.

1. Select **Next** and **Next** again.

1. For each of the connections listed, select the connection that was created in the import steps.

1. Select **Next**.

1. Skip the environment variable setup for now. The required URL values only become available after the apps are imported into the environment.

1. Select **Import** to start importing the **Expense Reimbursement** solution.

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

1. Sign in to the [Power Platform admin center.](https://admin.powerplatform.microsoft.com/)

1. Select **Environments**.

1. Select the environment where the solution is installed.

1. Select **Users** > **See all**.

1. Select user(s), select **Manage security roles**, and then select the appropriate roles for each user.

1. Select **Save**.

Want to learn more about setting up and managing users? Start here:

- [Learn how to manage application users in the Power Platform admin center.](/power-platform/admin/manage-application-users)
- [Learn how to control user access to environments with security groups and licenses.](/power-platform/admin/control-user-access)

## Step 6: Turn on cloud flows

Verify that the cloud flows are turned on in the newly installed Expense Reimbursement solution. Turn on any flows that are not already set to *on*.

1. In [Power Apps,](https://make.preview.powerapps.com/), select **Solutions**.

1. Select the **Expense Reimbursement** solution.

1. Select **Cloud flows**.

1. Select *each of the four flows* and make sure it's turned on.

## Step 7: Share the apps

Share the Expense Reimbursement app with the users in your organization.

> [!TIP]
>
> Share the app with the Expense Reimbursement program managers first so that they can configure the app to meet your organization's needs. After that configuration is complete, share the app to the wider organization.

1. Go to [Power Apps](https://make.powerapps.com/) and select the environment that contains the solution.

1. Select **Solutions**.

1. Select **Expense Reimbursement**.

1. Select **Apps**.

1. Select the **Expense Reimbursement canvas app** and select **More actions** (**&hellip;**) > **Share**.

1. Search for and select the security group or individuals who need access to the app. You can also verify user security roles here.

1. Add an optional email message.

1. Select **Share**.

[Learn how to share a canvas app with your organization.](/power-apps/maker/canvas-apps/share-app)

> [!NOTE]
> If the Expense Reimbursement app isn't shared with you and you can't access it directly in Power Apps, contact your administrator.

## Step 8: Enable Copilot (optional)

Copilot for model-driven apps in Power Apps is a next-generation AI assistant for app users to get insights about the data in their apps through conversation in natural language. As an expense reimbursement program administrator or reviewer, leverage Copilot to help you get insights on the expense reimbursement data while taking action. Follow these steps to turn Copilot on within your environment:

1. [Go to Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Environments** and then select the environment where the solution was installed.
1. Ensure the environment *Release Channel* is set to **Monthly** by following the [Changing release channels for model-driven apps guidance](/power-apps/maker/model-driven-apps/channel-change).
1. Select the **Settings**.
1. Expand the *Product* section and select **Features**.
1. Underneath the *Copilot* section, change the *Allow users to analyze data using an AI-powered chat experience in canvas and model-driven apps* to **On**.

[Learn how to use Copilot chat in model-driven apps](/power-apps/user/use-copilot-model-driven-apps)

## Step 9: Turn on auditing (optional)

Auditing isn't required, but we recommend turning it on so that it's easy to see who creates and updates records in the future.

1. Go to the [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home) and select the environment where the solution is installed.

1. Select **Settings**, and then select **Start Auditing**.

### Next step

[Learn how to manage the Expense Reimbursement app](manage.md).

### See also

[Use the Expense Reimbursement app](use.md)
