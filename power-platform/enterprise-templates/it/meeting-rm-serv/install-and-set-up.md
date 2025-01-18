---
title: Install the Meeting Room Services template
description: Learn how to install, set up, and deploy the Meeting Room Services template for Microsoft Power Platform.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/21/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
customer intent: As a Microsoft Power Platform admin, I want to learn how to install, set up, and deploy the Meeting Room Services template so that my organization can effectively manage resources for meeting rooms.
---

# Install the Meeting Room Services template

Enterprise templates for Power Platform are enterprise-ready solutions designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security practices](/power-platform/guidance/adoption/admin-best-practices).

Establish a centralized team that consists of key stakeholders, product owners, and Power Platform administrators and developers. Be sure to review Power Platform best-practices and administration resource links and to develop plans that suit your organization's needs.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up the Meeting Room Services template.

## Step 1: Review prerequisites

Review the requirements, identify opportunities, and develop a plan of action that suits your organization's needs.

### Confirm licensing

Confirm your organization has the necessary licensing to use enterprise templates. More license details are available in the [Microsoft Power Platform Licensing Guide.](https://go.microsoft.com/fwlink/?linkid=2085130)You need one of the following Power Apps plans:

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

It's important to have a cohesive environment and data policy strategy for enterprise templates. To successfully install and manage the Meeting Room Services template, confirm these resources and practices are in place.

- **Administrators** - Be sure admins with the necessary privileges are available to coordinate and assign licensing and create environments.

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licensing
  - Power Platform Administrator to create environments

  More information: [Microsoft Power Platform admin](/power-platform/admin/)

- **Environments** - Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Create and prepare a Power Platform developer environment specifically for the Meeting Room Services solution files. Also consider:

  - The Power Platform environment is set up with a Dataverse database
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment

  More information: [Environments overview](/power-platform/admin/environments-overview)

- **Data loss prevention policies** - Ensure the environment has access to the Microsoft connectors used by the Meeting Room Services template:

  - [Dataverse](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook](/connectors/office365/)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires you to set up four new connections for the Meeting Room Services app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

To create the connections in advance, take these steps:

1. Sign in to [Power Apps](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these Microsoft connectors:

    - [Dataverse](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365/)

## Step 3: Install solution files

You install the Meeting Room Services solution from AppSource, a Microsoft digital storefront.

1. Go to the [Meeting Room Services template](<https://aka.ms/AccessMeetingRoomSvcsReqTemplate>)in AppSource and select **Get it now**.
1. In the *Install Meeting Room Services Template* window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select the developer environment that you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. Agree to the *Terms and Privacy Statements* when prompted.
1. Select **Install**.

[Learn more about AppSource](https://appsource.microsoft.com/en-US/)
[Learn more about solutions](/power-platform/alm/solution-concepts-alm)

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Meeting Room Services template. You can also check for updates to the [deployment packages](https://github.com/microsoft/Templates-for-Power-Platform/tree/main/DeploymentPackages) on this site.

## Step 4: Assign security roles

The Meeting Room Services solution contains three security roles.

- **Administrator** grants access to the model-driven app where an admin can:

  - View available dashboards
  - Manage all data from available tables
  - Create new Services, Subservices, and Survey Topics
  - Delete Meeting Room Services data

- **Support** grants access to the model-driven app where they can:

  - View available dashboards
  - Process service requests

- **User** grants access to the canvass app, where users:

  - Manage their own service requests
  - Submit feedback for completed service requests
  - Report issues on meeting rooms

Take these steps to assign roles:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Environments** on the left-side menu and select the environment where the solution is installed.  
1. Select **Users** > **See all**.
1. Select the user(s).
1. Select **Manage security roles** and select the appropriate roles for each user.
1. Select **Save**.

> [!NOTE]
> All licensed users, whether or not they are members of the security groups, must be assigned security roles to access data in the environments. You can also assign the security roles in the web application. If users don't have a security role, they'll get a *data access denied* error when trying to run an app. Users can't access environments until they're assigned at least one security role for that environment.

More information:

- [Learn how to manage application users in the Power Platform admin center](/power-platform/admin/manage-application-users)
- [Learn how to control user access to environments: security groups and licenses](/power-platform/admin/control-user-access)

## Step 5: Turn on cloud flows

Verify that the cloud flows are turned on in the newly installed Meeting Room Services solution. Take these steps to turn on any flows that are not already set to *on*.

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** on the left pane.
1. Select the **Meeting Room Services** solution from the list.
1. Select **Cloud flows** on the left pane.
1. Select *each cloud flow* to verify that it is turned on.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

## Step 6: Share the app

Share the Meeting Room Services app with the users in your organization.

> [!TIP]
>
> Share the app with the Meeting Room Services program managers first so that they can configure the app to meet your organization's needs. After that configuration is complete, share the app to the wider organization.

1. Go to [Power Apps](https://make.powerapps.com/) and select the environment that contains the solution.

1. Select **Solutions** on the left pane.

1. Select **Meeting Room Services** from the list.

1. Select **Apps** on the left pane.

1. Select the **Meeting Room Services canvas app** in the list and select **More actions** (**&hellip;**).

1. Select **Share**.

1. Search for and add the users who you want to share the app with.

    - For users who should have access to edit the app, check the **Co-owner** box.
    - For regular users of the app, leave that checkbox empty.
    - If everyone in the organization should be able to use the app, select **Everyone** in the *Enter a name* box.
1. In the *Data permission* area, you can select roles from a drop-down list. It's next to the Microsoft Dataverse tables that the Meeting Room Services app uses.
1. Add an optional email message.
1. Select **Share**.
:::image type="content" source="media/install/share-app.png" alt-text="Screenshot of sharing the appointment booking app with users.":::

[Learn how to share a canvas app with your organization.](/power-apps/maker/canvas-apps/share-app)

> [!NOTE]
> If the Meeting Room Services app isn't shared with you and you can't access it directly in Power Apps, contact your administrator.

## Step 7: Turn on auditing (optional)

Auditing isn't required, but we recommend turning it on so that it's easy to see who creates and updates records in the future.

1. Go to Power Platform admin center
1. Select **Environment** and then select the environment where the solution is installed.
1. Select **Audit settings**.
1. Select **Start auditing**.

## Next step

[Manage the Meeting Room Services app](manage.md)
