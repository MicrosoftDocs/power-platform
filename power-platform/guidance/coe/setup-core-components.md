---
title: "Set up inventory components | MicrosoftDocs"
description: "Setup instructions for how to set up the inventory components solution of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/24/2022
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Set up inventory components

This article will help you set up the inventory components of the Core solution of the Center of Excellence (CoE) Starter Kit. The inventory is the heart of the CoE; before embarking on your Microsoft Power Platform adoption journey, you'll want to first understand whether you have existing apps, flows, and makers, and lay the foundation to monitor new apps and flows being created.

The flows in this solution sync all your resources into tables and build admin apps, flows, and dashboards on top of this inventory to help you get a holistic overview into the apps, flows, and makers that exist in your environment. Additionally, apps like DLP Editor and Set App Permissions help with daily admin tasks.

[Watch a walk-through](https://www.youtube.com/embed/Z9Vp2IxFzpU) on how to set up the core components solution.

>[!IMPORTANT]
>Complete the **[Get started](setup.md)** instructions before continuing with the setup. This article assumes that you have your [environment set up](setup.md#create-your-environment) and are signed in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).

## Before you start

### Create connections

We recommend that you create connections to all connectors used in the solution prior to importing the solution. This will make the setup faster.

1. Go to [flow.microsoft.com](https://flow.microsoft.com/).
1. Select your CoE environment, and go to **Data** > **Connections** > **+ New connection**.
1. Create connections for the following:
    - [Approvals](/connectors/approvals/)
    - [Microsoft Dataverse](/connectors/commondataserviceforapps/)
    - [Microsoft Dataverse (legacy)](/connectors/commondataservice/)
    - [Microsoft Teams](/connectors/teams/)
    - [Office 365 Groups](/connectors/office365groups/)
    - [Office 365 Outlook](/connectors/office365/)
    - [Office 365 Users](/connectors/office365users/)
    - [Power Apps for Admins](/connectors/powerappsforadmins/)
    - [Power Apps for Makers](/connectors/powerappsforappmakers/)
    - [Power Automate for Admins](/connectors/microsoftflowforadmins/)
    - [Power Automate Management](/connectors/flowmanagement/)
    - [Power Platform for Admins](/connectors/powerplatformforadmins/)
    - [RSS](/connectors/rss/)
    - [SharePoint](/connectors/sharepointonline/)
    - [HTTP with Azure AD](/connectors/webcontents/)
1. Create a connection for [HTTP with Azure AD](/connectors/webcontents/), and set **Base Resource URL** and **Azure AD Resource URI (Application ID URI)** to [https://graph.microsoft.com](https://graph.microsoft.com) for commercial tenants. If your tenant is in GCC, GCC High, or DoD, check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

    ![Establish an HTTP with Azure AD connection.](media/httpazuread.png "Establish an HTTP with Azure AD connection.")

### Gather environment variable values

During solution import, you'll configure environment variable values. Make sure to have the following information ready.

> [!IMPORTANT]
> Mandatory environment variables for gathering inventory information are listed in the table below. Leave other environment variables empty during import - we'll update them later on as we configure different parts of the CoE Starter Kit.

| Name | Description |
|------|---------------|
|Admin eMail |This is the email address to which most admin communications in the starter kit will be sent. More information: [How will you communicate with your admins, makers, and users?](setup.md#how-will-you-communicate-with-your-admins-makers-and-end-users)  |
| Power Platform Maker Microsoft 365 Group | Get the ID of the Microsoft 365 group which will contain all your Power Platform makers. [Create a new group](/microsoft-365/admin/create-groups/create-groups#create-a-microsoft-365-group) if needed. You'll use this to communicate and share apps with them. Makers are automatically added to this group with the **Admin \| Add Maker to Group** flow and as part of the [Admin | Welcome Email v3](core-components.md#flows-2). More information: [How will you communicate with your admins, makers and end users?](setup.md#how-will-you-communicate-with-your-admins-makers-and-end-users) |
|Power Automate environment variable | The URL used by Power Automate for your cloud.<br> For an environment in the commercial cloud: <https://flow.microsoft.com/manage/environments/> <br>For GCC, GCC High, or DoD environment, check [Power Automate US government service URLs](/power-automate/us-govt#power-automate-us-government-service-urls). |
|PowerApp Maker environment variable | The URL used by the Power Apps maker portal for your cloud, including the trailing slash. <br> For an environment in the commercial cloud: <https://make.powerapps.com/> <br>For a GCC, GCC High, or DoD environment, check [Power Apps US Government service URLs](../../admin/powerapps-us-government.md#power-apps-us-government-service-urls). |
|PowerApp Player environment variable | The URL used by the Power Apps player for your cloud, including the trailing slash.<br> For an environment in the commercial cloud: <https://apps.powerapps.com/> <br> For a GCC environment: <https://apps.gov.powerapps.us/> <br>For a GCC High environment: <https://apps.gov.powerapps.us/> <br>For a DoD environment: <https://play.apps.appsplatform.us> |
| TenantID | Your Azure tenant ID.|

## Import the core components solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

    >[!IMPORTANT]
    > **Extract the zip file** after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components in addition to the non–solution-aware components that make up the CoE Starter Kit.

1. Import the solution:
    1. If you're [installing to a production environment](faq.md#installing-a-solution-in-a-production-environment), use the CenterOfExcellenceCoreComponents_x_x_x_xx_managed.zip solution file from the download.
    1. If you're [installing to a Dataverse for Teams environment](faq.md#installing-a-solution-in-a-dataverse-for-teams-environment), use the CenterOfExcellenceCoreComponentsTeams_x_x_x_xx_managed.zip solution file from the download.

1. Update environment variable values by using the [relevant information](#gather-environment-variable-values). The environment variables are used to store application and flow configuration data with data specific to your organization or environment. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment. All the flows in the solution depend on all environment variables' being configured.

The import can take up to 15 minutes to be completed.

## Turn on child flows

There are several child flows, check to make sure all of these flows are on:

1. HELPER – Send Email
1. HELPER – Maker Check
1. HELPER – CloudFlowOperations
1. HELPER – CanvasAppOperations
1. HELPER – ObjectOperations
1. CLEANUP HELPER – Check Deleted (Canvas Apps)
1. CLEANUP HELPER – Check Deleted (Cloud Flows)
1. CLEANUP HELPER – Check Deleted (Custom Connectors)
1. CLEANUP HELPER – Check Deleted (Model Driven Apps)
1. CLEANUP HELPER – Check Deleted (PVA)
1. CLEANUP HELPER – Power Apps User Shared With

If you get a connection authorization error turning on a flow, you might need to set the [run-only user properties](faq.md#set-flow-run-only-users-properties) of the flow.

 ![Connection authorization error when turning on the flow.](media/connerror.png "Connection authorization error when turning on the flow.")

## Turn on setup flows

The following flows support the inventory setup and need to be turned on before proceeding:

- Admin | Add Maker to Group
- Admin | Excuse Support Envts from Governance Flows
- Admin | Sync Template v3 Configure Emails
- Command Center App >  Get M365 Service Messages
- Command Center App > Initially Populate Bookmarks
- Command Center App > Get CoE Flows
- Command Center App > Set CoE Flows State
- DLP Editor > Parse impacted resources into CSV
- Admin | Sync Template v3 (Connectors)

>[!IMPORTANT]
> Before proceeding, ensure that the **Admin | Sync Template v3 Configure Emails** and **Admin | Sync Template v3 (Connectors)** flows runs and complete.

## Turn on inventory flows

The Admin \| Sync Template flows part of this solution crawl through all the resources stored in your Microsoft Power Platform environments and make a copy of details in each resource (for example, apps and flows) to Microsoft Dataverse tables. Most apps and flows in the CoE Starter Kit rely on this, which means that the inventory flows must be configured for everything else to work. The sync flows run daily, and some of the clean-up flows run every two weeks.

>[!IMPORTANT]
> If you see an *Invalid Pagination Policy* error when trying to turn on the flows, it indicates that you are using an insufficient or trial license. All our flows require a medium or high performance profile to run. License requirements are listed in our [prerequisites](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).
>
> ![Error when turning on a flow with an insufficient license.](media/flowpaginationerror.png "Error when turning on a flow with an insufficient license.")
>
> Learn more: [Power Automate performance profiles](/power-automate/limits-and-config#performance-profiles) and [Concurrency looping and pagination limits](/power-automate/limits-and-config#concurrency-looping-and-debatching-limits)

- Admin | Sync Template v3 (Apps)
- Admin | Sync Template v3 (Custom Connectors)
- Admin | Sync Template v3 (Desktop Flow - Runs)
- Admin | Sync Template v3 (Desktop flows)
- Admin | Sync Template v3 (Flow Action Details)
- Admin | Sync Template v3 (Flows)
- Admin | Sync Template v3 (Model Driven Apps)
- Admin | Sync Template v3 (Portals)
- Admin | Sync Template v3 (PVA)
- Admin | Sync Template v3 (Sync Flow Errors)
- Admin | Sync Template v3
- CLEANUP - Admin | Sync Template v3 (Check Deleted)
- CLEANUP - Admin | Sync Template v3 (Connection Status)
- CLEANUP - Admin | Sync Template v3 (Delete Bad Data)
- CLEANUP - Admin | Sync Template v3 (Orphaned Makers)
- CLEANUP - Admin | Sync Template v3 (Power Apps User Shared With)

>[!NOTE]
> To load-balance queries against Dataverse, the Admin | Sync Template v3 flow implements a delay between 0 and 12 hours before starting to collect the inventory. This flow therefore might appear to be running for a long time.

The first run of these flows will perform a full inventory of every Power Platform resource (app, flow, bot, environment,...) in your tenant and depending on the size of your tenant, these flows may take a long time to run. Consider setting up [pay-as-you go for Power Platform requests](/power-platform/admin/pay-as-you-go-overview) to avoid these flows getting throttled. More: [Long running flows](limitations.md#long-running-flows).

## Set up the Admin - Command Center App

>[!IMPORTANT]
> Only complete these steps if you want to review Power Platform–related [Microsoft 365 Message Center](/microsoft-365/admin/manage/message-center) updates in the **[Admin - Command Center](core-components.md#admin---command-center)** canvas app. The **Admin - Command Center** app can be used without this configuration.

### Create an Azure AD app registration to connect to Microsoft Graph

The [Admin - Command Center](core-components.md#admin---command-center) connects to [Microsoft Graph API](/graph/api/serviceannouncement-list-messages) to get [Microsoft 365 Message Center](/microsoft-365/admin/manage/message-center) updates.

Using these steps, you'll set up an Azure AD app registration that will be used in a cloud flow to connect to the Graph API. More information: [Use the Microsoft Graph API](/graph/use-the-api)

1. Sign in to [portal.azure.com](https://portal.azure.com).

1. Go to **Azure Active Directory** > **App registrations**.

   ![Azure AD app registration.](media/coe33.png "Azure AD app registration")

1. Select **+ New Registration**.

1. Enter a name (for example, **CoE Command Center**), don't change any other setting, and then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

   ![API Permissions - Add a permission.](media/coe34.png "Add a permission")

1. Select **Microsoft Graph**, and configure permissions as follows:

   1. Select **Delegated permissions**, and then select **ServiceMessage.Read.All**.
   1. Select **Application permissions**, and then select **ServiceMessage.Read.All**.
   1. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**.

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.

   ![New client secret.](media/coe39.png "New client secret")

1. Add a description and expiration (in line with your organization's policies), and then select **Add**.

1. Copy and paste the **Secret** to a text document in Notepad for the time being.

1. Select **Overview**, and copy and paste the application (client) ID value to the same text document; be sure to make a note of which GUID is for which value.

### Update environment variables

[Update the environment variables](faq.md#update-environment-variables) that hold the client ID and secret as shown in the following table. You can store the client secret either in plain text in the **Command Center - Client Secret** environment variable (not recommended) or create store the client secret in Azure Key Vault and reference it in the **Command Center - Client Azure Secret** environment variable (recommended). Learn more: [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets)

>[!NOTE]
> The flow using this environment variable is configured with a condition to expect either the Command Center - Client Secret or the Command Center - Client Azure Secret environment variable. It is not necessary to edit the flow or command center application to work with Azure Key Vault.

| Name | Description |
|------|---------------|
| Command Center - Application Client ID | The application client ID from the [Create an Azure AD app registration to connect to Microsoft Graph](#create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step. |
| Command Center - Client Secret | The application client secret from the [Create an Azure AD app registration to connect to Microsoft Graph](#create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're using Azure Key Vault to store your client ID and secret. |
| Command Center - Client Azure Secret | The Azure Key Vault reference for the application client secret from the [Create an Azure AD app registration to connect to Microsoft Graph](#create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're storing your client ID in plain text in the Command Center - Client Secret environment variable. Note that this variable expects the Azure Key Vault reference, not the secret. Learn more: [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets)|

### Modify the Command Center App > Get M365 Service Messages flow for a GCC High or DoD tenant

>[!IMPORTANT]
>If your CoE Starter Kit is installed in a commercial or GCC tenant, you can skip this step.

1. If your CoE Starter Kit is installed in a GCC High or DoD tenant, update the **Authority** in HTTP action:
    1. Go to [flow.microsoft.com](https://flow.microsoft.com), select **Solutions**, and then open the **Center of Excellence - Core Components** solution to view the flows.
    1. Edit the **Command Center App >  Get M365 Service Messages** flow.
    1. Update the **List serviceAnnouncements from Graph** action and change the **Authority** to https://login.microsoftonline.us/ for a GCC High or DoD tenant.
    1. **Save** this flow.

## Set up Audit Logs solution

The Audit Log Sync flow connects to the Microsoft 365 audit log to gather telemetry data (unique users, launches) for apps. The CoE Starter Kit will work without this flow; however, usage information (app launches, unique users) in the Power BI dashboard will be blank. More information: [Set up the audit log connector](setup-auditlog.md)

## Set up the Power BI dashboard

The CoE Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant: environments, apps, Power Automate flows, connectors, connection references, makers, and audit logs. Telemetry from the audit log is stored from the moment you set up the CoE Starter Kit, so over time you can look back and identify trends for longer than 28 days. More information: [Set up the Power BI dashboard](setup-powerbi.md)

## Share apps with other admins

The core components solution contains apps designed to give admins better visibility and overview of resources and usage in their environments.

Share these apps with other Power Platform admins and assign them the **Power Platform Admin SR** security role:

- [Admin - Command Center](core-components.md#admin---command-center)
- [DLP Editor v2](core-components.md#dlp-editor-v2)
- [Power Platform Admin View](core-components.md#power-platform-admin-view)
- [Set App Permissions](core-components.md#set-app-permissions)
- [Set Flow Permissions](core-components.md#set-flow-permissions)

Take a look at the [Admin - Command Center](core-components.md#admin---command-center) app, which is your central place to open all CoE Starter Kit apps from.

More information:

- [Share a canvas app in Power Apps](faq.md#share-an-app-from-a-production-environment)
- [Share a canvas app in Microsoft Teams](faq.md#share-an-app-from-a-dataverse-for-teams-environment)

## Wait for flows to finish

After the sync flows have finished running, you're ready to use many of the features of the CoE Starter Kit core solution.  

The first run of the inventory can take a few hours depending on the number of environments and resources in your tenants. Future runs will be faster, because they'll only look at new and modified resources.

**To check the status of a flow**

1. Select **Admin \| Sync Template v3**.

   This will open a new tab to the **Flow detail** page.

1. View **Runs**.

## What's next?

- Learn how to [regularly upgrade and extend](after-setup.md) the CoE Starter Kit.
- Check out [other components part of the core solution](core-components.md#environment-request-management-components), and the [governance](governance-components.md) and [nurture](nurture-components.md) solutions.

## All environment variables

This section includes the full list of environment variables that affect the inventory sync flows, including environment variables with default values. You might have to [update environment variables](faq.md#update-environment-variables) after import.

>[!IMPORTANT]
> You don't have to change the values during setup, just when you need to change the value of an environment variable that you configured during import or when you want to change a default value. To make sure the latest values are picked up, restart all flows after you change environment variables.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default Value |
|------|---------------|------|
|Admin eMail |CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list. | Not applicable |
| Admin eMail Preferred Language | The preferred language for the emails sent to the admin email alias, which is specified in the Admin eMail environment variable. | en-US |
|Also Delete from CoE | When running the "Admin \| Sync Template v2 (Check Deleted)" flow, delete the items from CoE (yes) or just mark deleted (no)  | Yes |
| Command Center - Application Client ID | (optional) The application client ID from the [Create an Azure AD app registration to connect to Microsoft Graph](#create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step earlier in this article. Leave empty if you'd like to use Azure Key Vault to store your client ID and secret. | Not applicable |
| Command Center - Client Secret | (optional) The application client secret from the [Create an Azure AD app registration to connect to Microsoft Graph](#create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step earlier in this article. Leave empty if you'd like to use Azure Key Vault to store your client ID and secret. | Not applicable |
| Command Center - Client Azure Secret | The Azure Key Vault reference for the application client secret from the [Create an Azure AD app registration to connect to Microsoft Graph](#create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you're storing your client ID in plain text in the Command Center - Client Secret environment variable.  Learn more: [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets)| Not applicable |
| DelayInventory | If Yes, runs a delay step to assist with the Dataverse load balancing. Only set this to No for debugging. | Yes |
| eMail Header Style | The CSS / Style to use for eMails | [Default CSS](/power-platform/guidance/coe/code-samples/css/default-value-email-header-style) |
| eMail Body Start | Starting HTML format for eMails | Default style provided |
| eMail Body Stop | Ending HTML format for eMails | Default style provided |
| FullInventory | Determines whether you want to update only objects that have changed, or all objects. Switching to Yes will cause the flows to inventory every single app, flow, and bot in the tenant every day, and isn't recommended for large tenants.  | No |
| Is Teams Install | DO NOT EDIT. This is used to determine whether this installation is in a production environment or Dataverse for Teams environment, and is set for you when you first install the components. | No: Core solution<br>Yes: Core for Teams solution |
| Power Platform Maker Microsoft 365 Group | Get the ID of the Microsoft 365 group which will contain all your Power Platform makers. You'll use this to communicate and share apps with them. This is needed for the inventory setup in the Admin \| Add Maker to Group flow. More information: [How will you communicate with your admins, makers, and users?](setup.md#how-will-you-communicate-with-your-admins-makers-and-end-users) | Not applicable |
|Power Automate environment variable | The URL used by Power Automate for your cloud.<br> For an environment in the commercial cloud: <https://flow.microsoft.com/manage/environments/> <br>For a GCC, GCC High, or DoD environment, check [Power Automate US government service URLs](/power-automate/us-govt#power-automate-us-government-service-urls). | Not applicable |
|PowerApp Maker environment variable | The URL used by the Power Apps maker portal for your cloud, including trailing slash. <br> For an environment in the commercial cloud: <https://make.powerapps.com/> <br>For a GCC, GCC High, or DoD environment, check [Power Apps US Government service URLs](../../admin/powerapps-us-government.md#power-apps-us-government-service-urls). | Not applicable|
|PowerApp Player environment variable | The URL used by the Power Apps player for your cloud, including trailing slash.<br> For an environment in the commercial cloud: <https://apps.powerapps.com/> <br> For a GCC environment: <https://apps.gov.powerapps.us/> <br>For a GCC High environment: <https://apps.gov.powerapps.us/> <br>For a DoD environment: <https://play.apps.appsplatform.us> | Not applicable |
| ProductionEnvironment | Set to No if you're creating a development/test environment. This will allow some flows to set target users to the admin instead of resource owners.| Yes |
| TenantID | Your Azure Tenant ID.| Not applicable|

## It looks like I found a bug with the CoE Starter Kit; where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).



[!INCLUDE[footer-include](../../includes/footer-banner.md)]
