---
title: Install and set up the Awards and Recognition template for Power Platform
description: Learn how to install, set up, and deploy the Awards and Recognition template for Microsoft Power Platform.
author: tverhasselt
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 08/27/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Install and set up the Awards and Recognition template

Enterprise templates for Power Platform are enterprise-ready solutions designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security](/power-platform/guidance/adoption/admin-best-practices) practices.

Establish a centralized team that consists of key stakeholders, product owners, and Power Platform administrators and developers. Be sure to review Power Platform best practices and administration resource links and to develop plans that suit your organization's needs.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up an Awards and Recognition program that suits your organization.

## Step 1: Review prerequisites

Review the requirements, identify opportunities, and develop a plan of action that suits your organization's needs.

### Confirm licensing

Confirm your organization has the necessary licensing to use enterprise templates. You need a Power Apps plan:

- Power Apps Premium
- Power Apps per app
- Power Apps per app pay-as-you-go-meter
- Power Apps use rights included with Dynamics 365 licenses

If your organization is deploying the Awards and Recognition Copilot, you also need:

- Microsoft Copilot Studio (free for your makers)
- Microsoft Copilot Studio message capacity
- Power Automate Premium or per flow plan

More license details are available in the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### Set up environments and data policies

It's important to have a cohesive environment and data policy strategy for enterprise templates. To successfully install and manage the Awards and Recognition template, confirm these resources and practices are in place.

- **Administrators**: Be sure admins with the necessary privileges are available to coordinate to assign licensing and create environments.

  - Microsoft Tenant User Administrator to assign Power Apps, Microsoft Copilot Studio, or Power Automate licensing
  - Power Platform Administrator to create environments
  
  More information: [Microsoft Power Platform admin](/power-platform/admin/)

- **Environments**: Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Also consider:

  - A Power Platform environment is set up with a Dataverse database
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment

  More information: [Environments overview](/power-platform/admin/environments-overview)

- **Data loss prevention policies** - Ensure the environment has access to the [Dataverse connector](/connectors/commondataserviceforapps/) used by the template.

    More information: [Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention)

- **Environment capacity** - Allocate Microsoft Copilot Studio message capacity in the production environments where copilot is deployed. This is required for Awards and Recognition Copilot. Take these steps:

    1. Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
    1. Expand **Resources** and select **Capacity**.
    1. Select **Add-ons**.
    1. Select **Assign to an environment**.
    1. Search for the environment where the Awards and Recognition Copilot solution is to be deployed.
    1. Allocate **Microsoft Copilot Studio messages** to the environment.

More information: [Microsoft Copilot Studio messages and capacity](/microsoft-copilot-studio/requirements-messages-management)

- **Copilot for Program Admin users** (optional) - Copilot for model-driven apps in Power Apps is the next-generation AI assistant for app admins to get insights about the data through conversation in natural language. As an Awards and Recognition Program Admin, you can leverage Copilot within the administrator Power App to help you get insights on data. As a Power Platform admin, take these steps to [enable Copilot](/power-apps/maker/model-driven-apps/add-ai-copilot#enable-copilot-for-model-driven-apps-feature-for-your-environment) and [manage behavior settings](/power-platform/admin/settings-behavior) for all users in the selected environment:

    1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home)
    1. Select **Environments** on the left pane and then select the environment where you want to enable Copilot for model-driven app users.
    1. Select **Settings**.
    1. Expand the **Product** section and select **Features** to turn on Copilot.
    1. In the *Copilot* section, set the value for *Allow users to analyze data using an AI-powered chat experience in canvas and model-driven apps* to **On**.
    1. Select **Save**.
    1. Next, go back to **Settings**.
    1. Expand the **Product** section and select **Behavior** to manage behavior settings.
    1. In the *Release channel* section, select **Monthly channel** from the dropdown.
    1. Select **Save**.

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be manually set up.

The installation requires a Microsoft Dataverse connection. It's best to create connections before you install the template to avoid jumping back and forth between browser windows.

Create a new connection with the [Microsoft Dataverse connector](/connectors/commondataserviceforapps/).

To create connections in advance, take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/)
1. Go to **Connections** and select **+ New Connection** for the *Microsoft Dataverse connector* and create a connection.

More information: [Manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections)

## Step 3: Install solution files

There are two solution installation options available for you to consider:

- Select the *Get it now* button on the template's AppSource offer page and it automatically takes you to an *install window* in the Power Platform admin center.
- Download either a *managed* or an *unmanaged* version of the solution files and manually import them into your environment according to your organization's requirements.

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Awards and Recognition template.

### Install from AppSource

You can easily access and install Awards and Recognition templates from AppSource, a Microsoft digital storefront. You have the option to install the Awards and Recognition App template or the Awards and Recognition Copilot template. You can also install both templates to incorporate both experiences. Take these steps to go through the AppSource install process:

1. Go to one of the Awards and Recognition AppSource offerings:
    - [Awards and Recognition App template on AppSource](https://aka.ms/AccessAwardsandRecognitionTemplate)
    - [Awards and Recognition Copilot template on AppSource](https://go.microsoft.com/fwlink/?linkid=2281726)
1. Select **Get it now**. This takes you to the *Install Awards and Recognition Template* window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

    :::image type="content" source="media/install/ar-install-env.png" alt-text="AScreenshot of the modal dialog window where you select the environment you set up for the template.":::

1. Select the environment that you prepared for the template.
1. Agree to the *Terms and Privacy* statements by ticking the checkboxes.
1. Select **Install**. You're taken to a screen where you can view the installation status. Once the installation is complete, the status shows as *Installed*.

### Download and manually install solution files

You also have the option to download *managed* or *unmanaged* solution files to manually install into your prepared environment according to your organization's requirements.

- Managed
  - [mpa_AwardsRecognitionBase](https://go.microsoft.com/fwlink/?linkid=2282103)
  - [mpa_AwardsRecognitionApp](https://aka.ms/AwardsAndRecognitionManagedSolution)
  - [map_AwardsRecognitionCopilot](https://go.microsoft.com/fwlink/?linkid=2281725)
- Unmanaged
  - [mpa_AwardsRecognitionBase](https://go.microsoft.com/fwlink/?linkid=2281581)
  - [mpa_AwardsRecognitionApp](https://aka.ms/AwardsAndRecognitionUnmanagedSolution)
  - [mpa_AwardsRecognitionCopilot](https://go.microsoft.com/fwlink/?linkid=2281640)

Take these steps to manually install solution files:

1. Download either the managed or unmanaged Awards and Recognition solution files you intend to use. The Base solution must be included with the App or Copilot templates.
1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared for the solution.
1. Select **Solutions**.
1. Select **Import solution**.
1. Select the managed or unmanaged version of the **mpa_AwardsRecognitionBase** file previously downloaded.
1. Select **Next**.
1. Review *Details* and confirm **Enable Plugin steps and flows included in the solutions** remains checked, and then select **Next**.
1. For the connection listed, select the existing connection previously created. If you did not create the connection in advance, create it now.
1. Select **Import** to start the import process of the *Awards and Recognition Base* solution. Once the import is complete, you're notified with a *Success* message.

If you are installing the Awards and Recognition App template, continue with these steps:

1. Select **Import solution**.
1. Select the managed or unmanaged version of the **mpa_AwardsRecognitionApp** file previously downloaded.
1. Select **Next**.
1. Review *Details* and confirm **Enable Plugin steps and flows included in the solutions** remains checked, and then select **Next**.
1. Select **Import** to start the import process of the *Awards and Recognition App* solution. Once the import is complete, you're notified with a *Success* message.

If you are installing the Awards and Recognition Copilot, continue with these steps:

1. Select **Import solution**.
1. Select the managed or unmanaged version of the **mpa_AwardsRecognitionCopilot** file previously downloaded.
1. Select **Next**.
1. Review *Details* and confirm **Enable Plugin steps and flows included in the solutions** remains checked, and then select **Next**.
1. For the connection listed, select the existing connection previously created. If you did not create the connection in advance, create it now.
1. Select **Import** to start the import process of the *Awards and Recognition Copilot* solution. Once the import is complete, you're notified with a *Success* message.

More information: [Solution concepts](/power-platform/alm/solution-concepts-alm)

## Step 4: Assign security roles

Set up security roles in your solutions so admins can manage access to and the experiences in the app. There are two security roles:

- **Awards and Recognition - Program Admin** configures award programs and reviews and finalizes nominations. Assign this role to people who need to:

  - See and update all the data
  - Configure awards, award assessment ratings, nomination periods, groups, and group membership
  - Approve, reject, withdraw, or cancel nominations
  - Create, update, or delete language localization data

- **Awards and Recognition - User** potentially nominates others for awards.Assign this role to admins and basic users so they can nominate people and see their own data.

> [!IMPORTANT]
> All users must be assigned the basic **User** role in addition to any other roles assigned to them.

Take these steps to assign roles:

1. Go to [**Power Platform admin center**](https://admin.powerplatform.microsoft.com/home).
1. Select **Environment** and then select the environment where the solution was installed.
1. Select **Users**, then select **See all**.
1. Choose the users who will be using the app and then select **Manage security roles** to assign *Basic User* and any other appropriate roles to each user.
1. Select **Save**.

> [!TIP]
> For large organization, create a Microsoft Entra security group containing all targeted users for the Awards and Recognition program and associate it to a new Microsoft Entra ID Security Dataverse Team created via the Power Platform admin center, then assign the **Awards@Recognition-User** role to this Dataverse team.

## Step 5: Turn on cloud flows

Open the newly installed Awards and Recognition Base solution and verify that the cloud flow is set to the *on* status. If not, turn it on.

1. Select **Solutions** on left pane.
1. Select the **Awards and Recognition Base** solution from the list.
1. Select **Cloud flows (1)** on the left pane.
1. Select the *flow*.
1. Select **Turn on** on the command bar if the flow is not already set to *on*.

If you installed the Awards & Recognition Copilot, open the Awards & Recognition Copilot solution and verify that the three cloud flows are set to the **on** status. If they aren't, turn them on following previously detailed steps.

## Step 6: Set up the program

Once the app admin configurations are complete, the next step is to set up the program details before you are ready to share the app with people in your organization. Your program manager(s) will already have access to the administration app when you complete the previous step to assign security roles.
The Awards & Recognition program manager will need to configure awards, award assessment ratings and nomination periods. If your organization has pre-defined groups or teams, the program manager can also create groups and assign group memberships. Take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Apps**, then select **Play** on the Awards & Recognition Administration App from the list.
1. Use the left pane navigation to browse the different Awards & Recognition program data.
1. Create Nomination Periods, Awards, Award Assessment Ratings, Groups and Group Members as needed.

[Learn how to manage the Awards and Recognition App](manage.md)

## Step 7: Share the app (required for app template)

When the program manager is done configuring the Awards & Recognition program for your organization, it's ready to be deployed to the program participants in your organization. Take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** and select the **Awards and Recognition App** solution from the list.
1. Select **Apps**.
1. Go to the *Awards and Recognition App* canvas app in the list and select the **three dots** to the right to see a list of actions.
1. Select **Share**.
1. Search for and add the users or security group you want to share the app with. If you have one or more security groups, you can share the app with those select groups. If everyone in the organization needs to be an app user, select **Everyone** in the *Enter a name* box.

    - Check the **Co-owner** checkbox for program managers who need to edit the app.
    - Leave the checkbox empty for basic users of the app.

1. Select **roles** from a drop-down list in the *Data permission* area. It's next to the *Microsoft Dataverse tables* that the Awards and Recognition App uses. For each user, select these two roles:
    - **Basic User**
    - **Awards and Recognition - User**
1. Add an optional email message.
1. Select **Share**.

[Learn how to share a canvas app with your organization](/power-apps/maker/canvas-apps/share-app)

> [!NOTE]
>If Awards and Recognition apps aren't shared with you and you cannot access them directly from Power Apps, please contact your admin.

## Step 8: Deploy Copilot (required if installing copilot template)

Take these steps to share the AI prompt:

1. Go to [Power Apps](https://make.preview.powerapps.com/).
1. Select the environment that contains the Awards and Recognition solution.
1. Select **AI Hub** from the left pane. If AI Hub is not visible, select **More** to see additional options.
1. On the **Award Writer** AI prompt, select **More** > **Share**.
1. Enter the individual users and security groups who need access to Awards and Recognition Copilot.
1. Select **Share**.

Take these steps to publish to Teams:

1. Go to [Microsoft Copilot Studio](https://copilotstudio.microsoft.com/).
1. Select the environment that contains the Awards and Recognition Copilot solution.
1. Select **Copilots** to review a list of copilots in the environment.
1. Open **Awards and Recognition Copilot**.
1. Select **Publish** to publish the current copilot configuration so it can be deployed to channels.
1. Select **Channels** and then select **Microsoft Teams**.
1. Select **Turn on Teams** to add the Microsoft Teams channel.
1. Select **Edit details**. Review the information and make any desired changes to the icon, descriptions and developer information for the Awards & Recognition Copilot. When finished, select **Save**.
1. Select **Availability options**. The Awards & Recognition Copilot can be shared in several ways, including sharing via link, deploying to the Teams app store, or distributing as a custom app file. Choose your deployment method.
1. If deploying to the Teams app store, you must also decide how broadly to share the Awards and Recognition Copilot.

    1. Select **Show to everyone in my org** to deploy the Awards and Recognition Copilot to everyone in your organization. This will submit the copilot in the Microsoft Teams admin center for approval by Global Administrators and Teams Administrators. After approval, it will appear in the *Built for my org* area of the Teams app catalog.
    1. Select **Show to my teammates and shared users** to deploy the Awards & Recognition Copilot to a more limited audience. Here, you can select both security groups and individual users. When finished with selections, select **Share** to save changes to the copilot permissions.

> [!NOTE]
> Awards & Recognition Copilot is designed for a Microsoft Teams experience and the default authentication has been configured to *Authenticate with Microsoft*. [Learn more about adding user authentication to topics](/microsoft-copilot-studio/advanced-end-user-authentication?tabs=web).

More information:

- [Manage your apps in the Microsoft Teams admin center](/microsoftteams/manage-apps)
- [Add a copilot to Microsoft Teams](/microsoft-copilot-studio/publication-add-bot-to-microsoft-teams)

## Step 9: Turn on auditing (optional)

While this isn't required, we recommend enabling the audit setting on the system, so it's easy to see who created and updated records in the future. To do this:

1. Go to [**Power Platform admin center**](https://admin.powerplatform.microsoft.com/home).
1. Select **Environment** on the left pane then select the environment that contains the solution.
1. Select **Audit settings**.
1. Select **Start auditing**.

### Next step

[Manage the Awards and Recognition app](manage.md)
