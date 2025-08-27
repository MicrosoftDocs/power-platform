---
title: Set up inventory components
description: Learn how to set up inventory components in the Power Platform Center of Excellence Starter Kit to sync, monitor, and manage Power Platform resources.
author: manuelap-msft
ms.topic: how-to
ms.date: 08/22/2025
ms.subservice: guidance-toolkit
ms.author: mapichle
ms.reviewer: jhaskett-msft
---

# Set up inventory components

This article helps you set up the inventory components of the **Core** solution of the Center of Excellence (CoE) Starter Kit. The inventory is the heart of the CoE. Your Microsoft Power Platform journey is most beneficial when you understand your apps, flows, and makers, and can lay the foundation to monitor new apps and flows being created.

The flows and dataflows in this solution sync all your resources into tables. This solution helps you build admin apps, flows, and dashboards on top of inventory. This setup gives you a holistic overview into the apps, flows, and makers that exist in your environment. Apps like **DLP Editor** and **Set App Permissions** help with daily admin tasks.

## Prerequisites

1. Complete the [CoE Starter Kit setup steps](setup.md).
1. [Create your environment](setup.md#create-your-environments).
1. Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

> [!NOTE]
>
> - If you try out [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) for inventory, we recommend that you don't depend on this feature and test it in a dedicated test environment first. Trying out this feature helps us validate that the feature is what you need and that we're not introducing unintended side effects.
> - Your feedback is critical to this process. Post your feedback by [raising an issue on GitHub](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cquestion&template=5-coe-starter-kit-question.yml&title=%5BCoE+Starter+Kit+-+QUESTION%5D+QUESTION).
> - Setting up the inventory components by using [Data Export](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) is only supported through the [Setup Wizard](#set-up-the-inventory-components-by-using-the-setup-wizard). Manual setup instructions are available after the experimental preview.

## Import the Creator Kit and make connections

Import the Creator Kit, establish required connections, and enable the core components solution in the CoE Starter Kit.

### Import Creator Kit

The CoE Starter Kit requires the installation of the [Creator Kit](../creator-kit/overview.md) in the environment where you installed the CoE Starter Kit.

[Install the Creator Kit](../creator-kit/setup.md) before proceeding.

### Create connections

Create these connections manually before installing the kit to ensure they're correctly configured.

1. Go to [Power Automate](https://make.powerautomate.com/).

1. Select your CoE environment and go to **Data** > **Connections** > **+ New connection**.

1. Create a connection for [HTTP with Microsoft Entra ID (preauthorized)](/connectors/webcontents/), and set **Base Resource URL** and **Microsoft Entra ID Resource URI (Application ID URI)** to `https://graph.microsoft.com` for commercial tenants. 

    If your tenant is in GCC, GCC High, or DoD, check your [service root endpoints for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

### Import the core components solution

1. Download the CoE Starter Kit [compressed file](https://aka.ms/CoeStarterKitDownload) to your computer.

1. Extract the compressed file. The CoE Starter Kit compressed file contains all solution components in addition to the non–solution-aware components that make up the CoE Starter Kit.

1. Import the **CenterOfExcellenceCoreComponents_x_x_x_xx_managed.zip** solution file from the extracted folder.

1. For an environment in the commercial cloud, leave all environment variable values blank. For a GCC, GCC High, and DoD environment, check [Microsoft Graph and Graph Explorer service root endpoints](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints) and enter the value for your cloud in the **Graph URL Environment Variable** environment variable.

The import can take up to an hour to complete, and upgrades can take up to two hours.

> [!NOTE]
> After importing your solution, you might see this warning: *Solution "Center of Excellence - Core components" imported successfully with warnings: Flow client error returned with status code Bad Request.* You can ignore this warning message. Proceed with opening the **Setup Wizard** app to continue the setup and configuration of the solution.

## Set up the Inventory components by using the Setup Wizard

Use the Setup Wizard to complete the configuration.

### Open the Setup Wizard

1. After the solution import succeeds, open the **Center of Excellence - Core Components** solution.

1. Open the **CoE Setup and Upgrade Wizard** app.

1. Follow the steps to complete the configuration.

:::image type="content" source="media\coesetupwizard.png" alt-text="Screenshot showing the first step in the CoE Upgrade Wizard, Confirm pre-requisites." lightbox="media\coesetupwizard.png":::

#### Troubleshooting

If you see an *Error Loading Control* warning on opening the Setup Wizard app, it means some of the flows required to run the wizard couldn't be turned on automatically. 

1. Navigate to the solution and turn on the following flows manually:

    - SetupWizard > GetCurrentEnvironment
    - SetupWizard > GetTenantID
    - SetupWizard > GetUserDetails

1. After you turn on these flows, return to the Setup Wizard to continue the setup.

### Choose data source

You can choose your data source for inventory. **Cloud flows** is the default and currently recommended path for gathering your inventory.

However, you might want to experiment with the **Data Export (Preview)** data source. To experiment, use the [Data Export inventory setup](setup-dataexport.md) instructions when you get to the **Configure dataflows** page.

:::image type="content" source="media\setupWizard-datasource.png" alt-text="Screenshot that shows the Setup Wizard inventory data source step." lightbox="media\setupWizard-datasource.png":::

## Set up the CoE Admin Command Center app

> [!IMPORTANT]
> Only complete these steps if you want to review Power Platform–related [Microsoft 365 Message center](/microsoft-365/admin/manage/message-center) updates in the [CoE Admin Command Center](core-components.md#coe-admin-command-center) canvas app. You can use the CoE Admin Command Center app without this configuration.

### Create a Microsoft Entra app registration to connect to Microsoft Graph

The [CoE Admin Command Center](core-components.md#coe-admin-command-center) connects to [Microsoft Graph API](/graph/api/serviceannouncement-list-messages) to get [Microsoft 365 Message center](/microsoft-365/admin/manage/message-center) updates.

Use these steps to set up the Microsoft Entra app registration used in a cloud flow to connect to the Graph API. Learn more in [Use the Microsoft Graph API](/graph/use-the-api).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **App registrations**.

   :::image type="content" source="media/coe33.png" alt-text="Screenshot showing the Microsoft Azure portal with the App registrations service highlighted." lightbox="media/coe33.png":::

1. Select **+ New Registration**.

1. Enter a name. For example, use the **CoE Command Center** name. Don't change any other settings and select **Register**.

1. Select **API permissions** > **+ Add a permission**.

   :::image type="content" source="media\coe34.png" alt-text="Screenshot that shows API permissions." lightbox="media\coe34.png":::

1. Select **Microsoft Graph** and configure permissions as follows:
   1. Select **Application permissions**, and then select **ServiceMessage.Read.All**.
   1. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**.

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.

1. Add a description and expiration (in line with your organization's policies), and then select **Add**.

1. Copy and paste the **Secret** to a text document such as Notepad.

1. Select **Overview** and copy and paste the application (client) ID value to the same text document. Make sure you note which GUID corresponds to each value.

### Update environment variables

[Update the environment variables](faq.md#update-environment-variables) that hold the client ID and secret, as shown in the following table.

You can store the client secret either in plain text in the **Command Center - Client Secret** environment variable (not recommended) or store the client secret in Azure Key Vault and reference it in the **Command Center - Client Azure Secret** environment variable (recommended). 

Review the required permissions to use [Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview).

> [!NOTE]
> The flow using this environment variable is configured with a condition to expect either the Command Center - Client Secret or the Command Center - Client Azure Secret environment variable. You don't need to edit the flow or command center application to work with Azure Key Vault.

| Name | Description |
|------|-------------|
| Command Center - Application Client ID | The application client ID from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. |
| Command Center - Client Secret | The application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're using Azure Key Vault to store your client ID and secret. |
| Command Center - Client Azure Secret | The Azure Key Vault reference for the application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're storing your client ID in plain text in the Command Center - Client Secret environment variable. This variable expects the Azure Key Vault reference, not the secret. Learn more in [Environment variables for Power Platform overview](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview). |

### Modify the Command Center app for a GCC High or DoD tenant

> [!IMPORTANT]
> If your CoE Starter Kit is installed in a *commercial* or *GCC* tenant, you can skip this step.

If your CoE Starter Kit is installed in a *GCC High* or *DoD* tenant, update the **Authority** in HTTP action:

1. Go to [make.powerautomate.com](https://make.powerautomate.com).

1. Select **Solutions** and open the **Center of Excellence - Core Components** solution to view the flows.

1. Edit the **Command Center App > Get M365 Service Messages** flow.

1. Update the **List serviceAnnouncements from Graph** action and change the **Authority** to `https://login.microsoftonline.us` for a GCC High or DoD tenant.

1. **Save** this flow.

## Set up Audit Logs solution

> [!NOTE]
> Set up the Audit Log solution only if you chose [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.

The Audit Log Sync flow connects to the Microsoft 365 audit log to gather telemetry data (unique users and launches) for apps. The CoE Starter Kit works without this flow. However, usage information, such as app launches and unique users, in the Power BI dashboard is blank. Learn more in [Collect audit logs by using the Office 365 Management API](setup-auditlog-http.md).

## Set up the Power BI dashboard

The CoE Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant: environments, apps, Power Automate flows, connectors, connection references, makers, and audit logs. Telemetry from the audit log is stored from the moment you set up the CoE Starter Kit. Over time, you can identify trends longer than 28 days. Learn more in [Set up the Power BI dashboard](setup-powerbi.md).

## Share apps with other admins

The core components solution contains apps designed to give admins better visibility and an overview of resources and usage in their environments.

Share these apps with other Power Platform admins and assign them the **Power Platform Admin SR** security role:

- [CoE Admin Command Center](core-components.md#coe-admin-command-center)
- [Power Platform Admin View](core-components.md#power-platform-admin-view)

Explore the [CoE Admin Command Center](core-components.md#coe-admin-command-center) app, your central hub for accessing all CoE Starter Kit apps.

Learn more in [Share an app from a production environment](faq.md#share-an-app-from-a-production-environment).

## Wait for flows to finish

After the sync flows finish running, you can start using many of the features of the CoE Starter Kit core solution.  

The first inventory run might take several hours depending on the number of environments and resources in your tenants. Future runs are faster because they only check new and modified resources.

### To check the status of a flow

1. Select **Admin** > **Sync Template v4 (Driver)**.

   A new tab opens to the **Flow detail** page.

1. View **Runs**.

## All environment variables

This section includes the full list of environment variables that affect the inventory sync flows, including environment variables with default values. You might need to [update environment variables](faq.md#update-environment-variables) after you import.

> [!IMPORTANT]
> You don't have to change the values during setup. However, you can change an environment variable that you configured during import or when you want to change a default value. To make sure the latest values are picked up, restart all flows after you change environment variables.

Use environment variables to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default value |
|------|-------------|---------------|
| Admin eMail | CoE Admin email. Email address used in flows to send notifications to admins. This value should be either your email address or a distribution list. | Not applicable |
| Admin eMail Preferred Language | The preferred language for the emails sent to the admin email alias, which is specified in the Admin eMail environment variable. | en-US |
| Also Delete from CoE | When running the **Admin: Sync Template v2 (Check Deleted)** flow, delete the items from CoE (yes) or just mark deleted (no).  | Yes |
| CoE System User ID | In the maker table, we store a user for a system with an ID. Storing the ID here gives you an easy reference, so you don't have to look up the ID often. | Not applicable |
| Command Center - Application Client ID | (optional) The application client ID from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave this ID empty if you want to use the Azure Key Vault to store your client ID and secret. | Not applicable |
| Command Center - Client Secret | (Optional) The application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave this secret empty if you want to use Azure Key Vault to store your client ID and secret. | Not applicable |
| Command Center - Client Azure Secret | The Azure Key Vault reference for the application client secret from the [Create a Microsoft Entra app registration to connect to Microsoft Graph](#create-a-microsoft-entra-app-registration-to-connect-to-microsoft-graph) step. Leave this secret empty if you want to store your client ID in plain text in the Command Center - Client Secret environment variable. Learn more in [Environment variables for Power Platform overview](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview). | Not applicable |
| CompanyName | The name of the company to be displayed in various apps and emails. Currently, this name is only used by the [Video hub](nurture-components.md#video-hub) app. | Not applicable |
| DelayInventory | If *Yes*, runs a delay step to assist with the Dataverse load balancing. Only set to *No* for debugging. | Yes |
| DelayObjectInventory | If *Yes*, runs a delay step in individual inventory flows to assist with data source throttling experienced by larger tenants. Set to *Yes* if you experience this type of throttling. | No |
| Disabled Users are Orphaned | If an AD user has property *Account* enabled as *false*, the user is orphaned. | No |
| eMail Header Style | The CSS / Style to use for emails. | [Default CSS](#default-value-for-email-header-style-environmental-variable) |
| eMail Body Start | Starting HTML format for emails. | Default style provided |
| eMail Body Stop | Ending HTML format for emails. | Default style provided |
| FullInventory | Determines whether you want to update only changed objects or all objects. Switching to *Yes* causes the flows to inventory every single app, flow, and bot in the tenant every day. The *Yes* setting isn't recommended for large tenants.  | No |
| Graph URL Environment Variable |The URL used to connect to Microsoft Graph. <br> For an environment in the commercial cloud: `https://graph.microsoft.com`<br> For a GCC, GCC High, and DoD environment, check [Microsoft Graph and Graph Explorer service root endpoints](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).| Not applicable |
| Host Domains | Domains to consider as local for cross domain identity reports. As a comma-separated string: `myCo.onmicrosoft.com`, `partnerCo.onmicrosoft.com` | Not applicable |
| Individual Admin | Communications in the starter kit are sent to this email address. Communications can't be sent to a group. Learn more in [What's the best way to communicate with admins, makers, and users?](setup.md#whats-the-best-way-to-communicate-with-admins-makers-and-users) | Not applicable |
| Inventory and Telemetry in Azure Data Storage account | Sets up data export in the Power Platform admin center with your inventory and telemetry in an Azure Data Storage folder. This variable also represents a **Bring your own Datalake / self-serve analytics** feature. | No |
| InventoryFilter_DaysToLookBack | When not running a full inventory, we filter back a set number of days and see if the object needs to update.| 7 |
| is All Environments Inventory | If true (default), the CoE inventory tracks all environments. New environments added to the inventory have their **Excuse from Inventory** set to *false*. You can opt out of individual environments. If *false*, the CoE inventory tracks a subset of environments. New environments added to the inventory have their **Excuse from Inventory** set to *true*. You can opt in to individual environments.  | Yes |
| Power Platform Maker Microsoft 365 Group | Get the ID of the Microsoft 365 group, which contains all your Power Platform makers. With this ID, you can communicate and share apps with makers. This ID is needed for the inventory setup in the **Admin > Add Maker to Group** flow. Learn more in [What's the best way to communicate with admins, makers, and users?](setup.md#whats-the-best-way-to-communicate-with-admins-makers-and-users) | Not applicable |
| Power Platform User Microsoft 365 Group | Get the ID of the Microsoft 365 group, which contains all your Power Platform users, such as end users with your shared apps. You use this ID to communicate and share apps with users. Learn more in [What's the best way to communicate with admins, makers, and users?](setup.md#whats-the-best-way-to-communicate-with-admins-makers-and-users). | Not applicable |
| Power Automate environment variable | The URL used by Power Automate for your cloud. <br> For an environment in the commercial cloud: `https://make.powerautomate.com/environments` <br> For a GCC, GCC High, or DoD environment: [Power Automate US government service URLs](/power-automate/us-govt#power-automate-us-government-service-urls). | Not applicable |
| PowerApp Maker environment variable | The URL used by the Power Apps maker portal for your cloud, including a trailing slash `/`. <br> For an environment in the commercial cloud: `https://make.powerapps.com` <br>For a GCC, GCC High, or DoD environment: [Power Apps US Government service URLs](../../admin/powerapps-us-government.md#power-apps-us-government-service-urls). | Not applicable|
| PowerApp Player environment variable | The URL used by the Power Apps player for your cloud, including a trailing slash `/`.<br> For an environment in the commercial cloud: `https://apps.powerapps.com` <br> For a GCC environment: `https://apps.gov.powerapps.us` <br>For a GCC High environment: `https://apps.gov.powerapps.us` <br>For a DoD environment: `https://play.apps.appsplatform.us` | Not applicable |
| ProductionEnvironment | Set to *No* if you're creating a development/test environment. This variable allows some flows to set target users to the admin instead of resource owners.| Yes |
| Sync Flow Errors Delete After X Days | Number of days back to store sync flow error records. Deletes records older than this number of days.| 7 |
| TenantID | Your Azure Tenant ID. Learn more in [Find tenant ID through the Azure portal](/azure/active-directory/fundamentals/active-directory-how-to-find-tenant#find-tenant-id-through-the-azure-portal). | Not applicable |

### Default value for eMail Header Style environmental variable

<details>
<summary>Default CSS</summary>

```css
<head> <style> 
body {
    background-color: #efefef;
    font-family: Segoe UI;
    text-align: center;
}

#content {
    border: 1px solid #742774;
    background-color: #ffffff;
    width: 650px;
    margin-bottom: 50px;
    display: inline-block;
}

#logo {
    margin-left: 52px;
    margin-top: 40px;
    width: 60px;
    height: 12px;
}

#header {
    font-size: 24px;
    margin-left: 50px;
    margin-top: 20px;
    margin-bottom: 20px;
}

#ribbon {
    background-color: #742774;
}

#ribbonContent {
    font-size: 20px;
    padding-left: 30px;
    padding-top: 10px;
    padding-bottom: 20px;
    color: white;
    width: 100%;
    padding-right: 10px;
}

#message > td {
    font-size: 14px;
    padding-left: 60px;
    padding-right: 60px;
    padding-top: 20px;
    padding-bottom: 40px;
}

#footer > td {
    font-size: 12px;
    background-color: #cfcfcf;
    height: 40px;
    padding-top: 15px;
    padding-left: 40px;
    padding-bottom: 20px;
}

#form {
    width: 100%;
    border-collapse: collapse;
}

#app {
    width: 60%;
    font-size: 12px;
}

.label {
    color: #5f5f5f
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

</style> </head>

```
</details>

[!INCLUDE[file-an-issue](../../includes/file-issue.md)]

## What's next?

- Learn how to [regularly upgrade and extend](after-setup.md) the CoE Starter Kit.
- Check out [other components part of the core solution](core-components.md#environment-request-management-components), and the [governance](governance-components.md) and [nurture](nurture-components.md) solutions.