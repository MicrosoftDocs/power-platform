---
title: "Set up inventory components | MicrosoftDocs"
description: "Instructions for how to set up the inventory components solution of the CoE Starter Kit"
author: manuelap-msft
ms.topic: conceptual
ms.date: 09/05/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks

---

# Set up inventory components

This article helps you set up the inventory components of the Core solution of the Center of Excellence (CoE) Starter Kit. The inventory is the heart of the CoE; before embarking on your Microsoft Power Platform adoption journey, you want to first understand whether you have existing apps, flows, and makers, and lay the foundation to monitor new apps and flows being created.

The flows and dataflows in this solution sync all your resources into tables and build admin apps, flows, and dashboards on top of this inventory to help you get a holistic overview into the apps, flows, and makers that exist in your environment. Additionally, apps like DLP Editor and Set App Permissions help with daily admin tasks.

> [!IMPORTANT]
>
> - Complete the **[Get started](setup.md)** instructions before continuing with the setup. This article assumes that you have your [environment set up](setup.md#create-your-environments) and are signed in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).
> - If you are trying out [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory, note that we recommend you don't depend on this feature just yet and test it in a dedicated test environment first. Trying out this feature will help us to validate that the feature is what you need and that we're not introducing unintended side effects. Your feedback is critical to this process. Please post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION).
>
> Setting up the inventory components using [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) is only supported through the [setup wizard](#set-up-the-inventory-components-using-the-setup-wizard). Manual setup instructions will be available after the experimental preview.

## Before you start

### Import Creator Kit

The CoE Starter Kit includes features that required the installation of the [Creator Kit](../creator-kit/overview.md) in the environment where you install the CoE Starter Kit.

[Install the Creator Kit](../creator-kit/setup.md) before proceeding.

### Create connections

The following connections should be created manually ahead of install to ensure they are correctly configured.

1. Go to [Power Automate](https://make.powerautomate.com/).
1. Select your CoE environment, and go to **Data** > **Connections** > **+ New connection**.
1. Create a connection for [HTTP with Microsoft Entra ID (preauthorized)](/connectors/webcontents/), and set **Base Resource URL** and **Microsoft Entra ID Resource URI (Application ID URI)** to [https://graph.microsoft.com/](https://graph.microsoft.com/) for commercial tenants. If your tenant is in GCC, GCC High, or DoD, check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

 ![Http with Entra ID Preauthorized connection.](media/httpazuread.png "Http with Entra ID Preauthorized connection.")

### Import the core components solution

1. Download the CoE Starter Kit [compressed file](https://aka.ms/CoeStarterKitDownload) to your computer.

1. Extract the compressed (.zip) file. The CoE Starter Kit compressed file contains all solution components in addition to the non–solution-aware components that make up the CoE Starter Kit.

1. Import the **CenterOfExcellenceCoreComponents_x_x_x_xx_managed.zip** solution file from the extracted folder.

1. For an environment in the commercial cloud, leave all environment variable values blank. For a GCC, GCC High, and DoD environment, check [Microsoft Graph and Graph Explorer service root endpoints](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints) and enter the value for your cloud in the **Graph URL Environment Variable** environment variable.

The import can take up to an hour to be complete, and upgrades up to two hours.

>[!NOTE]
> After solution import, you may see the following warning: *Solution "Center of Excellence - Core components" imported successfully with warnings: Flow client error returned with status code Bad Request*. This warning message can be ignored, and you can proceed with opening the **Setup Wizard** app to continue the setup and configuration of the solution.

## Set up the Inventory components using the Setup Wizard

### Open the Setup Wizard to complete the configuration

1. After the solution import is successful, open the **Center of Excellence - Core Components** solution.
1. Open the **CoE Setup and Upgrade Wizard** app.
1. This app provides a guided step-by-step experience through the configuration steps.

> ![Setup Wizard.](media\coesetupwizard.png "Setup Wizard.")
> Below we will walk you through some things to note in the wizard but not walk through each screen as they may change slightly over time.

#### Troubleshooting

If you see an *Error Loading Control* warning when opening the Setup Wizard app, it means some of the flows required to run the wizard couldn't be turned on automatically. Navigate to the solution and turn on the following flows manually and then return to the Setup Wizard to continue the setup:

- SetupWizard>GetCurrentEnvironment
- SetupWizard>GetTenantID
- SetupWizard>GetUserDetails

### Choose Data source

One screen you will see allows you to chose your data source for inventory.  **Cloud flows** is the default and currently recommended path for gathering inventory. However you may wish to experiment with the **Data Export (Preview)** data source.

If so please also follow the [Data Export setup](setup-dataexport.md) instructions when you get to the **Configure dataflows** page.

> ![Setup Wizard data source selection.](media\setupWizard-datasource.png "Setup Wizard data source selection.")

## Set up the CoE Admin Command Center app

>[!IMPORTANT]
> Only complete these steps if you want to review Power Platform–related [Microsoft 365 Message Center](/microsoft-365/admin/manage/message-center) updates in the **[CoE Admin Command Center](core-components.md#coe-admin-command-center)** canvas app. The **CoE Admin Command Center** app can be used without this configuration.

### Create a Microsoft Entra app registration to connect to Microsoft Graph

The [CoE Admin Command Center](core-components.md#coe-admin-command-center) connects to [Microsoft Graph API](/graph/api/serviceannouncement-list-messages) to get [Microsoft 365 Message Center](/microsoft-365/admin/manage/message-center) updates.

Using these steps, you set up a Microsoft Entra app registration that is used in a cloud flow to connect to the Graph API. More information: [Use the Microsoft Graph API](/graph/use-the-api)

1. Sign in to [portal.azure.com](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **App registrations**.

   :::image type="content" source="media/coe33.png" alt-text="Microsoft Entra app registration":::

1. Select **+ New Registration**.

1. Enter a name (for example, **CoE Command Center**), don't change any other setting, and then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

    > ![API permissions.](media\coe34.png "API permissions.")

1. Select **Microsoft Graph**, and configure permissions as follows:

   1. Select **Application permissions**, and then select **ServiceMessage.Read.All**.
   1. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**.

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.

    > ![New client secret.](media\coe39.png "New client secret.")

1. Add a description and expiration (in line with your organization's policies), and then select **Add**.

1. Copy and paste the **Secret** to a text document in Notepad for the time being.

1. Select **Overview**, and copy and paste the application (client) ID value to the same text document; be sure to make a note of which GUID is for which value.

### Update environment variables

[Update the environment variables](faq.md#update-environment-variables) that hold the client ID and secret, as shown in the following table. You can store the client secret either in plain text in the **Command Center - Client Secret** environment variable (not recommended) or store the client secret in Azure Key Vault and reference it in the **Command Center - Client Azure Secret** environment variable (recommended). Review the required permissions to [use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview).

>[!NOTE]
> The flow using this environment variable is configured with a condition to expect either the Command Center - Client Secret or the Command Center - Client Azure Secret environment variable. It is not necessary to edit the flow or command center application to work with Azure Key Vault.

| Name | Description |
|------|---------------|
| Command Center - Application Client ID | The application client ID from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. |
| Command Center - Client Secret | The application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're using Azure Key Vault to store your client ID and secret. |
| Command Center - Client Azure Secret | The Azure Key Vault reference for the application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're storing your client ID in plain text in the Command Center - Client Secret environment variable. This variable expects the Azure Key Vault reference, not the secret. Learn more: [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview)|

### Modify the Command Center App > Get M365 Service Messages flow for a GCC High or DoD tenant

>[!IMPORTANT]
>If your CoE Starter Kit is installed in a commercial or GCC tenant, you can skip this step.

If your CoE Starter Kit is installed in a GCC High or DoD tenant, update the **Authority** in HTTP action:

1. Go to [make.powerautomate.com](https://make.powerautomate.com), select **Solutions**, and then open the **Center of Excellence - Core Components** solution to view the flows.
1. Edit the **Command Center App > Get M365 Service Messages** flow.
1. Update the **List serviceAnnouncements from Graph** action and change the **Authority** to [https://login.microsoftonline.us/](https://login.microsoftonline.us/) for a GCC High or DoD tenant.
1. **Save** this flow.

## Set up Audit Logs solution

> [!NOTE]
> Only set up the Audit Log solution if you've chosen [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.

The Audit Log Sync flow connects to the Microsoft 365 audit log to gather telemetry data (unique users and launches) for apps. The CoE Starter Kit works without this flow. However, usage information, such as app launches and unique users, in the Power BI dashboard is blank. More information: [Set up the audit log](setup-auditlog-http.md)

## Set up the Power BI dashboard

The CoE Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant: environments, apps, Power Automate flows, connectors, connection references, makers, and audit logs. Telemetry from the audit log is stored from the moment you set up the CoE Starter Kit, so over time you can look back and identify trends for longer than 28 days. More information: [Set up the Power BI dashboard](setup-powerbi.md)

## Share apps with other admins

The core components solution contains apps designed to give admins better visibility and overview of resources and usage in their environments.

Share these apps with other Power Platform admins and assign them the **Power Platform Admin SR** security role:

- [CoE Admin Command Center](core-components.md#coe-admin-command-center)
<!-- - [DLP Editor v2](core-components.md#dlp-editor-v2) -->
- [Power Platform Admin View](core-components.md#power-platform-admin-view)
<!-- - [Set App Permissions](core-components.md#set-app-permissions) -->
<!-- - [Set Flow Permissions](core-components.md#set-flow-permissions) -->

Take a look at the [CoE Admin Command Center](core-components.md#coe-admin-command-center) app, which is your central place to open all CoE Starter Kit apps from.

More information: [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)

## Wait for flows to finish

After the sync flows have finished running, you're ready to use many of the features of the CoE Starter Kit core solution.  

The first run of the inventory can take many hours depending on the number of environments and resources in your tenants. Future runs are faster, because they look at new and modified resources.

### To check the status of a flow

1. Select **Admin \| Sync Template v4 (Driver)**.

   This opens a new tab to the **Flow detail** page.

1. View **Runs**.

## What's next?

- Learn how to [regularly upgrade and extend](after-setup.md) the CoE Starter Kit.
- Check out [other components part of the core solution](core-components.md#environment-request-management-components), and the [governance](governance-components.md) and [nurture](nurture-components.md) solutions.

## All environment variables

This section includes the full list of environment variables that affect the inventory sync flows, including environment variables with default values. You might have to [update environment variables](faq.md#update-environment-variables) after import.

>[!IMPORTANT]
> You don't have to change the values during setup, just when you need to change the value of an environment variable that you configured during import or when you want to change a default value. To make sure the latest values are picked up, restart all flows after you change environment variables.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default value |
|------|---------------|------|
|Admin eMail |CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list. | Not applicable |
| Admin eMail Preferred Language | The preferred language for the emails sent to the admin email alias, which is specified in the Admin eMail environment variable. | en-US |
|Also Delete from CoE | When running the "Admin \| Sync Template v2 (Check Deleted)" flow, delete the items from CoE (yes) or just mark deleted (no).  | Yes |
|CoE System User ID | In the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time.  | Not applicable |
| Command Center - Application Client ID | (optional) The application client ID from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step earlier in this article. Leave empty if you'd like to use Azure Key Vault to store your client ID and secret. | Not applicable |
| Command Center - Client Secret | (optional) The application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step earlier in this article. Leave empty if you'd like to use Azure Key Vault to store your client ID and secret. | Not applicable |
| Command Center - Client Azure Secret | The Azure Key Vault reference for the application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're storing your client ID in plain text in the Command Center - Client Secret environment variable.  Learn more: [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview)| Not applicable |
|CompanyName |The name of the company to be displayed in various apps and emails. Currently this is only used by the [Video Hub](nurture-components.md#video-hub) app. | Not applicable |
| DelayInventory | If Yes, runs a delay step to assist with the Dataverse load balancing. Only set this to No for debugging. | Yes |
| DelayObjectInventory | If Yes, runs a delay step in individual inventory flows to assist with data source throttling experienced by larger tenants. Set this to Yes if you experience this type of throttling. | No |
| Disabled Users are Orphaned | If an AD user has property Account enabled as false, it's considered as orphaned. | No |
| eMail Header Style | The CSS / Style to use for eMails. | [Default CSS](/power-platform/guidance/coe/code-samples/css/default-value-email-header-style) |
| eMail Body Start | Starting HTML format for eMails. | Default style provided |
| eMail Body Stop | Ending HTML format for eMails. | Default style provided |
| FullInventory | Determines whether you want to update only objects that have changed, or all objects. Switching to Yes causes the flows to inventory every single app, flow, and bot in the tenant every day, and isn't recommended for large tenants.  | No |
| Graph URL Environment Variable |The URL used to connect to Microsoft Graph. For an environment in the commercial cloud: <https://graph.microsoft.com/><br> For a GCC, GCC High, and DoD environment, check [Microsoft Graph and Graph Explorer service root endpoints](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).| Not applicable |
| Host Domains | Domains to consider as local for cross domain identity reports. As a comma-separated string: myCo.onmicrosoft.com, partnerCo.onmicrosoft.com | Not applicable |
|Individual Admin |This is the email address to which communications in the starter kit will be sent, which can't be sent to a group. More information: [How to communicate with your admins, makers, and users](setup.md#how-to-communicate-with-your-admins-makers-and-users) | Not applicable |
| Inventory and Telemetry in Azure Data Storage account | Have you set up data export in PPAC and is your inventory and telemetry in an Azure Data Storage folder (also referred to as Bring your own Datalake, self-serve analytics feature). | No |
| InventoryFilter_DaysToLookBack | When not running a full inventory, we filter back this number of days and then see if the object needs updated.| 7 |
| is All Environments Inventory |If true (default), the CoE inventory tracks all environments. New environments added to the inventory have their Excuse from Inventory set to false. You can opt out individual environments.  If false, the CoE inventory tracks a subset of environments. New environments added to the inventory have their Excuse from Inventory set to true. You can opt in individual environments.  | Yes |
| Power Platform Maker Microsoft 365 Group | Get the ID of the Microsoft 365 group, which contains all your Power Platform makers. You use this to communicate and share apps with them. This is needed for the inventory setup in the Admin \| Add Maker to Group flow. More information: [How to communicate with your admins, makers, and users](setup.md#how-to-communicate-with-your-admins-makers-and-users) | Not applicable |
| Power Platform User Microsoft 365 Group | Get the ID of the Microsoft 365 group, which contains all your Power Platform users (for example, end users that apps are shared with). You use this to communicate and share apps with them. More information: [How to communicate with your admins, makers, and users](setup.md#how-to-communicate-with-your-admins-makers-and-users) | Not applicable |
|Power Automate environment variable | The URL used by Power Automate for your cloud.<br> For an environment in the commercial cloud: <https://make.powerautomate.com/manage/environments/> <br>For a GCC, GCC High, or DoD environment, check [Power Automate US government service URLs](/power-automate/us-govt#power-automate-us-government-service-urls). | Not applicable |
|PowerApp Maker environment variable | The URL used by the Power Apps maker portal for your cloud, including trailing slash. <br> For an environment in the commercial cloud: <https://make.powerapps.com/> <br>For a GCC, GCC High, or DoD environment, check [Power Apps US Government service URLs](../../admin/powerapps-us-government.md#power-apps-us-government-service-urls). | Not applicable|
|PowerApp Player environment variable | The URL used by the Power Apps player for your cloud, including trailing slash.<br> For an environment in the commercial cloud: <https://apps.powerapps.com/> <br> For a GCC environment: <https://apps.gov.powerapps.us/> <br>For a GCC High environment: <https://apps.gov.powerapps.us/> <br>For a DoD environment: <https://play.apps.appsplatform.us/> | Not applicable |
| ProductionEnvironment | Set to No if you're creating a development/test environment. This allows some flows to set target users to the admin instead of resource owners.| Yes |
| Sync Flow Errors Delete After X Days | Number of days back to store sync flow error records. Will delete records older than this number of days.| 7 |
| TenantID | Your Azure Tenant ID. Learn more: [Find Tenant ID through the Azure portal](/azure/active-directory/fundamentals/active-directory-how-to-find-tenant#find-tenant-id-through-the-azure-portal)| Not applicable|

## I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
