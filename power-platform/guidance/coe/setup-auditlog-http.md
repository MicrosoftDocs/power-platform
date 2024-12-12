---
title: Collect audit logs using Office 365 Management API
description: Connect audit log sync flows to the audit log using an HTTP action and Office 365 Management API in a cloud flow to gather telemetry data (unique users, launches) for apps in Microsoft 365.
author: pete-msft
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/15/2024
ms.subservice: guidance
ms.author: petrip
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- Grant-Archibald-MS 
---

# Collect audit logs using Office 365 Management API

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

1. Microsoft 365 audit log search must be turned on for the audit log connector to work. Learn more in [Turn audit log search on or off](/microsoft-365/compliance/turn-audit-log-search-on-or-off?preserve-view=true&view=o365-worldwide).
1. Your tenant must have a subscription that supports unified audit logging. Learn more in [Security & Compliance Center availability for business and enterprise plans](/office365/servicedescriptions/office-365-platform-service-description/office-365-securitycompliance-center).
1. Microsoft Entra permissions may be required to configure the Microsoft Entra app registration. Depending on your Entra configuration, this could be an **Application Developer** role or higher. Review [Least privileged roles by task in Microsoft Entra ID](/entra/identity/role-based-access-control/delegate-by-task) for more guidance.

> [!NOTE]
> The Office 365 Management APIs use Microsoft Entra ID to provide authentication services that you can use to grant rights for your application to access them.

## Create a Microsoft Entra app registration for Office 365 Management API access

Using these steps, you can set up a Microsoft Entra app registration for an HTTP call in a Power Automate flow to connect to the audit log. Learn more in [Get started with Office 365 Management APIs](/office/office-365-management-api/get-started-with-office-365-management-apis).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **App registrations**.

   :::image type="content" source="media/coe33.png" alt-text="Screenshot showing the location of the App registrations Azure service." lightbox="media/coe33.png" :::

1. Select **+ New Registration**.

1. Enter a name, such as **Microsoft 365 Management**, but don't change any other setting. Then select **Register**.

1. Select **API Permissions** > **+ Add a permission**.

   :::image type="content" source="media/coe34.png" alt-text="Screenshot showing the location of the +Add a permission button of the API permissions menu." lightbox="media/coe34.png":::

1. Select **Office 365 Management API** and configure permissions as follows:

   1. Select **Application permissions**, and then select **ActivityFeed.Read**.

       :::image type="content" source="media/coe36new.png" alt-text="Screenshot that shows the ActivityFeed.Read setting on the Request API permissions page of the API permissions menu." lightbox="media/coe36new.png":::

   1. Select **Add permissions**.

1. Select **Grant Admin Consent for (your organization)**. Learn more about setting up admin content in [Grant tenant-wide admin consent to an application](/azure/active-directory/manage-apps/grant-admin-consent#prerequisites).

   The API permissions now reflect delegated **ActivityFeed.Read** with a status of **Granted for _(your organization)_**.

1. Select **Certificates and secrets**.

1. Select **+ New client secret**.

1. Add a description and expiration in line with your organization's policies. Then select **Add**.

1. Copy and paste the application (client) ID to a text document such as Notepad.

1. Select **Overview** and copy and paste the application (client) ID and directory (tenant) ID values to the same text document. Be sure to make a note of which GUID is for which value. You need these values when you configure the custom connector.

### Update environment variables

Environment variables are used to control what API to use, legacy Office 365 Management API or Graph API, and to store the client ID and secret for the app registration. Variables are also used to define audience and authority service endpoints, depending on your cloud for the HTTP action. Your type of cloud may be commercial, US Government Coummunity Coud (GCC), US GCC High, or US Department of Defense (DoD). Update the [environment variables](faq.md#update-environment-variables) before turning on the flows.

You can store the client secret either in plain text in the **Audit Logs - Client Secret** environment variable, which isn't recommended. Instead, we recommend you create and store the client secret in the Azure Key Vault and reference it in the **Audit Logs - Client Azure Secret** environment variable.

> [!NOTE]
> The flow using this environment variable is configured with a condition to expect either the **Audit Logs - Client Secret** or the **Audit Logs - Client Azure Secret** environment variable. However, you don't need to edit the flow to work with Azure Key Vault.

| Name | Description | Values |
|------|-------------|--------|
| Audit Logs - Use Graph API | Parameter for controlling if Graph API should be used to query events. | No (default) <br><br>Sync flow uses legacy Office 365 Management API.  |
| Audit Logs - Audience | The audience parameter for the HTTP calls. | Commercial (Default): `https://manage.office.com`<br><br>GCC: `https://manage-gcc.office.com`<br><br>GCC High: `https://manage.office365.us`<br><br>DoD: `https://manage.protection.apps.mil`|
| Audit Logs - Authority | The authority field in the HTTP calls. | Commercial (Default): `https://login.windows.net`<br><br>GCC: `https://login.windows.net`<br><br>GCC High: `https://login.microsoftonline.us`<br><br>DoD: `https://login.microsoftonline.us` |
| Audit Logs - ClientID | The app registration client ID. | The application client ID is from the [Create a Microsoft Entra app registration for Office 365 Management API access](#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step. |
| Audit Logs - Client Secret | The app registration client secret (not the secret ID, but the actual value) in plain text. | The application client secret is from the [Create a Microsoft Entra app registration for the Office 365 Management API access](#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step. Leave empty if you're using Azure Key Vault to store your client ID and secret. |
| Audit Logs - Client Azure Secret | Azure Key Vault reference of the App registration client secret.  | The Azure Key Vault reference for the application client secret is from the [Create a Microsoft Entra app registration for the Office 365 Management API access](#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step. Leave empty if you're storing your client ID in plain text in the **Audit Logs - Client Secret** environment variable. This variable expects the Azure Key Vault reference, not the secret. Learn more in [Use Azure Key Vault secrets in environment variables](/powerapps/maker/data-platform/environmentvariables#use-azure-key-vault-secrets-preview).|

### Start a subscription to audit log content

1. Go to [make.powerapps.com](https://make.powerapps.com).
2. Select **Solutions**.
3. Open the **Center of Excellence – Core Components** solution.
4. Turn on the **Admin | Audit Logs | Office 365 Management API Subscription** flow and run it, enter _start_ as the operation to run.
   
   :::image type="content" source="media/coe-startsubscription.png" alt-text="Screenshot that shows the location of the Run button in the navigation bar and the start operation in the Run flow pane." lightbox="media/coe-startsubscription.png":::
   
6. Open the flow and verify that the action to start the subscription is passed.

> [!IMPORTANT]
> If you previously enabled the subscription, you see a _(400) The subscription is already enabled_ message. This means the subscription successfully enabled in the past. You can ignore this message and continue with the setup.
> 
> If you don't see the above message or a (200) response, the request likely failed. There might be an error with your setup that's keeping the flow from working. Common issues to check are:
>
> - Are audit logs enabled, and do you have permission to view the audit logs? Test if the logs are enabled by searching in [Microsoft Compliance Manager](https://compliance.microsoft.com/auditlogsearch).
> - Did you enable the audit log recently? If so, try again in a few minutes, to give the audit log time to activate.
> - Validate that you correctly followed the steps in [Microsoft Entra app registration](#create-a-microsoft-entra-app-registration-for-office-365-management-api-access).
> - Validate that you correctly updated the environment variables for these flows.

### Turn on flows

1. Go to [make.powerapps.com](https://make.powerapps.com).
1. Select **Solutions**.
1. Open the **Center of Excellence – Core Components** solution.
1. Turn on the **Admin | Audit Logs | Update Data (V2)** flow. This flow updates the Power Apps table with last launch information and adds metadata to the audit logs records.
1. Turn on the **Admin | Audit Logs | Sync Audit Logs (V2)** flow. This flow runs on an hourly schedule and collects audit log events into the audit log table.

## Provide feedback
If you find a bug with the CoE Starter Kit, file a bug against the solution at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
