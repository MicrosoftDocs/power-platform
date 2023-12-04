---
title: Install and set up the Awards and Recognition template for Power Platform
description: Learn how to install, set up, and deploy the Awards and Recognition template for Microsoft Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/29/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up the Awards and Recognition template

Enterprise templates for Power Platform are enterprise-ready solutions that are designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security](/power-platform/guidance/adoption/admin-best-practices) practices.

Establish a centralized team that consists of key stakeholders, product owners, and Power Platform administrators and developers. Be sure to review Power Platform best-practices and administration resource links and to develop plans that suit your organization's needs.

More information: [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology), [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation), [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up the Awards and Recognition template.

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

It's important to have a cohesive environment and data policy strategy for enterprise templates. To successfully install and manage the Awards and Recognition template, confirm these resources and practices are in place.

- **Administrators** - Be sure admins with the necessary privileges are available to coordinate to assign licensing and create environments.

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licensing
  - Power Platform Administrator to create environments
  
  More information: [Microsoft Power Platform admin](/power-platform/admin/)

- **Environments** - Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Also consider:

  - A Power Platform environment is set up with a Dataverse database
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment

  More information: [Environments overview](/power-platform/admin/environments-overview)

- **Data loss prevention policies** - Ensure the environment has access to the Dataverse connector used by the template.

    More information: [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires a Microsoft Dataverse connection. It's best to create connections before you install the template to avoid having to jump back and forth between browser windows.

Create a new connection with the [Microsoft Dataverse connector](/connectors/commondataserviceforapps/).

To create connections in advance, take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** for the *Microsoft Dataverse connector* and create a connection.

More information: [Manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 3: Install solution files

There are two solution installation options available for you to consider:

- You can select the *Get it now* button on the template's AppSource offer page and it automatically takes you to an *install window* in the Power Platform admin center.
- You can download either a *managed* or an *unmanaged* version of the solution files and manually import them into your environment according to your organization's requirements.

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Awards and Recognition template.

### Install from AppSource

You can easily access and install the Awards and Recognition template from AppSource, a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [Awards and Recognition solution template on AppSource](https://aka.ms/AccessAwardsandRecognitionTemplate) and select **Get it now**. This takes you to the *Install Awards and Recognition Template* window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
:::image type="content" source="media/install/ar-install-env.png" alt-text="AScreenshot of the modal dialog window where you select the environment you set up for the template.":::
1. Select the environment that you prepared for the template.
1. Agree to the *Terms and Privacy* statements by checking the boxes.
1. Select **Install**. You're taken to a screen where you can view the installation status. Once the installation is complete, the status shows as *Installed*.

> [!IMPORTANT]
> Two solutions are always installed in your environment:
>
> - **Employee Experience Base**. Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
> - **Awards and Recognition**. Contains all the components needed to set up the Awards and Recognition program within an organization.

### Download and manually install solution files

You also have the option to download *managed* or *unmanaged* solution files to manually install into your prepared environment according to your organization's requirements:

1. Download the following managed or unmanaged solution files:

    - Managed
      - [mpa_EmployeeExperienceBase_managed.zip](https://aka.ms/EEBaseManagedSolution)
      - [mpa_AwardsAndRecognition_managed.zip](https://aka.ms/HardwareRequestAndManagementManagedSolution)
    - Unmanaged
      - [mpa_EmployeeExperienceBase_unmanaged.zip](https://aka.ms/EEBaseUnmanagedSolution)
      - [mpa_AwardsAndRecognition_unmanaged.zip](https://aka.ms/AwardsAndRecognitionUnmanagedSolution)

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared for the solution.
1. Select **Solutions** on the left pane.
1. Select **Import solution**.
1. Browse for and select either the **managed** or **unmanaged version** of the *mpa_ITBase* file downloaded in previous step.
1. Select **Next**.
1. Select **Import**. This starts the import process of the *Employee Experience Base* solution.
1. Select **Import** to start the import process of the *Employee Experience Base* solution. Once the import is complete, you're notified with a *Success* message.
1. Browse for and select either the **managed** or **unmanaged** version of the *mpa_AwardsAndRecognition* file downloaded in previous step.
1. Select **Next** and **Next** again.
1. For each of the connections listed, select the *existing connection that was created in the previous step*.
1. Select **Next**.
1. Ignore entering values for the environment variables as that will be completed in an additional step later. Since the apps have not been imported into the environment yet, we are unable to capture what their URL values are at the moment.
1. Select **Import** to start the import process of the *Awards and Recognition* solution. Once the import is complete, you're notified with a *Success* message.

More information: [Solution concepts](/power-platform/alm/solution-concepts-alm)

## Step 4: Assign security roles

Set up security roles in your solutions so admins can manage access to and the experiences in the app. Take these steps to get started:

1. Go to [**Power Platform admin center**](https://admin.powerplatform.microsoft.com/home).
1. Select **Environment** and then select the environment where the solution was installed.
1. Select **Users**, then select **See all**.
1. Choose the users who will be using the app and then select **Manage security roles** to assign *Basic User* and any other appropriate roles to each user.
1. Select **Save**.

### Awards and Recognition

**Program Admin**: Assign the admin role to people who will be configuring award programs and reviewing and finalizing nominations.

- Program admins can see and update all the data
- Admins can configure awards, award assessment ratings, nomination periods, groups, and group membership
- Admins can approve, reject, withdraw, or cancelling nominations
- Admins can create, update, or delete language localization data

**User**: Assign the user role to *everyone* who will potentially nominate others for awards.

- Users can nominate people and see their own data
- Users can read the localized data

### Employee Experiences Base

**Localizer**: You can grant the localizer role independently of the Awards and Recognition security roles so someone can create localized text strings without the ability to administer the awards program.

- Localizers can create localized text strings
- Localizers can nominate people and see their own data

> [!IMPORTANT]
> All users must be assigned the *Basic User* role in addition to any other roles assigned to them.

## Step 5: Set cloud flows to *on*

Open the newly installed Awards and Recognition solution and verify that the cloud flow is set to the *on* status. If not, turn it on.

1. Select **Solutions** on left pane.
1. Select the **Awards and Recognition** solution from the list.
1. Select **Cloud flows (1)** on the left pane.
1. Select the *flow*.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

## Step 6: Share the app

Once the app admin configurations are complete you are ready to share the app with people in your organization. First share the app with the Awards and Recognition program manager(s) and then with the wider organization once the program manager's setup is complete.

### Share the app with the program manager

Set the Awards and Recognition program manager up first so they can configure awards, award assessment ratings, nomination periods, groups, and group memberships. Take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** on the left pane and select the **Awards and Recognition** solution from the list.
1. Select **Apps**.
1. Go to the *Awards and Recognition app* in the list and select the **three dots** to the right to see a list of actions.
1. Select **Share**.
1. Search for and add the user who is the Awards and Recognition program manager.
1. Check the **Co-owner** checkbox so the program manager has *edit* access to the app.
1. Select **roles** from a drop-down list in the *Data permission* area. It's next to the *Microsoft Dataverse tables* that the Awards and Recognition app uses. Be sure to assign these two roles:
    1. Select **Basic User**
    1. Select **Awards and Recognition - Program Admin**
1. Add an email message to let the program manager know the app program is ready to be set up.
1. Select **Share**.

### Share the app with the program participants

When the program manager is done configuring the Awards and Recognition program for your organization, it is ready to be deployed to the program participants in your organization. Take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** on the left pane and select the **Awards and Recognition** solution from the list.
1. Select **Apps**.
1. Go to the *Awards and Recognition canvas app* in the list and select the **three dots** to the right to see a list of actions.
1. Select **Share**.
1. Search for and add the users you want to share the app with. Select **Everyone** from the *Enter a name* field's drop-down if everyone in the organization should be able to use the app.
1. Leave the *Co-owner* checkbox empty for regular users of the app. Check the **Co-owner** checkbox for all users who should have *edit* access to the app. There could people in  addition to the program manager who need this access.
1. Select *roles* from a drop-down list in the *Data permission* area. It's next to the *Microsoft Dataverse tables* that the Awards and Recognition app uses. Be sure to assign two roles to each user:

    - Select **Basic User**
    - Select **Awards and Recognition - User**
1. Add an optional email message.
1. Select **Share**.
:::image type="content" source="media/install/share-app.png" alt-text="Screenshot of the window where you add users and co-owners to your app.":::

More information: [Share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

> [!NOTE]
>If Awards and Recognition apps aren't shared with you and you cannot access them directly from Power Apps, please contact your admin.

## Step 7: Turn on auditing (optional)

While this isn't required, we recommend enabling the audit setting on the system, so it's easy to see who created and updated records in the future. To do this:

1. Go to [**Power Platform admin center**](https://admin.powerplatform.microsoft.com/home).
1. Select **Environment** on the left pane then select the environment that contains the solution.
1. Select **Audit settings**.
1. Select **Start auditing**.

## Next steps

[Manage the Awards and Recognition app](manage.md),
[Use the Awards and Recognition app](use.md)
