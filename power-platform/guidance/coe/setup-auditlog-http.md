---
title: "Collect audit logs using an HTTP action"
description: "Connect audit log sync flows to the audit log using an HTTP action in a cloud flow to gather telemetry data (unique users, launches) for apps in Microsoft 365."
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

The audit log sync flows connect to the [Office 365 Management Activity API reference](/office/office-365-management-api/office-365-management-activity-api-reference) to gather telemetry data, such as unique users and launches for apps. The flows use an HTTP action to access the API. In this article, you set up the app registration for the HTTP action and the environment variables needed to run the flows.

> [!NOTE]
> The Center of Excellence (CoE) Starter Kit works without these flows, but the usage information, such as app launches and unique users, in the Power BI dashboard is blank.

## Prerequisites

1. Complete the [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) articles.
1. [Set up your environment](setup.md#create-your-environments).
1. Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

> [!TIP]
> Set up the audit log flows only if you chose [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.

## Before you set up the audit log flows

1. Microsoft 365 audit log search must be turned on for the audit log connector to work. For more information, see [Turn audit log search on or off](/microsoft-365/compliance/turn-audit-log-search-on-or-off?preserve-view=true&view=o365-worldwide).
1. Your tenant must have a subscription that supports unified audit logging. For more information, see [Security & Compliance Center availability for business and enterprise plans](/office365/servicedescriptions/office-365-platform-service-description/office-365-securitycompliance-center).
1. A global admin is required to configure the Microsoft Entra app registration.

> [!NOTE]
> The Office 365 Management APIs use Microsoft Entra ID to provide authentication services that you can use to grant rights for your application to access them.

## Create a Microsoft Entra app registration for the Office 365 Management API

Using these steps, you can set up a Microsoft Entra app registration for an HTTP call in a Power Automate flow to connect to the audit log. For more information, see [Get started with Office 365 Management APIs](/office/office-365-management-api/get-started-with-office-365-management-apis).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **App registrations**.
   :::image type="content" source="media/coe33.png" alt-text="Screenshot showing the location of the App registrations Azure service.":::

1. Select **+ New Registration**.

1. Enter a name, such as **Microsoft 365 Management**, but don't change any other setting, and then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.
   :::image type="content" source="media/coe34.png" alt-text="Screenshot showing the location of the +Add a permission button of the API permissions menu.":::

1. Select **Office 365 Management API** and configure permissions as follows:

   a. Select **Application permissions**, and then select **ActivityFeed.Read**.
      ![Application permissions](media/coe36new.png "Application permissions")

   b. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**. To set up admin content, see [Grant tenant-wide admin consent to an application](/azure/active-directory/manage-apps/grant-admin-consent#prerequisites).

   The API permissions now reflect delegated **ActivityFeed.Read** with a status of **Granted for _(your organization)_**.

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.
   :::image type="content" source="media/coe39.png" alt-text="Screenshot that shows the location of the +New client secret button on the Certificates & secrets menu.":::

1. Add a description and expiration in line with your organization's policies, and then select **Add**.

1. Copy and paste the application (client) ID to a text document such as Notepad.

1. Select **Overview** and copy and paste the application (client) ID and directory (tenant) ID values to the same text document. Be sure to make a note of which GUID is for which value. You need these values when you configure the custom connector.

### Update environment variables

Environment variables are used to store the client ID and secret for the app registration. Variables are also used to store audience and authority service endpoints, depending on your cloud (commercial, GCC, GCC High, DoD) for the HTTP action. Update the [environment variables](faq.md#update-environment-variables) before turning on the flows.

You can store the client secret either in plain text in the **Audit Logs - Client Secret** environment variable, which isn't recommended. Instead, we recommend you create and store the client secret in the Azure Key Vault and reference it in the **Audit Logs - Client Azure Secret** environment variable.

> [!NOTE]
> The flow using this environment variable is configured with a condition to expect either the **Audit Logs - Client Secret** or the **Audit Logs - Client Azure Secret** environment variable. However, you don't need to edit the flow to work with Azure Key Vault.

| Name | Description | Values |
|------|-------------|--------|
| Audit Logs - Audience | The audience parameter for the HTTP calls | Commercial (Default): `https://manage.office.com`<br><br>GCC: `https://manage-gcc.office.com`<br><br>GCC High: `https://manage.office365.us`<br><br>DoD: `https://manage.protection.apps.mil`|
| Audit Logs - Authority | The authority field in the HTTP calls | Commercial (Default): `https://login.windows.net`<br><br>GCC: `https://login.windows.net`<br><br>GCC High: `https://login.microsoftonline.us`<br><br>DoD: `https://login.microsoftonline.us` |
| Audit Logs - ClientID | App registration Client ID | The application client ID is from the [Create a Microsoft Entra app registration for the Office 365 Management API](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api) step. |
| Audit Logs - Client Secret | App registration client secret (not the secret ID but the actual value) in plain text | The application client secret is from the [Create a Microsoft Entra app registration for the Office 365 Management API](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api) step. Leave empty if you're using Azure Key Vault to store your client ID and secret. |
| Audit Logs - Client Azure Secret | Azure Key Vault reference of the App registration client secret  | The Azure Key Vault reference for the application client secret is from the [Create a Microsoft Entra app registration for the Office 365 Management API](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api) step. Leave empty if you're storing your client ID in plain text in the **Audit Logs - Client Secret** environment variable. This variable expects the Azure Key Vault reference, not the secret. For more information, see [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview).|

### Start a subscription to audit log content

1. Go to [make.powerapps.com](https://make.powerapps.com).
2. Select **Solutions**.
3. Open the **Center of Excellence – Core Components** solution.
4. Turn on the **Admin | Audit Logs | Office 365 Management API Subscription** flow and run it, enter _start_ as the operation to run.
   :::image type="content" source="media/coe-startsubscription.png" alt-text="Screenshot that shows the location of the Run button in the navigation bar and the start operation in the Run flow pane.":::
5. Open the flow and verify that the action to start the subscription is passed.
   :::image type="content" source="media/coe-startsubscription-passed.png " alt-text="Screenshot that shows the Status code of 200 in the StartSubscription window.":::

> [!IMPORTANT]
> If you previously enabled the subscription, you see a _(400) The subscription is already enabled_ message. This means the subscription successfully enabled in the past. You can ignore this message and continue with the setup.
> If you don't see the above message or a (200) response, the request likely failed. There might be an error with your setup that's keeping the flow from working. Common issues to check are:
>
> - Are audit logs enabled, and do you have permission to view the audit logs? Test if the logs are enabled by searching in [Microsoft Compliance Manager](https://compliance.microsoft.com/auditlogsearch).
> - Did you enable the audit log recently? If so, try again in a few minutes, to give the audit log time to activate.
> - Validate that you correctly followed the steps in [Microsoft Entra app registration](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api).
> - Validate that you correctly updated the environment variables for these flows.

### Turn on flows

1. Go to [make.powerapps.com](https://make.powerapps.com).
1. Select **Solutions**.
1. Open the **Center of Excellence – Core Components** solution.
1. Turn on the Admin | Audit Logs | Update Data (V2) flow. This flow updates the PowerApps table with last launch information and adds metadata to the audit logs records.
1. Turn on the Admin | Audit Logs | Sync Audit Logs (V2) flow. This flow runs on an hourly schedule and collects audit log events into the audit log table.

## How to get older data

This solution collects app launches after being configured, but isn't set up to collect historic app launches. Depending on your [Microsoft 365 license](https://www.microsoft.com/licensing/docs), historic data is available for up to one year using the audit log in Microsoft Purview.

You can load historic data into the CoE Starter Kit tables manually, using one of the flows in the solution.

> [!NOTE]
> The user retrieving audit logs needs permission to access them. For more information, see [Before you search the audit logs](/microsoft-365/compliance/audit-log-search?preserve-view=true&view=o365-worldwide#before-you-search-the-audit-log).

1. Browse to the [Audit Log search](https://compliance.microsoft.com/auditlogsearch).
1. Search for the Launched app activity in the date range available to you.
   :::image type="content" source="media/coe-oldauditlogs-1.png" alt-text="Screenshot that highlights the date range and launched app activity for a search in the Audit page of Microsoft Purview.":::
1. Once the search runs, select **Export** to download the results.
   :::image type="content" source="media/coe-oldauditlogs-2.png" alt-text="Screenshot that highlights the Completed Job status and Export button after an audit search.":::
1. Browse to this flow in the core solution: **Admin | Audit Logs | Load events from exported Audit Log CSV file**.
1. Turn on the flow and run it, selecting the downloaded file for the Audit Log CSV parameter.
   :::image type="content" source="media/coe-oldauditlogs-3.png" alt-text="Screenshot that shows the Audit Log CSV import field and Run flow button of the Run flow pane.":::

   > [!NOTE]
   > If you don't see the file loading after selecting **Import**, it might exceed the allowed content size for this trigger. Try breaking up the file into smaller files (50,000 rows per file) and run the flow once per file. The flow can be run simultaneously for multiple files.
1. When complete, these logs are included in your telemetry. The _last launched_ list for the apps is updated if more recent launches are found.

## Troubleshooting

### API permissions

Go to your app registration and validate that you have the correct API permissions. Your app registration requires application permissions not delegated. Validate that the status is _Granted_.
:::image type="content" source="media/auditlog-troubleshoot-1.png" alt-text="Screenshot that highlights the Application type and Granted for status of a configured permission.":::

### Secret environment variable - Azure secret

If you're using Azure Key value to store the app registration secret, validate that the Azure Key Vault permissions are correct.
A user needs to be in the _Key Vault Secret User_ role to read and in the _Key Vault Contributor_ role to update.
:::image type="content" source="media/auditlog-troubleshoot-2.png" alt-text="Screenshot that shows the Key Vault Contributor and Key Vault Secrets User roles.":::

If you have other issues with Azure Key Vault regarding a firewall, static IPs for Dataverse Environment, or other such feature issues,  contact product support to resolve them.

### Secret Environment Variable - plain text

If you're using plain text to store the app registration secret, validate that you entered the secret value itself and not the secret ID. The secret value is a longer string with a larger character set than a GUID, for example the string might have tilde characters.

## I found a bug with the CoE Starter Kit. Where should I go?

To file a bug against the solution, go to [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
