---
title: "Collect audit logs using an HTTP action | MicrosoftDocs"
description: "The Audit Log Sync flow connects to the Audit Log using an HTTP action in a cloud flow to gather telemetry data (unique users, launches) for apps in Microsoft 365."
author: manuelap-msft

ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/06/2023
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Collect audit logs using an HTTP action

The audit log sync flows connect to the [Office 365 Management API](/office/office-365-management-api/office-365-management-activity-api-reference) to gather telemetry data, such as unique users and launches, for apps. The flows use an HTTP action to access the API. In the following instructions, you'll set up the app registration for the HTTP action and the environment variables needed to run the flows.

The Center of Excellence (CoE) Starter Kit works without these flows, but the usage information, such as app launches and unique users, in the Power BI dashboard will be blank.

> [!IMPORTANT]
> Complete the instructions in [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) before continuing with the setup in this article. This article assumes you have your [environment set up](setup.md#create-your-environments) and are logged in with the [correct identity](setup.md#what-identity-should-i-install-the-coe-starter-kit-with).
>
> Only set up the audit log flows if you've chosen [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.

## Before you set up the audit log flows

1. Microsoft 365 audit log search must be turned on for the audit log connector to work. More information: [Turn audit log search on or off](/microsoft-365/compliance/turn-audit-log-search-on-or-off?preserve-view=true&view=o365-worldwide)
1. Your tenant must have a subscription that supports unified audit logging. More information: [Security & Compliance Center availability for business and enterprise plans](/office365/servicedescriptions/office-365-platform-service-description/office-365-securitycompliance-center)
1. A global admin is required to configure the Microsoft Entra app registration.

The Office 365 Management APIs use Microsoft Entra ID to provide authentication services that you can use to grant rights for your application to access them.

## Create a Microsoft Entra app registration for the Office 365 Management API

Using these steps, you can set up a Microsoft Entra app registration for an HTTP call in a Power Automate flow to connect to the audit log. More information: [Get started with Office 365 Management APIs](/office/office-365-management-api/get-started-with-office-365-management-apis)

1. Sign in to [portal.azure.com](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **App registrations**.
   :::image type="content" source="media/coe33.png" alt-text="Screenshot showing the Microsoft Entra app registration.":::

1. Select **+ New Registration**.

1. Enter a name, such as **Microsoft 365 Management**, don't change any other setting, and then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

   :::image type="content" source="media/coe34.png" alt-text="Add API permissions":::

1. Select **Office 365 Management API** and configure permissions as follows:

   1. Select **Application permissions**, and then select **ActivityFeed.Read**.

      :::image type="content" source="media/coe36new.png" alt-text="Application permissions":::

   1. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**. Prerequisites: [Grant tenant-wide admin consent to an application](/azure/active-directory/manage-apps/grant-admin-consent#prerequisites)

   The API permissions now reflect delegated **ActivityFeed.Read** with a status of **Granted for _(your organization)_**.

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.

   :::image type="content" source="media/coe39.png" alt-text="New client secret":::

1. Add a description and expiration in line with your organization's policies, and then select **Add**.

1. Copy and paste the application (client) ID to a text document in Notepad for the time being.

1. Select **Overview** and copy and paste the application (client) ID and directory (tenant) ID values to the same text document. Be sure to make a note of which GUID is for which value. You'll need these values when you configure the custom connector.

### Update environment variables

Environment variables are used to store the client ID and secret for the app registration, and the audience and authority service endpoints depending on your cloud (commercial, GCC, GCC High, DoD) for the HTTP action. Update the [environment variables](faq.md#update-environment-variables) before turning on the flows.

You can store the client secret either in plain text in the **Audit Logs - Client Secret** environment variable, which is not recommended. Instead, we recommend that you create and store the client secret in Azure Key Vault and reference it in the **Audit Logs - Client Azure Secret** environment variable.

>[!NOTE]
> The flow using this environment variable is configured with a condition to expect either the **Audit Logs - Client Secret** or the **Audit Logs - Client Azure Secret** environment variable. It is not necessary to edit the flow to work with Azure Key Vault.

| Name | Description | Values |
|------|------------|---------|
| Audit Logs - Audience | The audience parameter for the HTTP calls. | Commercial (Default): https://<span>manage</span>.office.com<br><br>GCC: https://<span>manage-gcc</span>.office.com<br><br>GCC High: https://<span>manage</span>.office365.us><br><br>DoD: https://<span>manage</span>.protection.apps.mil|
| Audit Logs - Authority | The authority field in the HTTP calls. | Commercial (Default): https://<span>login</span>.windows.net<br><br>GCC: https://<span>login</span>.windows.net<br><br>GCC High: https://<span>login</span>.microsoftonline.us<br><br>DoD: https://<span>login</span>.microsoftonline.us |
| Audit Logs - ClientID | App registration Client ID. | The application client ID from the [Create a Microsoft Entra app registration for the Office 365 Management API](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api) step. |
| Audit Logs - Client Secret | App registration client secret in plain text. | The application client secret from the [Create a Microsoft Entra app registration for the Office 365 Management API](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api) step. Leave empty if you're using Azure Key Vault to store your client ID and secret. |
| Audit Logs - Client Azure Secret | Azure Key Vault reference of the App registration client secret.  | The Azure Key Vault reference for the application client secret from the [Create a Microsoft Entra app registration for the Office 365 Management API](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api) step. Leave empty if you're storing your client ID in plain text in the **Audit Logs - Client Secret** environment variable. This variable expects the Azure Key Vault reference, not the secret. Learn more: [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview)|

### Start a subscription to audit log content

1. Go to [make.powerapps.com](https://make.powerapps.com).
2. Select **Solutions**.
3. Open the **Center of Excellence – Core Components** solution.
4. Turn the **Admin \| Audit Logs \| Office 365 Management API Subscription** flow on and run it, enter *start* as the operation to run.
    :::image type="content" source="media/coe-startsubscription.png" alt-text="Start the subscription":::
1. Open the flow and verify that the action to start the subscription has passed.
    :::image type="content" source="media/coe-startsubscription-passed.png" alt-text="Start the subscription passed":::

> [!IMPORTANT]
> If you have previously enabled the subscription, you will see a **(400) The subscription is already enabled** message. This means the subscription has successfully been enabled in the past. You can ignore this error and continue with the setup.
> 
> If you don't see the above message or a (200) response, the request may have failed. There could be an error with your setup that's keeping the flow from working. Common issues to check are:
>
> - Are audit logs enabled, and do you have permission to view the audit logs? Check by seeing if you can search in [Microsoft Compliance Manager](https://compliance.microsoft.com/auditlogsearch).
> - Have you enabled the audit log very recently? If so, try again in a few minutes, to give the audit log time to activate.
> - Validate that you correctly followed the steps in [Microsoft Entra app registration](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api).
> - Validate that you correctly updated the environment variables for these flows.

### Turn on flows

1. Go to [make.powerapps.com](https://make.powerapps.com).
2. Select **Solutions**.
3. Open the **Center of Excellence – Core Components** solution.
4. Turn the **Admin | Audit Logs | Sync Audit Logs (V2)** flow on. This flow will run on an hourly schedule, and collect audit log events into the Audit Log table.

## How to get older data

This solution collects app launches from the moment it's configured, and is not set up to collect historic app launches. Depending on your [Microsoft 365 license](/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance#before-you-search-the-audit-log), historic data will be available for up to a year using the audit log in Microsoft Purview.

You can load historic data into the CoE Starter Kit tables manually using one of the flows provided in the solution, as described here.

> [!NOTE]
> The user retrieving audit logs must have permission to the audit logs. More information: [Before you search the audit logs](/microsoft-365/compliance/audit-log-search?preserve-view=true&view=o365-worldwide#before-you-search-the-audit-log)

1. Browse to the [Audit Log search](https://compliance.microsoft.com/auditlogsearch).
1. Search for the Launched app activity in the date range available to you.
    :::image type="content" source="media/coe-oldauditlogs-1.png" alt-text="Get old audit logs":::
1. Once the search has run, select **Export** to download the results.
    :::image type="content" source="media/coe-oldauditlogs-2.png" alt-text="Download old audit logs":::
1. Browse to the following flow in the core solution: **Admin | Audit Logs | Load events from exported Audit Log CSV file**
1. Turn the flow on and run it, selecting the downloaded file for the Audit Log CSV parameter.
    :::image type="content" source="media/coe-oldauditlogs-3.png" alt-text="Load old audit logs via flow":::
   > [!NOTE]
   > If you don't see the file loading after selecting **Import**, it may exceed the allowed content size for this trigger. Try breaking up the file into smaller files (50,000 rows per file) and run the flow once per file. The flow can be run simultaneously for multiple files.
1. When complete, these logs will be included in your telemetry. The last launched list for the apps will be updated if more recent launches are found.

## It looks like I found a bug with the CoE Starter Kit. Where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
