---
title: Install and configure the Appointment Booking template for Power Platform
description: Learn how to install and configure the Appointment Booking template for Power Platform.
author: tverhasselt
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/07/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and configure the Appointment Booking template

As a Power Platform admin, you install, configure, and deploy the Appointment Booking template's solutions for your organization.

To get started, follow the steps.

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

### Create environments and data policies

It's important to have a cohesive environment and data policy strategy for enterprise templates. To successfully install and manage the Appointment Booking template, confirm these resources and practices are in place.

- **Administrators** - Be sure admins with the necessary privileges are available to coordinate and assign licensing and create environments.

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licensing
  - Power Platform Administrator to create environments if needed

  More information: [Microsoft Power Platform admin](/power-platform/admin/)

- **Environments** - Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Also consider:

  - A Power Platform environment with a Dataverse database installed is set up
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment

  More information: [Environments overview](/power-platform/admin/environments-overview)

- **Data loss prevention policies** - Ensure the environment has access to the Microsoft connectors used by the Appointment Booking template:

  - [Dataverse](/connectors/commondataserviceforapps/)
  - [Office 365 Outlook](/connectors/office365/)
  - [Teams](/connectors/teams/)

  More information: [Environment overview](/power-platform/admin/environments-overview)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires you to set up four new connections for the Appointment Booking app. It's best to create the connections before importing the solution to make the import smoother. If you create the connections during import, you have to jump back and forth between browser windows.

To create the connections in advance, take these steps:

1. Go to [Power Apps maker portal](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these Microsoft connectors:

    - [Dataverse](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365/)
    - [Teams](/connectors/teams/)

   More information: [Manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 3: Install solution files

There are two solution installation options available for you to consider:

- You can select the *Get it now* button on the template's AppSource offer page and it automatically takes you to an *install window* in the Power Platform admin center.
- You can download either a *managed* or an *unmanaged* version of the solution files and manually import them into your environment according to your organization's requirements.

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Appointment Booking template.

### Install from AppSource

You can access and install the Appointment Booking template from AppSource, a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [Appointment Booking template](<https://appsource.microsoft.com/product/dynamics-365/powerplatformtemplates.mpa-onboardingbuddy?exp=ubp8&tab=Overview>) in AppSource and select **Get it now**.
1. Select the developer environment that you prepared for the template.
1. Agree to the *Terms and Privacy* statements by checking the boxes.
1. Select **Install**. You're taken to a screen where you can view the installation status. Once the installation is complete, the status shows as *Installed*.

> [!IMPORTANT]
> Two solutions are always installed in your environment:
>
> - **IT Base**. Contains components that enable localization capabilities. By sharing the components across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
> - **Appointment Booking**. Contains all the necessary components to enable the implementation of the Appointment Booking program within an organization.

### Download and manually install solution files

You also have the option to download *managed* or *unmanaged* solution files to manually install into your prepared environment according to your organization's requirements:

1. Download the following managed or unmanaged solution files:

    - Managed
      - [mpa_ITBase_managed.zip](https://aka.ms/ITBaseManagedSolution)
      - [mpa_AppointmentBooking_managed.zip](https://aka.ms/AppointmentBookingManagedSolution)
    - Unmanaged
      - [mpa_ITBase_unmanaged.zip](https://aka.ms/ITBaseUnManagedSolution)
      - [mpa_AppointmentBooking_unmanaged.zip](https://aka.ms/AppointmentBookingUnmanagedSolution)

1. Go to [Power Apps maker portal](https://make.preview.powerapps.com/) and select the environment you prepared for the solution.
1. Select **Solutions** on the left-side panel.
1. Select **Import solution**.
1. Browse for and select either the **managed** or **unmanaged version** of the *mpa_ITBase* file downloaded in previous step.
1. Select **Next**.
1. Select **Import** to start the import process of the *IT Base* solution. Once the import is complete, you're notified with a *Success* message.
1. Browse for and select either the **managed** or **unmanaged** version of the *mpa_Appointment Booking* file downloaded in previous step.
1. Select **Next** and **Next** again.
1. For each of the connections listed, select the *existing connection that was created in the previous step*.
1. Select **Next**.
1. Skip the environment variable setup for now because the required URL values only become available after the apps are imported into the environment.
1. Select **Import** to start the import process of the *Appointment Booking* solution. Once the import is complete, you're notified with a *Success* message.

More information: [Solution concepts](/power-platform/alm/solution-concepts-alm)

## Step 4: Create shared calendar

As an Outlook admin, take these steps to create a shared Outlook calendar and set users up as Meeting Providers:

1. Open your organization's Outlook app.
1. Go to the **calendar icon** on the left-side panel.
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

## Step 5: Update environment variable

Environment variables support your application lifecycle management (ALM) strategy as you migrate the template across environments. Environment variables store keys and values for information that is contextual to the environment the solution is in. Take these steps to update an environment variable for the Appointment Booking solution in Power Apps.

1. Go to Go to Power Apps maker portal and select the environment that contains the Appointment Booking solution.
1. Select the Appointment Booking solution.
1. Go to **Environment Variable**.
1. Select the *Shared Calendar Name* or select the three dots and select **Edit**.
1. On Default Value, enter the shared calendar name created in Outlook.
1. Select **Save**.

## Step 6: Assign security roles

Set up security roles in your solutions so admins can manage access to and the experiences in the app.

The solution includes two security roles:

- **Appointment Booking – Administrator** - Users in this role act as the administrator of the Appointment Booking app. Assign this role to users who manage shared calendars in your organization through the canvas app. This security role grants access to the canvas app and model-driven app where an admin can:
  - View all appointment data
  - Create new Appointment Types, Locations, Room Numbers
  - Delete appointment data

- **Appointment Booking – User** - This security role grants access to the canvas app, where users can see their own appointment slots and bookings.

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

## Step 7: Set cloud flows to *on*

Open the newly installed Appointment Booking solutions and verify that the cloud flows are set to the *on* status. If not, turn the status to *on*.

1. Select **Solutions** on left-side panel.
1. Select the **Appointment Booking** solution from the list.
1. Select **Cloud flows** on the left-side panel.
1. Select *each cloud flow* to verify that it is turned on.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

## Step 8: Share the apps

Take the following steps to share the apps with your users:

1. Go to [Power Apps maker portal](https://make.preview.powerapps.com/) and select the environment you installed the solution in.

1. Select **Solutions** and select the **Appointment Booking** solution.

1. Select **Apps**.

1. Select the **Appointment Booking app** row and then the **ellipsis** (3 vertical dots).

1. Select **Share**.

1. Search for and add the users you want to share the app with.
    - For users who should be able to edit the app, select the **Co-owner** box.
    - For regular users of the app, leave that checkbox empty.
    - If everyone in the organization should be able to use the app, select **Everyone** in the *Enter a name* box.
1. In the *Data permission* area, you can select roles from a dropdown list. It's next to the Microsoft Dataverse tables that the Appointment Booking app uses. Be sure to select the correct Appointment Booking role (Administrator or User) for each user.
1. Add an optional email message.
1. Select **Share**.

> [!NOTE]
>If you didn't install the Appointment Booking solution and it isn't shared with you, go to the Appointment Booking solution in the [Power Apps maker portal](https://make.preview.powerapps.com/) to find the app.

More information: [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

## Step 9: Enable Copilot

Microsoft Copilot for model-driven apps in Power Apps is a next-generation AI assistant for app users to get insights about the data in their apps through conversation in natural language. As an Appointment Booking admin, you can leverage Copilot to help you get insights on appointment booking data while taking action. Follow these steps to turn Copilot on within your environment:

1. [Go to Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Environments** on the left-side panel and then select the environment where the solution was installed.
1. Ensure the environment *Release Channel* is set to **Monthly** channel following the [Changing release channels for model-driven apps guidance](/power-apps/maker/model-driven-apps/channel-change).
1. Select **Settings**.
1. Expand the *Product* section and select **Features**.
1. Underneath the Copilot section, change the *Allow users to analyze data using an AI-powered chat experience in canvas and model-driven apps* to **On**.

More information: [Add Copilot to model-driven apps](/power-apps/maker/model-driven-apps/add-ai-copilot)

## Step 10: Turn on Auditing

While this isn't required, we recommend enabling the audit setting on the system, so it's easy to see who created/updated records in the future.

Take these steps to enable the audit settings:

1. Go to [Power Platform admin center](https://gcc.admin.powerplatform.microsoft.us/home).
1. Select **Environments** on the left-side menu and select the *environment* where the solution is installed.
1. Select **Settings**.
1. Select **Start Auditing**.
