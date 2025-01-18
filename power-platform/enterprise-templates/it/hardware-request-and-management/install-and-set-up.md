---
title: Install and set up the Hardware Request and Management template for Power Platform
description: Learn how to install, set up, and deploy the Hardware Request and Management template for Microsoft Power Platform.
author: tverhasselt
ms.author: thoverh
contributors:
  - microsoft-george
  - robinsonshields
  - EllenWehrle
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 07/02/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
ms.collection: bap-ai-copilot
---

# Install and set up the Hardware Request and Management template

Enterprise templates for Power Platform are enterprise-ready solutions that are designed to be installed, customized, deployed, and managed by a [centralized team](/power-platform/guidance/adoption/delivery-models#centralized) at your organization to support common [governance and security](/power-platform/guidance/adoption/admin-best-practices) practices.

Establish a centralized team that consists of key stakeholders, product owners, developers, and Power Platform admins. Be sure to review Power Platform best practices and administration resource links and to develop plans that suit your organization's needs.

More information:

- [Power Platform adoption best practices](/power-platform/guidance/adoption/methodology)
- [Administer Microsoft Power Platform](/power-platform/admin/admin-documentation)
- [Working with enterprise systems](/power-apps/guidance/planning/enterprise-systems)

As a Microsoft Power Platform admin, follow the steps outlined in this article to install and set up the Hardware Request and Management template.

## Step 1: Review prerequisites

Review the requirements, identify opportunities, and develop a plan of action that suits your organization's needs.

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
> [Learn more about Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)

> [Learn more about Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)

### Set up environments and data policies

It's important to have a cohesive environment and data policy and to ensure the required resources are in place.

- **Administrators**

  Make sure that admins with the necessary privileges are available to assign licenses and create environments:

  - Microsoft Entra ID Global or tenant User Administrator to assign Power Apps or Power BI licensing.
  - Power Platform Administrator to create environments.

  [Learn more about Microsoft Power Platform administration](/power-platform/admin/)

- **Environments**: Follow [application lifecycle management (ALM)](/power-platform/alm/) best practices in [creating and managing environments](/power-platform/admin/create-environment). Create and prepare a Power Platform developer environment specifically for the Hardware Request and Management solution files. Also consider:

  - The Power Platform environment is set up with a Dataverse database.
  - Environment maker security role privileges, at a minimum, are assigned to the user who installs the solutions in that environment.

  [Learn more about Power Platform environments](/power-platform/admin/environments-overview)

- **Data loss prevention policies**

Make sure that the environment has access to connectors used by the template:

- [Microsoft Dataverse](/connectors/commondataserviceforapps/)
- [Office 365 Outlook](/connectors/office365/)
- [Office 365 Users](/connectors/office365users/)
- [Approvals](/connectors/approvals/)
- [Microsoft Teams](/connectors/teams/)
- [Cards for Power Apps](/connectors/cardsforpowerapps/)
  
[Learn more about Data loss prevention policies](/power-platform/admin/wp-data-loss-prevention)

## Step 2: Create connections

Cloud flows need specific connection references to work correctly. Connection references are included in the solution, but connectors often need to be set up manually. You need to set up six new connections for the Hardware Request and Management app

It's best to create the connections before you import the solution. If you create the connections during import, you have to jump back and forth between browser windows. It is okay to use existing connections.

To create connections in advance, take these steps:

1. Sign in to [Power Apps](https://make.preview.powerapps.com).
1. Go to **Connections** and select **+ New Connection** to create new connections with each of these connectors:

    - [Dataverse](/connectors/commondataserviceforapps/)
    - [Office 365 Outlook](/connectors/office365/)
    - [Office 365 Users](/connectors/office365users/)
    - [Approvals](/connectors/approvals/)
    - [Teams](/connectors/teams/)
    - [Cards for Power Apps](/connectors/cardsforpowerapps/)

After you create all your connections, your list should look like this example:

:::image type="content" source="media/install/hrm-install-connect.png" alt-text="Screenshot of a list of connectors created for your app.":::

[Learn how to manage connections in canvas apps](/power-apps/maker/canvas-apps/add-manage-connections).

## Step 3: Create approvals database

The Expense Reimbursement solution leverages Power Automate Approvals to approve or reject requests.

By default, Power Platform environments aren't set up with the required database for approvals. The database is created the first time a flow with the [Approvals connector](/connectors/approvals/) is run in that environment by an administrator.

Take these steps to create the database for approvals:

1. Go to the [Power Automate maker portal](https://make.preview.powerautomate.com/environments/) and select your targeted deployment environment.
1. Select **+ Create** on left pane.
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

> [!NOTE]
>
> It can take a few minutes for the database provisioning to complete, and you'll notice this delay the first time you run this flow. Once you complete this first-time flow run, subsequent approval flows will be faster.

[Learn how to get started with Power Automate approvals](/power-automate/get-started-approvals)

## Step 4: Install solution files

You have two options for installing the Hardware Request and Management solution:

- [Select **Get it now** on the template's AppSource page](#install-from-appsource) and an installation window opens automatically in the Power Platform admin center.
- [Download a managed or unmanaged version of the solution files and manually import them into your environment](#download-and-manually-install-solution-files).

> [!TIP]
>
> Go to the [Templates-for-Power-Platform](https://aka.ms/PowerPlatformTemplateSupport) GitHub project site to log your questions or issues and get support for the Hardware Request and Management template.

### Install from AppSource

AppSource is a Microsoft digital storefront. Take these steps to go through the AppSource install process:

1. Go to the [Hardware Request and Management template on AppSource](https://aka.ms/AccessHardwareRequestandManagementTemplate) and select **Get it now**.
1. In the **Install Hardware Request and Management** window in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select the developer environment that you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. Agree to the *Terms and Privacy Statements* when prompted.
1. Select **Install**.

[Learn more about AppSource](https://appsource.microsoft.com/en-US/)

Two solutions are installed in your environment:

- **IT Base**
- **Hardware Request and Management**

Go to the [Hardware Request and Management overview article](./overview.md) to learn more about the two solutions.

### Download and manually install solution files

Managed and unmanaged solution files are available for you to download and manually install. Take these steps to download and import the solutions directly into the development environment that you prepared for it in the [review prerequisites step](#step-1-review-prerequisites).

1. Download the following Managed *or* Unmanaged solution files:

    - Managed
      - [mpa_ITBase_managed.zip](https://aka.ms/ITBaseManagedSolution)
      - [mpa_HardwareRequestAndManagement_managed.zip](https://aka.ms/HardwareRequestAndManagementManagedSolution)
    - Unmanaged
      - [mpa_ITBase.zip](https://aka.ms/ITBaseUnManagedSolution)
      - [mpa_HardwareRequestAndManagement.zip](https://aka.ms/HardwareRequestAndManagementUnManagedSolution)

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you prepared in the [review prerequisites step](#step-1-review-prerequisites).
1. In the left pane, select **Solutions**.
1. Select **Import solution**, and then find and select the **managed** or **unmanaged version** of the `mpa_ITBase` file downloaded.
1. Select **Next**, and then select **Import**.
1. After you receive a message that the import was successful, repeat steps 4 and 5 to import the `mpa_HardwareRequestAndManagement` file you downloaded.
1. Select **Next** and **Next** again.
1. For each of the connections listed, select the connection that was created in the import steps.
1. Select **Next**.
1. Skip the environment variable setup for now. The required URL values only become available after the apps are imported into the environment.
1. Select **Import** to start importing the *Hardware Request and Management* solution. The import process takes a few minutes and once it's complete you're notified with a *Success* message.

[Learn more about solutions](/power-platform/alm/solution-concepts-alm).

## Step 5: Update environment variables and connection references

Environment variables support your application lifecycle management (ALM) strategy as you migrate the template across environments. Environment variables store keys and values for information that is contextual to the environment the solution is in. Two environment variables holding a reference to the Power Apps URLs need to be populated to support Outlook and Teams notifications.

Additionally, connection references allow makers to configure flows that allow connections to be managed centrally versus coupled to the flow. This also supports your ALM strategy since you don't need to introduce customizations or solution layers as your flows migrate across environments.

To update environment variables, take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment that contains the Hardware Request and Management solutions.
1. Select **apps** on the left pane.
1. Go to the *Hardware Request canvas app* row, **vertical ellipsis** > **Details** > **Hardware Request Details**. Copy the *URL* to a notepad.
1. Repeat the same process to copy the *Hardware Request and Management Model-driven app* URL to a notepad.

   > [!NOTE]
   >
   > If you manually installed an unmanaged version of the Hardware Request and Management solution file from GitHub, there is no need to add the environment variable and connection references to a new solution. Simply edit these components directly in the existing unmanaged solution file.

1. Select **Solutions** on the left pane.
1. Select **+ New solution** and populate the properties.
1. Select **Add existing** > **More** > **Environment variable**.
1. Select both the **Hardware Request and Management URL** and **Hardware Request App URL** variables.
1. Select **Next** and then **Add**.

   > [!NOTE]
   >
   > If you manually imported either the managed or unmanaged version of the Hardware Request and Management solution file from GitHub, there is no need to add and update connection references as those were set during the original import process.
   >
   > Only Add and update connection references if you installed from AppSource. Skip to step 13 in this section.

1. Select **Add existing** > **More** > **Connection References**
1. Multiselect the following connection references:

    - **Hardware Request and Management – [Approvals](/connectors/approvals/)**
    - **Hardware Request and Management – [Cards for Power Apps](/connectors/cardsforpowerapps/)**
    - **Hardware Request and Management – [Dataverse](/connectors/commondataserviceforapps/)**
    - **Hardware Request and Management – [Teams](/connectors/teams/)**
    - **Hardware Request and Management – [Office 365 Outlook](/connectors/office365/)**
1. Select **Next** and then **Add**.
1. Select the **Hardware Request and Management URL** environment variable.
1. Select **+ New value** under the *Current Value* section.
1. Paste the *URL value* previously copied to your notepad in the current value field and select **Save**.
1. Repeat steps 12-15 of this section for the Hardware Request App URL environment variable.

:::image type="content" source="media/install/hrm-install-variables.png" alt-text="Screenshot of how to set up environment variables for your app.":::

[Learn how to use environment variables in solutions](/power-apps/maker/data-platform/environmentvariables)

## Step 6: Share and turn on cloud flows

Some of the cloud flows may be off by default because the environment variables set in Step 5 are not populated yet. Additionally, it is important for some flows to run under a user's context when invoking actions like starting a Teams group chat, generating an approval, or sending an email notification.

### Configure run-only user privileges

Perform these steps to ensure certain flows run under the user's context:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** on the left pane and then select the **Hardware Request and Management** solution.
1. Select **Cloud flows**.
1. Take these steps for each flow:
    1. Select the flow and select **Edit** under the *Run only users* section in the lower right corner.
    1. Set up the security groups.
        1. If the solution is being deployed enterprise-wide, search for an *All Company* security group.
        1. If the solution is being deployed to a security group that contains specific members who will use the apps then select that security group.
    1. Ensure the *Connections Used* all say **Provided by run-only user**.
    1. Select **Save**.

   Configure *run-only* user privileges for each of these flows:

    - Create Initial Assets From Request
    - New Hardware Request Submitted For Approval
    - Notify Deliver Complete
    - Notify Purchase Complete
    - Notify Received Complete
    - Notify Request Complete
    - Notify Review Complete
    - Set Assets As Delivered With Refresh Date

[Learn how to share a cloud flow](/power-automate/create-team-flows#share-a-cloud-flow-with-run-only-permissions)

### Turn on cloud flows

To turn on cloud flows that were not on by default when installing the solution from AppSource, take these steps:

1. Go to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.

1. Select **Solutions** on the left pane and select the *unmanaged solution* you created in the previous step for the environment variables.

1. Select **Add Existing** > **More** > **Connection Reference** and select the following connection references:  

    1. Hardware Request and Management – Approvals
    1. Hardware Request and Management - Cards for Power Apps
    1. Hardware Request and Management – Dataverse
    1. Hardware Request and Management - Microsoft Teams
    1. Hardware Request and Management - Office 365 Outlook

1. Select **Add**

1. For each of the Connection References, select to edit the properties and choose the *Connection* in the drop-down list previously created.

1. Select **Solutions** in the left pane and select the **Hardware Request and Management** solution.

1. Select **Cloud flows**.

1. Perform the following steps for each of the flows whose status is *Off*:

    1. Select the flow row.
    1. Select **Turn on** at the top of the screen.

    *Turn on* cloud flows for each of these flows:

    - New Hardware Request Submitted For Approval
    - Notify Asset Refresh Eligible
    - Notify Deliver Complete
    - Notify Purchase Complete
    - Notify Received Complete
    - Notify Request Complete
    - Notify Review Complete
    - Wait for Approval Response

:::image type="content" source="media/install/hrm-install-turnon.png" alt-text="Screenshot of how to turn on cloud flows.":::

## Step 7: Share the apps

Access to both the Hardware Request and the Hardware Management apps can be controlled by either assigning directly to user(s) or security groups.

Take the following steps to share the Hardware Request app with users:

1. Sign in to [Power Apps](https://make.preview.powerapps.com/) and select the environment you installed the solution in.
1. Select **Solutions** on the left pane and select the **Hardware Request and Management** solution from the list.
1. Select **Apps**.
1. Go to the *Hardware Request app* row and then the **three dots**.
1. Select **Share**.
1. Search for either the *users* in your environment or *Microsoft Entra ID Security Group* that contains the members you want to share the app with.
1. Under the *Data permissions* section, assign the following security roles next to the Dataverse connection:

    1. **Approvals User**
    1. **Basic User** (Under Standard roles at the bottom)
    1. **Cards Basic Role**
    1. **IT Base User**
    1. **Hardware Request and Management – Employee**

1. Select **Share**

   :::image type="content" source="media/install/hrm-install-sharehrapp.png" alt-text="Screenshot of how to share the Hardware Request app.":::

Take the following steps to share the Hardware Management app with users:

1. Select the **Hardware Request and Management app** row and next the **ellipsis (three vertical dots)** and then select **Share**.

1. Search for either the *users* in your environment or *Microsoft Entra ID Security Group* that contain the members you want to share the app with.
1. Under the Data permissions section, assign the following security roles next to the Dataverse connection:
    1. **Approvals User**
    1. **Basic User**
    1. **Cards Basic Role**
    1. **IT Base User**
    1. **Power BI workspace viewer**
    1. **Hardware Request and Management – Business Administrator**
1. Select **Share**.

> [!IMPORTANT]
>
> Be sure to **uncheck** the *Send an email* invitation to new users if you don't want to send an email notification once broadly shared.

> [!NOTE]
>If Hardware Request and Management apps aren't shared with you and you can't access them directly from Power Apps, please contact your admin.

## Step 8: Enable Dataverse search (optional)

Dataverse search delivers fast and comprehensive search results in a single list, sorted by relevance. Find hardware request and asset data quickly by enabling Dataverse search in the environment that you deploy the template in. To enable Dataverse search, follow these steps:

1. Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Environments** on the left pane and then select the environment where the solution was installed.
1. Select **Settings** at the top of the screen.
1. Expand the *Product* section and select **Features**.
1. Underneath the *Search* section:
    1. Set the *Dataverse search* option to **On**.
    1. Set the *Use quick find view of an entity for searching on grids and sub-grids* to **On**.

More information: [Configure Dataverse search to improve search results and performance](/power-platform/admin/configure-relevance-search-organization)

## Step 9: Enable copilot (optional)

Microsoft Copilot for Power Apps model-driven apps is a next-generation AI assistant for app admins to get insights about the data in their apps through conversation in natural language. As a Hardware Request and Management admin, you can leverage Copilot to help you get insights on data. As a Power Platform admin, take these steps to [enable Copilot](/power-apps/maker/model-driven-apps/add-ai-copilot#enable-copilot-for-model-driven-apps-feature-for-your-environment) and [manage behavior settings](/power-platform/admin/settings-behavior) for all users in the selected environment:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Environments** on the left pane and then select the environment where you want to enable Copilot for model-driven app users.
1. Select **Settings**.
1. Expand the **Product** section and select **Features** to turn on Copilot.
1. In the *Copilot* section, set the value for *Allow users to analyze data using an AI-powered chat experience in canvas and model-driven apps* to **On**.
1. Select **Save**.
1. Next, go back to **Settings**.
1. Expand the **Product** section and select **Behavior** to manage behavior settings.
1. In the *Release channel* section, select **Monthly channel** from the dropdown.
1. Select **Save**.
   :::image type="content" source="media/install/ppadmin-release-channel.png" alt-text="Screenshot of how to manage behavior settings in the Power Platform admin center.":::

## Step 10: Enable auditing (optional)

While not required, we recommend enabling the audit setting in your environment so it's easy to see who creates and updates records. To do this:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).
1. Select **Environments** on the left pane and then select the environment where the solution was installed.
1. Expand *Audit and logs* and select **Audit settings**.
1. In the *Auditing* section,select **Start Auditing**.

:::image type="content" source="media/install/start-auditing.png" alt-text="Screenshot of how to enable auditing.":::

## Step 11: Support more languages

All fields are globalized so that they display date, time, and number formats according to your browser's language setting. All strings in the Hardware Request canvas app are defaulted to English. However, the canvas apps are localization-ready. This means all Text, Accessible Label, Tool Tip, HintText, InputPlaceHolderText, and Notifications include Power Fx functions to check whether a localized string is present for the user's logged-in browser language code. These strings are administered and maintained via one of the administrator apps.

The most efficient way to load and maintain these values is by using the Export to Excel Online capability available in the administrator app in bulk rather than manually entering each one.  

To create localized strings:

1. Go to [Power Apps](https://make.preview.powerapps.com/).
1. Select **Apps**.
1. Open either the IT Template Administrator or Hardware Request and Management Model-driven app.
1. Select **Export to Excel** and then open in Excel Online.
1. Create or update rows with the following attributes:

| Field           | Examples  |Description                                                           |
|-----------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| English value   | Cancel    | The English version of the string that serves as the string key that the application will always look up to see if there's a corresponding localized value to display.                                     |
| Language        | de        | The language ISO code of the display value. The apps will automatically look up to see if there are localized strings to display based upon the user's browser language code.                              |
| Localized value | Abbrechen | The localized string value to display for the given English value.                                                                                                                                         |
| String type     | Label     | Not required, but helps categorize what control/property the string is, noting that one localization entry can support multiple property types so just choose the primary property type in that situation. |

> [!TIP]
>
> A CSV file is available for download on the [GitHub Templates for Power Platform site](https://github.com/microsoft/Templates-for-Power-Platform/). It contains all the app default English strings. You can import the CSV file into your environment using the *Import data* capability that is part of the administrator app. Although not required for English-only deployments, importing this file helps you quickly identify the localization strings that you need to prepare for your required language.
>
> To further accelerate the string localization creation process, create a cloud flow to trigger off the Dataverse English imported localization records selected in the Administrator app. This flow can use AI Builder action steps to automatically translate the English records to your target language and directly load them into the Localizations table.
>
> More information: [Use the text translation prebuilt model in Power Automate](/ai-builder/flow-text-translation)

More information: [Build global support into canvas apps](/power-apps/maker/canvas-apps/global-apps)

### Next step

[Get started managing hardware assets and requests](manage.md)
