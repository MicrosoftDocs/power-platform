---
title: Collect audit logs using Microsoft Graph API
description: Learn how to connect audit log sync flows to the audit log by using a Microsoft Graph API action in a cloud flow to gather telemetry data for apps in Microsoft 365.
author: pete-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/15/2024
ms.subservice: guidance-toolkit
ms.author: petrip
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
- Grant-Archibald-MS
  
---

# Collect audit logs using Microsoft Graph API

The audit log sync flows connect to the [Microsoft Audit Logs Graph API](/graph/api/security-auditcoreroot-post-auditlogqueries) to gather telemetry data, such as unique users and launches for apps. The flows use an HTTP action to access the API. In this article, you set up the app registration for the HTTP action and the environment variables that are needed to run the flows.

> [!NOTE]
> The Center of Excellence (CoE) Starter Kit works without these flows. However, if the flows aren't used, usage information such as app launches and unique users is blank in the Power BI dashboard.

## Prerequisites

1. Complete the [Before setting up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md) articles.
1. [Set up your environment](setup.md#create-your-environments).
1. Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

> [!TIP]
> Set up the audit log flows only if you chose [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.

## Before you set up the audit log flows

1. Microsoft 365 audit log search must be turned on for the audit log connector to work. Learn more in [Turn auditing on or off](/microsoft-365/compliance/turn-audit-log-search-on-or-off?preserve-view=true&view=o365-worldwide).
1. Your tenant must have a subscription that supports unified audit logging. Learn more in [Microsoft 365 guidance for security & compliance](/office365/servicedescriptions/office-365-platform-service-description/office-365-securitycompliance-center).
1. Microsoft Entra permissions might be required to configure the Microsoft Entra app registration. Depending on your Microsoft Entra configuration, these permissions could be an **Application Developer** role or higher. You can find more guidance in [Least privileged roles by task in Microsoft Entra ID](/entra/identity/role-based-access-control/delegate-by-task).

> [!NOTE]
> To grant rights for your application to access the Graph APIs, you can use authentication services that the APIs provide through Microsoft Entra ID.

## Create a Microsoft Entra app registration for Graph API access

Follow these steps to set up a Microsoft Entra app registration for an HTTP call in a Power Automate flow to connect to the audit log. Learn more in [Overview of Microsoft Graph](/graph/overview).

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Go to **Microsoft Entra ID** > **App registrations**.

    :::image type="content" source="media/coe33.png" alt-text="Screenshot showing the location of the App registrations Azure service." lightbox="media/coe33.png" :::

1. Select **+&nbsp;New Registration**.
1. Enter a name, such as **Microsoft 365 Management**, but don't change any other setting. Then select **Register**.
1. Select **API Permissions** > **+&nbsp;Add a permission**.

    :::image type="content" source="media/coe34.png" alt-text="Screenshot showing the location of the +Add a permission button of the API permissions menu." lightbox="media/coe34.png":::

1. Select **Microsoft Graph**, and configure permissions as follows:

    1. Select **Application permissions**, and search for **auditlogsquery**.

        :::image type="content" source="media/coe93.png" alt-text="Screenshot that shows the search for AuditLogQuery permissions." lightbox="media/coe93.png":::

    1. Select **AuditLogsQuery.Read.All**.

        :::image type="content" source="media/coe94.png" alt-text="Screenshot that shows the selection of correct permissions." lightbox="media/coe94.png":::

    1. Select **Add permissions**.

1. Select **Grant Admin Consent for \<*your organization*\>**. Learn more about how to set up admin content in [Prerequisites](/azure/active-directory/manage-apps/grant-admin-consent#prerequisites).

    The API permissions now reflect application **AuditLogsQuery.Read.All** permissions with a status of **Granted for \<*your organization*\>**.

1. Select **Certificates and secrets**.
1. Select **+&nbsp;New client secret**.
1. Add a description and expiration in line with your organization's policies. Then select **Add**.
1. Copy and paste the application (client) ID to a text document such as a Notepad file.
1. Select **Overview**, and copy and paste the application (client) ID and directory (tenant) ID values to the same text document. Be sure to make a note of which globally unique identifier (GUID) is for which value. You need these values when you configure the custom connector.

### Update environment variables

Environment variables are used to control whether the legacy Office 365 Management API or the Graph API is used. They are also used to store the client ID and secret for the app registration. In addition, depending on the type of cloud that you use for the HTTP action, they are used to define audience and authority service endpoints. Your cloud type might be commercial, US Government Community Cloud (GCC), US GCC High, or US Department of Defense (DoD). Update the [environment variables](faq.md#update-environment-variables) before you turn on the flows.

You can store the client secret in plain text in the **Audit Logs - Client Secret** environment variable. However, we don't recommend this approach. Instead, we recommend that you create and store the client secret in Azure Key Vault and reference it in the **Audit Logs - Client Azure Secret** environment variable.

> [!NOTE]
> The flow that uses this environment variable is configured with a condition to expect either the **Audit Logs - Client Secret** or **Audit Logs - Client Azure Secret** environment variable. However, you don't need to edit the flow to work with Azure Key Vault.

| Name | Description | Value |
|------|-------------|-------|
| Audit Logs - Use Graph API | A parameter that controls whether Graph API should be used to query events. | **Yes** |
| Audit Logs - Audience | The audience parameter for the HTTP calls. | <ul><li>Commercial (default): `https://graph.microsoft.com`</li><li>GCC: `https://graph.microsoft.com`</li><li>GCC High: `https://graph.microsoft.us`</li><li>DoD: `https://dod-graph.microsoft.us`</li></ul> |
| Audit Logs - Authority | The authority field in the HTTP calls. | <ul><li>Commercial (default): `https://login.windows.net`</li><li>GCC: `https://login.windows.net`</li><li>GCC High: `https://login.microsoftonline.us`</li><li>DoD: `https://login.microsoftonline.us`</li></ul> |
| Audit Logs - ClientID | The app registration client ID. | The application client ID from the [Create a Microsoft Entra app registration for Office 365 Management API access](./setup-auditlog-http.md#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step. |
| Audit Logs - Client Secret | The app registration client secret (not the secret ID, but the actual value) in plain text. | <p>The application client secret from the [Create a Microsoft Entra app registration for Office 365 Management API access](./setup-auditlog-http.md#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step.</p><p>If you're using Azure Key Vault to store your client ID and secret, leave this variable empty.</p> |
| Audit Logs - Client Azure Secret | The Azure Key Vault reference of the app registration client secret. | <p>The Azure Key Vault reference for the application client secret from the [Create a Microsoft Entra app registration for Office 365 Management API access](./setup-auditlog-http.md#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step.</p><p>If you're storing your client ID in plain text in the **Audit Logs - Client Secret** environment variable, leave this variable empty. This variable expects the Azure Key Vault reference, not the secret. Learn more in [Use environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets).

### Turn on flows

1. Go to [make.powerapps.com](https://make.powerapps.com).
1. Select **Solutions**.
1. Open the **Center of Excellence – Core Components** solution.
1. Turn on the **Admin | Audit Logs | Update Data (V2)** flow. This flow updates the Power Apps table with information about the last launch. It also adds metadata to the audit log records.
1. Turn on the **Admin | Audit Logs | Sync Audit Logs (V2)** flow. This flow runs on an hourly schedule and collects audit log events into the audit log table.

## Provide feedback

If you find a bug with the CoE Starter Kit, file a bug against the solution at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
