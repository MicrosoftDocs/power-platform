---
title: Install and set up the Appointment Booking template
description: Learn how to install, set up, and deploy the Appointment Booking template for Microsoft Power Platform.
author: tverhasselt
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 07/02/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
ms.collection: bap-ai-copilot
---

# Install and set up Appointment Booking template

Enterprise templates for Power Platform are enterprise-ready solutions that are designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security](/power-platform/guidance/adoption/admin-best-practices) practices.

Establish a centralized team of key stakeholders, product owners, developers, and Power Platform administrators. Be sure to review Power Platform best practices and administration resource links and develop plans that suit your organization's needs.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up the Appointment Booking template.

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

It's important to have a cohesive environment and data policy strategy for enterprise templates. To successfully install and manage the Appointment Booking template, confirm these resources and practices are in place.

- **Administrators**: Be sure admins with the necessary privileges are available to coordinate and assign licensing and create environments.

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licensing.
  - Power Platform Administrator to create environments.

  More information: [Microsoft Power Platform admin](/power-platform/admin/)

- **Environments**: Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Create and prepare a Power Platform developer environment specifically for the Appointment Booking solution files. Also consider:

  - The Power Platform environment is set up with a Dataverse database.
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment.

  More information: [Environments overview](/power-platform/admin/environments-overview)

- **Data loss prevention policies**: Ensure the environment has access to the Microsoft connectors used by the Appointment Booking template:

  - [Dataverse](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook](/connectors/office365/)
  - [Teams](/connectors/teams/)

More information: [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires you to set up four new connections for the Appointment Booking app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

To create the connections in advance, take these steps:

1. Sign in to [Power Apps](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these Microsoft connectors:

    - [Dataverse](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365/)
    - [Teams](/connectors/teams/)

  [Learn how to manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections).

## Step 3: Install solution files

You have two options for installing the Appointment Booking solution:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.
- [Download a managed or unmanaged version of the solution files and manually import them into your environment](#download-and-manually-install-solution-files).

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Appointment Booking template.

### Install from AppSource

AppSource is a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [Appointment Booking template](<https://aka.ms/AccessAppointmentBookingTemplate>) in AppSource and select **Get it now**.
1. In the *Install Appointment Booking Template* window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select the developer environment that you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. Agree to the *Terms and Privacy Statements* when prompted.
1. Select **Install**.

[Learn more about AppSource](https://appsource.microsoft.com/en-US/)

Two solutions are installed in your environment, **IT Base** and **Appointment Booking**. [Learn more about the Appointment Booking template solutions](./overview.md).

### Download and manually install solution files

Managed and unmanaged solution files are available for you to download and manually install. Take these steps to download and import the solutions directly into the development environment that you prepared for it in the [review prerequisites step](#step-1-review-prerequisites).

1. Download the following Managed *or* Unmanaged solution files:

    - Managed
      - [mpa_ITBase_managed.zip](https://aka.ms/ITBaseManagedSolution)
      - [mpa_AppointmentBooking_managed.zip](https://aka.ms/AppointmentBookingManagedSolution)
    - Unmanaged
      - [mpa_ITBase_unmanaged.zip](https://aka.ms/ITBaseUnManagedSolution)
      - [mpa_AppointmentBooking_unmanaged.zip](https://aka.ms/AppointmentBookingUnManagedSolution)

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. Select **Solutions**.
1. Select **Import solution**,and then find and select the **managed** or **unmanaged version** of the `mpa_ITBase` file downloaded.
1. Select **Next**, and then select **Import**.
1. After you receive a message that the import was successful, repeat steps 4 and 5 to import the `mpa_AppointmentBooking` file you downloaded.
1. Select **Next** and **Next** again.
1. For each of the connections listed, select the connection that was created in the import steps.
1. Select **Next**.
1. Skip the environment variable setup for now. The required URL values only become available after the apps are imported into the environment.
1. Select **Import** to start importing the *Appointment Booking* solution. The import process takes a few minutes and once it's complete you're notified with a *Success* message.

[Learn more about solutions](/power-platform/alm/solution-concepts-alm)

## Step 4: Create shared calendar

As an Outlook admin, take these steps to create a shared Outlook calendar and set users up as Meeting Providers:

1. Open your organization's Outlook app.
1. Go to the **calendar icon** on the left pane.
1. Select **Add calendar**.
1. Select **Create blank calendar**.
1. Enter a name for the new shared calendar.
1. Add the new calendar to **Other calendars**.
:::image type="content" source="media/install/ab-install-cal.png" alt-text="Screenshot of setting up a shared Outlook calendar for appointment bookings.":::
1. Select **Save**.
1. Select **Share**.
1. Search for the email or name of a user who needs to be set up as a Meeting Provider.
1. Select **Can edit** for permission.
1. Select **Save**.
1. Select **Share**.
1. Repeat steps 9-11 until all intended users who need to be set up as Meeting Providers are granted access with edit permissions to the shared calendar.
1. Once all Meeting Providers have been set up, select the **X** to close the dialog box and return to the calendar.

More information: [Create, view, or delete a calendar group](<https://support.microsoft.com/office/create-view-or-delete-a-calendar-group-04fc64f2-b658-450b-8dce-dd27ed660570>)

## Step 5: Update environment variables

Environment variables support your application lifecycle management (ALM) strategy as you migrate the solution across environments. Environment variables store keys and values for information that is contextual to the environment the solution is in. Take these steps to update an environment variable for the Appointment Booking solution in Power Apps.

Additionally, connection references allow makers to configure flows that allow connections to be managed centrally vs. coupled to the flow. This also supports your ALM strategy since you don't need to introduce customizations or solution layers as your flows migrate across environments.

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment that contains the Appointment Booking solution.
1. Select the Appointment Booking solution.
1. Go to **Environment Variable**.
1. Select the *Shared Calendar Name* or select the three dots and select **Edit**.
1. On Default Value, enter the shared calendar name created in Outlook.
1. Select **Save**.

## Step 6: Assign security roles

Set up security roles in your solutions so admins can manage access, language support, and experiences in the app.

There are three security roles:

- **IT Base - IT Base User**: Assign this role to an admin who needs to perform specific admin tasks such as localizing strings and monitoring for errors.

- **Appointment Booking – Admin**: Assign this role to the manager who needs to manage your organization's shared calendars and appointment data. This security role has access to both the Appointment Booking Administrator app and the Appointment Booking app.

- **Appointment Booking – User**: Assign this role to everyone in your organization who needs access to the Appointment Booking canvas app, where appointment slots are managed and appointment bookings are made.

Take these steps to assign roles:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Environments** and select the environment where the solution is installed.  
1. Select **Users** > **See all**.
1. Select the user(s).
1. Select **Manage security roles** and select the appropriate roles for each user.
1. Select **Save**.

> [!NOTE]
> All licensed users, whether or not they are members of the security groups, must be assigned security roles to access data in the environments. You can also assign security roles in the web application. If users don't have a security role, they'll get a *data access denied* error when trying to run an app. Users can't access environments until they're assigned at least one security role for that environment.

More information:

- [Learn how to manage application users in the Power Platform admin center](/power-platform/admin/manage-application-users)
- [Learn how to control user access to environments: security groups and licenses](/power-platform/admin/control-user-access)

## Step 7: Turn on cloud flows

Verify that the cloud flows are turned on in the newly installed Appointment Booking solution. Turn on any flows that are not already set to *on*.

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions**.
1. Select the **Appointment Booking** solution from the list.
1. Select **Cloud flows**.
1. Select *each cloud flow* to verify that it is turned on.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

## Step 8: Share the apps

Take the following steps to share the apps with your users:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** and select the **Appointment Booking** solution from the list.
1. Select **Apps**.
1. Go to the *Appointment Booking canvas app* in the list and select the **three dots** to see a list of actions.
1. Select **Share**.
1. Search for and add the users you want to share the app with.
    - For users who should be able to edit the app, select the **Co-owner** box.
    - For regular users of the app, leave that checkbox empty.
    - For everyone in the organization, select **Everyone** in the *Enter a name* box.
1. In the *Data permission* area, select the roles from a dropdown list. It's next to the Microsoft Dataverse tables that the Appointment Booking app uses. Be sure to select the correct Appointment Booking role (Administrator or User) for each user.
1. Add an email message.
1. Select **Share**.
:::image type="content" source="media/install/share-app.png" alt-text="Screenshot of sharing the appointment booking app with users.":::

> [!NOTE]
>If Appointment Booking apps aren't shared with you and you cannot access them directly from Power Apps, please contact your admin.

More information: [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

## Step 9: Enable Copilot (optional)

Microsoft Copilot for Power Apps model-driven apps is a next-generation AI assistant for app admins to get insights about the data in their apps through conversation in natural language. As an Appointment Booking admin, you can leverage Copilot to help you get insights on appointment booking data. As a Power Platform admin, take these steps to [enable Copilot](/power-apps/maker/model-driven-apps/add-ai-copilot#enable-copilot-for-model-driven-apps-feature-for-your-environment) and [manage behavior settings](/power-platform/admin/settings-behavior) for all users in the selected environment:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Environments** and then select the environment where you want to enable copilot for model-driven app users.
1. Select **Settings**.
1. Expand the **Product** section and select **Features** to turn on Copilot.
1. In the *Copilot* section, set the value for *Allow users to analyze data using an AI-powered chat experience in canvas and model-driven apps* to **On**.
1. Select **Save**.
1. Next, go back to **Settings**.
1. Expand the **Product** section and select **Behavior** to manage behavior settings.
1. In the *Release channel* section, select **Monthly channel** from the dropdown.
1. Select **Save**.
:::image type="content" source="media/install/ppadmin-release-channel.png" alt-text="Screenshot of managing behavior settings in the Release channel section in the Power Platform admin center.":::
More information: [Changing release channels for model-driven apps guidance](/power-apps/maker/model-driven-apps/channel-change).

## Step 10: Turn on Auditing (optional)

We recommend enabling the audit setting on the system, so it's easy to see who creates and updates records.

Take these steps to enable the audit settings:

1. Go to [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home).
1. Select **Environments** and select the *environment* where the solution is installed.
1. Select **Settings**.
1. Select **Start Auditing**.
:::image type="content" source="media/install/start-auditing.png" alt-text="Screenshot of turning on auditing in the Power Platform admin center.":::

### Next step

[Get started managing the appointment bookings](manage.md)
