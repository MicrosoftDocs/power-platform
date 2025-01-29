---
title: Install and set up the Parking Reservation template for Power Platform
description: Learn how to install, set up, and deploy the Parking Reservation template for Microsoft Power Platform.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 01/29/2025
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
ms.collection: bap-ai-copilot
---

# Install and set up the Parking Reservation template for Power Platform

Enterprise templates for Power Platform are enterprise-ready solutions that are designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security](/power-platform/guidance/adoption/admin-best-practices) practices.

Establish a centralized team that consists of key stakeholders, product owners, and Power Platform admins and developers. Be sure to review Power Platform best-practices and administration resource links and to develop plans that suit your organization's needs.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up the Hardware Request and Management template.

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

- A Power BI Pro or higher license. More information: [Pricing and Product Comparison](https://powerbi.microsoft.com/pricing/)

> [!TIP]
> A free Developer Plan combined with a free Power BI in Microsoft Fabric free account is a great way to install the template for evaluation purposes.
>
> More information: [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)

More information: [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)

### Set up environments and data policies

It's important to have a cohesive environment and data policy and to ensure required resources in place.

- **Administrators**

  Make sure that admins with the necessary privileges are available to assign licenses and create environments:

  - Microsoft tenant User Administrator to assign Power Apps or Power BI licensing
  - Power Platform Administrator to create environments

  [Learn more about Microsoft Power Platform administration](/power-platform/admin/).

- **Environments**

  - Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment).
  - Make sure that a Power Platform environment is set up with a Dataverse database.
  - Make sure that environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment.

  [Learn more about Power Platform environments](/power-platform/admin/environments-overview).

- **Data loss prevention policies**

  Make sure that the environment has access to connectors used by the template:

  - [Microsoft Dataverse](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook](/connectors/office365/)
  
Learn more about [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention).

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up. You need to set up three new connections for the Parking Reservation app.

It's best to create the connections before you import the solution. If you create the connections during import, you must jump between browser windows.

To create connections in advance, take these steps:

1. Sign in to [Power Apps](https://make.preview.powerapps.com).
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:

    - [Dataverse](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365/)

Learn how to [manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections).

## Step 3: Install solution files

You have two options for installing the Parking Reservation solution:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.
- [Download a managed or unmanaged version of the solution files and manually import them into your environment](#download-and-manually-install-solution-files).

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Appointment Booking template.

### Install from AppSource

AppSource is a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [Parking Reservation template](<https://aka.ms/AccessParkingReservationTemplate>) in AppSource and select **Get it now**.
1. In the *Install Parking Reservation Template* window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select the developer environment that you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. Agree to the *Terms and Privacy Statements* when prompted.
1. Select **Install**.

[Learn more about AppSource](https://appsource.microsoft.com/en-US/).

### Download and manually install solution files

1. Download the following Managed *or* Unmanaged solution files:

    - Managed
      - [mpa_ParkingReservation_managed.zip](https://aka.ms/ParkingReservationManagedSolution)
    - Unmanaged
      - [mpa_ParkingReservation_unmanaged.zip](https://aka.ms/ParkingReservationUnManagedSolution)

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. In the left pane, select **Solutions**.
1. Select **Import solution**,and then find and select the **managed** or **unmanaged version** of the `mpa_ParkingReservation` file downloaded.
1. Select **Next**, and then select **Import**.
1. For each of the connections listed, select the connection that was created in the import steps.
1. Select **Next**.
1. Skip the the environment variable setup for now. The required URL values only become available after the apps are imported into the environment.
1. Select **Import** to start importing the *Parking Reservation* solution. The import process takes a few minutes and once it's complete you're notified with a *Success* message.

[Learn more about solutions](/power-platform/alm/solution-concepts-alm).

## Step 4: Assign security roles

Set up security roles in your solutions so admins can manage access, language support, and experiences in the app.

The Parking Reservation solution contains three security roles:

- **Parking Reservation App – Admin** acts as the administrator of the Parking Reservation App. This security role grants access to the canvas app and model-driven app where an admin can:

  - Create and manage countries, cities, buildings, (building) floors, and parking spots.
  - Create and manage advance booking policy and cancellation policy for each facility (building).
  - View and manage reservations.
  - View and manage users.

- **Parking Reservation App – Admin Read-Only** acts as the administrator of the Parking Reservation App. This security role grants access to the canvas app and model-driven app where an admin can:

  - View and inspect parking spot setup such as countries, city, building, (building) floors, spot types.
  - View and inspect parking reservations.

- **Parking Reservation App – User** can access the canvas application to make parking reservations in the application.

All licensed users, whether they're members of a security group, must have a security role assigned. If users don't have a security role, they get a *data access denied* error when they try to run the app. Users can't access environments until they're assigned at least one security role for that environment. Take these steps to set up security roles in the Power Platform admin center.

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

## Step 5: Share the apps

Share the Parking Reservations app with the users in your organization.

> [!TIP]
>
> Share the app with the Parking Reservations program managers first so that they can configure the app to meet your organization's needs. After that configuration is complete, share the app to the wider organization.

1. Go to [Power Apps](https://make.powerapps.com/) and select the environment that contains the solution.

1. Select **Solutions** on the left pane.

1. Select **Meeting Room Services** from the list.

1. Select **Apps** on the left pane.

1. Select the **Parking Reservations canvas app** in the list and select **More actions** (**&hellip;**).

1. Select **Share**.

1. Search for and add the users who you want to share the app with.

    - For users who should have access to edit the app, check the **Co-owner** box.
    - For regular users of the app, leave that checkbox empty.
    - If everyone in the organization should be able to use the app, select **Everyone** in the *Enter a name* box.
1. In the *Data permission* area, you can select roles from a drop-down list. It's next to the Microsoft Dataverse tables that the Meeting Room Services app uses.
1. Add an optional email message.
1. Select **Share**.

:::image type="content" source="media/install/share-app.png" alt-text="Screenshot of sharing the Parking Reservation app with users.":::

[Learn how to share a canvas app with your organization.](/power-apps/maker/canvas-apps/share-app)

> [!NOTE]
> If the Parking Reservations app isn't shared with you and you can't access it directly in Power Apps, contact your administrator.

## Step 7: Turn on auditing (optional)

Auditing isn't required, but we recommend turning it on so that it's easy to see who creates and updates records in the future.

1. Go to Power Platform admin center
1. Select **Environment** and then select the environment where the solution is installed.
1. Select **Audit settings**.
1. Select **Start auditing**.

## Support

Enterprise templates for Power Platform are published _as is_. However, we do provide template support to help you be successful.

Support can be accessed at [Templates for Power Platform](https://github.com/microsoft/Templates-for-Power-Platform) on GitHub. It's a dedicated support space for you to:

- log questions
- access template assets
- access template release updates
- access template support resources

## Next step

[Manage the Parking Reservations app](manage.md)