---
title: "Set up inventory components | MicrosoftDocs"
description: "Setup instructions for how to set up the core admin components solution of the CoE Starter Kit"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/13/2021
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

This article will help you setup the inventory components of the Core solution of the CoE Starter Kit. The inventory is the heart of the CoE and before embarking on your Power Platform adoption journey, you'll want to first understand if you have existing apps, flows and makers and lay the foundation to monitor new apps and flows being created.

The flows in this solution sync all your resources into tables and build admin apps, flows and dashboards on top of this inventory to help you get a holistic overview into the apps, flows, and makers that exist in your environment. Additionally, apps like DLP Editor and Set App Permissions help with daily admin tasks.

Watch how to setup the core components solution.

> [!VIDEO https://www.youtube.com/embed/Z9Vp2IxFzpU]

>[!IMPORTANT]
>Get started by completing the **[Get started](setup.md)** instructions. This article assumes you have your environment setup, and are logged in with the correct identity.

## Before you start

### Gather Environment variable values

During solution import, you will configure environment variable values. Make sure to have the below information ready:

| Name | Description |
|------|---------------|
|Admin eMail |This is the email address to which most admin communications in the starter kit will be sent. Please refer to [What groups will you use](internal link to Before you Setup)  |
| Power Platform Maker Microsoft 365 Group | Get the ID of the Microsoft 365 group which will contain all your Power Platform Makers. [Create a new group](/microsoft-365/admin/create-groups/create-groups?view=o365-worldwide#create-a-microsoft-365-group) if needed. You will use this to communicate and share apps with them. It is needed for the inventory setup in the Admin \| Add Maker to Group flow. See: [What groups will you use](setup.md#how-will-you-communicate-with-your-admins-makers-and-end-users) |
| Command Center - Application Client ID | (optional) Enter the application client ID from the [Create an Azure AD app registration to connect to Microsoft Graph](#optional-create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you would like to use Azure KeyVault to store your client ID and secret. |
| Command Center - Client Secret | (optional) Enter the application client secret from the [Create an Azure AD app registration to connect to Microsoft Graph](#optional-create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step. Leave empty if you would like to use Azure KeyVault to store your client ID and secret. |
|Power Automate environment variable | The URL used by flow for your region. Here are examples:<br> For a US environment: <https://us.flow.microsoft.com/manage/environments/> <br> For a Canadian environment: <https://canada.flow.microsoft.com/manage/environments/> <br>For an EMEA environment: <https://emea.flow.microsoft.com/manage/environments/> <br>For a GCC environment: <https://gov.flow.microsoft.us/manage/environments/> <br> For a GCC High environment: <https://high.flow.microsoft.us/manage/environments><br> For a DoD environment: <https://flow.appsplatform.us/manage/environments/><br>If your region is not listed here, navigate to [flow.microsoft.com](https://flow.microsoft.com) and copy the URL the page directs to from the browser.|
|PowerApp Maker environment variable | The maker URL used by PowerApps for your cloud, including trailing slash. Here are examples:<br> For a US environment: <https://make.powerapps.com/> <br> For a GCC environment: <https://make.gov.powerapps.us/> <br>For a GCC High environment: <https://make.high.powerapps.us/> |
|PowerApp Player environment variable | The player URL used by PowerApps for your cloud, including trailing slash. Here are examples:<br> For a US environment: <https://apps.powerapps.com/> <br> For a GCC environment: <https://apps.gov.powerapps.us/> <br>For a GCC High environment: <https://apps.gov.powerapps.us/> <br>For a DoD environment: <https://play.apps.appsplatform.us> |
| TenantID | Your Azure Tenant ID.|

### Create connections

We recommend to create connections to all connectors used in the solution prior to importing the solution, this will make the setup faster.

1. Navigate to [flow.microsoft.com](https://flow.microsoft.com/).
1. Select your CoE environment and navigate to **Data > Connections > + New connection**.
1. Create a connection for
    - [Approvals](/connectors/approvals/)
    - [Azure AD](/connectors/azuread/)
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
1. When you create the connection for HTTP with Azure AD enter the following into the Base Resource URL and Azure AD Resource URI (Application ID URI): [https://graph.microsoft.com](https://graph.microsoft.com) for commercial tenants. If your tenant is in GCC, GCC High or DoD check your [service root endpoint for Microsoft Graph](/graph/deployments#microsoft-graph-and-graph-explorer-service-root-endpoints).

     ![Establish HTTP with Azure AD.](media/httpazuread.png "Establish connections to activate your solution.")

### (Optional) Create an Azure AD app registration to connect to Microsoft Graph

>[!NOTE]
> Only complete this steps if you want to review Power Platform related [Microsoft 365 Message Center](/microsoft-365/admin/manage/message-center) updates in the [Admin - Command Center](core-components.md#admin---command-center) canvas app.

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

1. Select **Overview**, and copy and paste the application (client) ID value to the same text document; be sure to make a note of which GUID is for which value. You'll need these values in the next step as you configure the custom connector.

## Import the Core components solution

1. Download the CoE Starter Kit compressed file ([aka.ms/CoeStarterKitDownload](https://aka.ms/CoeStarterKitDownload)).

    >[!IMPORTANT]
    > **Extract the zip file** after downloading and before moving on to the next step. The CoE Starter Kit compressed file contains all solution components as well as non-solution aware components that make up the CoE Starter Kit.

1. Import the solution
    1. If [Installing to Production Environment](faq.md#installing-a-solution-in-a-production-environment) – use the solution file from the download called CenterOfExcellenceCoreComponents_x_x_x_xx_managed.zip.
    1. If [Installing to Dataverse for Teams Environment](faq.md#installing-a-solution-in-a-dataverse-for-teams-environment) – use the solution file from the download called CenterOfExcellenceCoreComponentsTeams_x_x_x_xx_managed.zip.

1. Update environment variable values with the [relevant information](#gather-environment-variable-values). The environment variables are used to store application and flow configuration data with data specific to your organization or environment. This means that you only have to set the value once per environment and it will be used in all necessary flows and apps in that environment. All the flows in the solution depend on all environment variables' being configured.
1. The import can take up to 15 minutes to be completed.

## Turn on child flows

There are several child flows which will need to be **turned on** in this order:

- HELPER – Send Email
- HELPER – Maker Check
- HELPER – CloudFlowOperations
- HELPER – CanvasAppOperations
- HELPER – ObjectOperations
- CLEANUP HELPER – Check Deleted (Canvas Apps)
- CLEANUP HELPER – Check Deleted (Cloud Flows)
- CLEANUP HELPER – Check Deleted (Custom Connectors)
- CLEANUP HELPER – Check Deleted (Model Driven Apps)
- CLEANUP HELPER – Check Deleted (PVA)
- CLEANUP HELPER – Power Apps User Shared With

If you get an error turning on the flow, you may need to set the [run only user properties](faq.md#set-flow-run-only-users-properties) of the flow.

## Turn on setup flows

The below flows support the inventory setup and need to be **turned on** before proceeding

- Admin | Add Maker to Group
- Admin | Excuse Support Envts from Governance Flows
- Admin | Sync Template v3 Configure Emails
- Command Center App >  Get M365 Service Messages
- Command Center App > Initially Populate Bookmarks
- DLP Editor > Parse impacted resources into CSV

Ensure that the Admin | Sync Template v3 Configure Emails flow runs before moving on.

### Modify the Command Center App > Get M365 Service Messages flow to use Azure KeyVault

1. If you store the client ID and secret for [connecting to Microsoft Graph](#optional-create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) in Environment Variables, you can skip this step.
1. If you store your client ID and secret from in Azure KeyVault, you will need to update the Command Center App > Get M365 Service Messages flow.
1. Go to [flow.microsoft.com](https://flow.microsoft.com), select **Solutions**, and then open the **Center of Excellence - Core Components** solution to view the flows.
1. Edit the **Command Center App >  Get M365 Service Messages** flow.
1. Use the [Azure Key Vault connector](/connectors/keyvault/) to retrieve the client ID and secret in Azure Key Vault.
1. Update the **List serviceAnnouncements from Graph** with your client ID and client secret.
    ![Update HTTP action with client ID and secret](media/commandcenter3.png "Update HTTP action with client ID and secret")
1. **Save** this flow.

### Modify the Command Center App > Get M365 Service Messages flow for a GCC High or DoD tenant

1. If your CoE Starter Kit is installed in a commercial or GCC tenant, you can skip this step.
1. If your CoE Starter Kit is installed in a GCC High or DoD tenant, update the **Authority** the HTTP request runs with.
1. Go to [flow.microsoft.com](https://flow.microsoft.com), select **Solutions**, and then open the **Center of Excellence - Core Components** solution to view the flows.
1. Edit the **Command Center App >  Get M365 Service Messages** flow.
1. Update the **List serviceAnnouncements from Graph** action and change the **Authority** to https://login.microsoftonline.us/ for a GCC High or DoD tenant.
1. **Save** this flow.

## Turn on inventory flows

The Admin \| Sync Template flows part of this solution crawl through all the resources stored in Microsoft Power Platform and make a copy of details in each resource (for example, apps and flows) to Dataverse. Most apps and flows in the CoE Starter Kit rely on this, which means that the inventory flows must be configured for everything else to work. Most sync flows run daily, and some of the clean up flows run every two weeks.

- Admin | Sync Template v3 (Connectors)
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

>![NOTE]
> To load balance queries against Dataverse, the **Admin | Sync Template v3** implements a delay of 0-12 hours before starting to collect the inventory. This flow therefore may appear to be running for a long time.

## Set up Audit Logs solution

The Audit Log Sync flow connects to the Microsoft 365 audit log to gather telemetry data (unique users, launches) for apps. The CoE Starter Kit will work without this flow; however, usage information (app launches, unique users) in the Power BI dashboard will be blank. More information: [Set up the audit log connector](setup-auditlog.md)

## Set up the Power BI dashboard

The CoE Power BI dashboard provides a holistic view with visualizations and insights into resources in your tenant: environments, apps, Power Automate flows, connectors, connection references, makers, and audit logs. Telemetry from the audit log is stored from the moment you set up the CoE Starter Kit, so over time you can look back and identify trends for longer than 28 days. More information: [Set up the Power BI dashboard](setup-powerbi.md)

## Share apps with other admins

The core components solution contains apps designed to give admins better visibility and overview of resources and usage in their environments.

Share these apps with other Power Platform admins and assign them the **Power Platform Admin SR** security role:

- Admin - Access this App
- Admin - Access this Flow
- Admin - Command Center
- DLP Editor v2
- Power Platform Admin View
- Set App Permissions
- Set Flow Permissions

Take a look at the [Admin - Command Center](core-components.md#admin---command-center) app which is your central place to launch all CoE Starter Kit apps from.

More information:
[Share a canvas app in Power Apps](faq.md#update)
[Publish and add an app to Teams](faq.md#update)

## Wait for flows to finish

After the sync flows have finished running, you're ready to use many of the features of the CoE Starter Kit core solution.  

The first run of the inventory can take a few hours depending on the number of environments and resources in your tenants. Future runs will be faster as they will only look at new and modified resources.

**To check the status of a flow**

1. Select **Admin \| Sync Template v3**.

   This will open a new tab to the **Flow detail** page.

1. View **Runs**.

## All environment variables

Here is the full list of environment variables that impact the inventory sync flows, including environment variables with Default values. You may have to [update environment variables](faq.md#update-environment-variables) after import.

>[!IMPORTANT]
> You don't have to change the values during setup, just when you need to change the value of an environment variable that you configured during import or when you want to change a default value. Re-start all flows after you change environment variables, to make sure the latest value is picked up.

Environment variables are used to store application and flow configuration data with data specific to your organization or environment.

| Name | Description | Default Value |
|------|---------------|------|
|Admin eMail |CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list. | n/a|
| Admin eMail Preferred Language | The preferred language for the emails sent to the admin email alias, which is specified in the Admin eMail environment variable. | en-US |
|Also Delete from CoE | When running the "Admin \| Sync Template v2 (Check Deleted)" flow, delete the items from CoE (yes) or just mark deleted (no)  | Yes |
| Command Center - Application Client ID | (optional) Enter the application client ID from the [Create an Azure AD app registration to connect to Microsoft Graph](#optional-create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step above. Leave empty if you would like to use Azure KeyVault to store your client ID and secret. | n/a |
| Command Center - Client Secret | (optional) Enter the application client secret from the [Create an Azure AD app registration to connect to Microsoft Graph](#optional-create-an-azure-ad-app-registration-to-connect-to-microsoft-graph) step above. Leave empty if you would like to use Azure KeyVault to store your client ID and secret. | n/a |
| DelayInventory | If Yes, will run a delay step to assist with the Dataverse load balancing. Only turn to No for debugging. | Yes |
| eMail Header Style | The CSS / Style to use for eMails | [Default CSS](https://docs.microsoft.com/power-platform/guidance/coe/code-samples/css/default-value-email-header-style) |
| eMail Body Start | Starting HTML format for eMails | Default style provided |
| eMail Body Stop | Ending HTML format for eMails | Default style provided |
| FullInventory | Determines if you want to only update objects that have changed, or all objects. Switching to Yes will cause the flows to inventory every single app/flow/etc in the tenant every day, and is not recommended for large tenants.  | No |
| Is Teams Install | DO NOT EDIT. This is used to determine if this install is in a Production environment or Dataverse for Teams environment and is set for you on install. | No - Core solution, Yes - Core for Teams solution |
| Power Platform Maker Microsoft 365 Group | Get the ID of the Microsoft 365 group which will contain all your Power Platform Makers. You will use this to communicate and share apps with them. It is needed for the inventory setup in the Admin | Add Maker to Group flow. See: [What groups will you use](setup.md#how-will-you-communicate-with-your-admins-makers-and-end-users) | n/a |
|Power Automate environment variable | The URL used by flow for your region. Here are examples:<br> For a US environment: <https://us.flow.microsoft.com/manage/environments/> <br> For a Canadian environment: <https://canada.flow.microsoft.com/manage/environments/> <br>For an EMEA environment: <https://emea.flow.microsoft.com/manage/environments/> <br>For a GCC environment: <https://gov.flow.microsoft.us/manage/environments/> | n/a |
|PowerApp Maker environment variable | The maker URL used by PowerApps for your cloud, including trailing slash. Here are examples:<br> For a US environment: <https://make.powerapps.com/> <br> For a GCC environment: <https://make.gov.powerapps.us/> <br>For a GCC High environment: <https://make.high.powerapps.us/> | n/a |
|PowerApp Player environment variable | The player URL used by PowerApps for your cloud, including trailing slash. Here are examples:<br> For a US environment: <https://apps.powerapps.com/> <br> For a GCC environment: <https://apps.gov.powerapps.us/> <br>For a GCC High environment: <https://apps.gov.powerapps.us/> | n/a |
| ProductionEnvironment | Set to No if you are creating a development/test environment. This will allow some flows to set target users to the admin instead of resource owners.| Yes |
| TenantID | Your Azure Tenant ID.| n/a|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
