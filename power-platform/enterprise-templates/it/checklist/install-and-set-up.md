---
title: Install and set up the Checklist App template
description: Learn how to install, set up, and deploy the Checklist App template for Microsoft Power Platform.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/21/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
# customer intent: As an administrator, I want to understand how to install and set up the Checklist App template for Power Platform.
---

# Install and set up the Checklist App template

Enterprise templates for Power Platform are enterprise-ready solutions that are designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security](/power-platform/guidance/adoption/admin-best-practices) practices.

Establish a centralized team that consists of key stakeholders, product owners, and Power Platform administrators and developers. Be sure to review Power Platform best-practices and administration resource links and to develop plans that suit your organization's needs.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up the Checklist template.

## Step 1: Review prerequisites

Review the licensing and administration requirements, identify opportunities, and develop a plan of action that suits your organization's needs.

### Confirm licensing

Confirm your organization has the necessary licensing to carry out an enterprise template implementation. You need:

- One of the following Power Apps plans:

  - Power Apps Premium
  - Power Apps per app
  - Power Apps per app pay-as-you-go-meter
  - Power Apps use rights included with Dynamics 365 licenses

More license details are available in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)

> [!NOTE]
>
> Power Apps use rights included with Microsoft 365 and Office 365 licenses will not suffice to install the template.

> [!TIP]
> A free Developer Plan is a great way to install the template for evaluation purposes. More information: [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)

### Create environments and data policies

It's important to have a cohesive environment and data policy strategy for enterprise templates. To successfully install and manage the Checklist App template, confirm these resources and practices are in place.

- **Administrators** - Be sure admins with the necessary privileges are available to coordinate and assign licensing and create environments.

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licensing
  - Power Platform Administrator to create environments

  More information: [Microsoft Power Platform admin](/power-platform/admin/)

- **Environments** - Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Create and prepare a Power Platform developer environment specifically for the Checklist App solution files. Also consider:

  - The Power Platform environment is set up with a Dataverse database
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment

  More information: [Environments overview](/power-platform/admin/environments-overview)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

You need to set up new connections for the Checklist app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump between browser windows.

To create the connections in advance, take these steps:

1. Sign in to [Power Apps](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these Microsoft connectors:

    - [Dataverse](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365/)
    - [Teams](/connectors/teams/)

  [Learn how to manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections).

## Step 3: Install solution files

You have two options for installing the Checklist App solution:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.
- [Download a managed or unmanaged version of the solution files and manually import them into your environment](#download-and-manually-install-solution-files).

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Checklist template. You can also check for updates to the [deployment packages](https://github.com/microsoft/Templates-for-Power-Platform/tree/main/DeploymentPackages) on this site.

### Install from AppSource

AppSource is a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [Checklist template](<https://aka.ms/AccessChecklistTemplate>) in AppSource and select **Get it now**.
1. In the *Install Checklist Template* window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select the developer environment that you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. Agree to the *Terms and Privacy Statements* when prompted.
1. Select **Install**.

[Learn more about AppSource](https://appsource.microsoft.com/en-US/)

### Download and manually install solution files

1. Download the Checklist App solution files. You can download either Managed *or* Unmanaged versions:

    - Managed: [mpa_Checklist_managed.zip](https://aka.ms/ChecklistManagedSolution)
    - Unmanaged: [mpa_Checklist_unmanaged.zip](https://aka.ms/ChecklistUnManagedSolution)

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. In the left pane, select **Solutions**.
1. Select **Import solution**, and then find and select the **managed** or **unmanaged version** of the `mpa_Checklist` file downloaded.
1. Select **Next**, and then select **Import**.
1. For each of the connections listed, select the connection that was created in the import steps.
1. Select **Next**.
1. Skip the the environment variable setup for now. The required URL values only become available after the apps are imported into the environment.
1. Select **Import** to start importing the *Appointment Booking* solution. The import process takes a few minutes and once it's complete you're notified with a *Success* message.

[Learn more about solutions](/power-platform/alm/solution-concepts-alm)

## Step 4: Assign security roles

Set up security roles in your solutions so admins and users can use the apps. The Checklist App solution contains two security roles:

- **Checklist App - Administrator** is the administrator of the Checklist app. The admin security role grants access to the canvas app and model-driven app where they can:

  - Create and modify templates, template steps, and template sub steps.
  - Manage categories, inventories, items, validation types and validation units.
  - Manage report through the model-driven application.
- **Checklist App - User** is the user of the Checklist App. The user security role grants access to the canvas app to create reports on existing inventory with the respective custom template mapped for the item category.

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

## Step 5: Share the app

Share the Checklist App with users in your organization.

> [!TIP]
> Share the Checklist App with program managers first so they can configure the app to meet your organization's needs. After that configuration is complete, share the app to the wider organization.

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** on the left pane and select the **Checklist** solution from the list.
1. Select **Apps**.
1. Go to the *Checklist canvas app* in the list and select the **three dots** to see a list of actions.
1. Select **Share**.
1. Search for and add the users you want to share the app with.
    - For users who should be able to edit the app, select the **Co-owner** box.
    - For regular users of the app, leave that checkbox empty.
    - If everyone in the organization should be able to use the app, select **Everyone** in the *Enter a name* box.
1. In the *Data permission* area, select the roles from a dropdown list. It's next to the Microsoft Dataverse tables that the Checklist app uses.
1. Add an optional email message.
1. Select **Share**.
:::image type="content" source="media/install/share-app.png" alt-text="Screenshot of sharing the Checklist app with users.":::

> [!NOTE]
>If the Checklist App isn't shared with you and you cannot access it directly in Power Apps, please contact your admin.

[Learn how to share a canvas app with your organization.](/power-apps/maker/canvas-apps/share-app)

## Step 6: Turn on auditing (optional)

We recommend enabling the audit setting on the system, so it's easy to see who creates and updates records.

Take these steps to enable the audit settings:

1. Go to [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home).
1. Select **Environments** on the left pane and select the *environment* where the solution is installed.
1. Select **Settings**.
1. Select **Start Auditing**.
:::image type="content" source="media/install/start-auditing.png" alt-text="Screenshot of turning on auditing in the Power Platform admin center.":::

### Next step

[Manage the Checklist App](manage.md)

### See also

[Use the Checklist App](use.md)
