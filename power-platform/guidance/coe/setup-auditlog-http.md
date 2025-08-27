---
title: Collect audit logs using Office 365 Management API
description: Learn how to connect audit log sync flows to the audit log by using an HTTP action and Office 365 Management API in a cloud flow to gather telemetry data for apps in Microsoft 365.
author: pete-msft
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/27/2025
ms.subservice: guidance-toolkit
ms.author: petrip
ms.reviewer: jhaskett-msft
search.audienceType: 
  - admin
contributors:
   - Grant-Archibald-MS 
ms.custom: sfi-image-nochange
---

# Collect audit logs by using the Office 365 Management API

The audit log sync flows connect to the [Office 365 Management Activity API reference](/office/office-365-management-api/office-365-management-activity-api-reference) to gather telemetry data, such as unique users and launches for apps. The flows use an HTTP action to access the API. In this article, you set up the app registration for the HTTP action and the environment variables that are needed to run the flows.

> [!NOTE]
> The Center of Excellence (CoE) Starter Kit works without these flows. However, if you don't use the flows, usage information such as app launches and unique users is blank in the Power BI dashboard.

## Prerequisites

1. Complete the steps in [Set up the CoE Starter Kit](setup.md) and [Set up inventory components](setup-core-components.md).
1. [Create your environments](setup.md#create-your-environments).
1. Sign in with the [correct identity](setup.md#which-identity-should-i-use-to-install-the-coe-starter-kit).

> [!TIP]
> Set up the audit log flows only if you chose [cloud flows](setup.md#what-data-source-should-i-use-for-my-power-platform-inventory) as the mechanism for inventory and telemetry.

## Before you set up the audit log flows

Before you begin, ensure the following additional prerequisites are met:

- Microsoft 365 audit log search is enabled, as described in [Turn auditing on or off](/microsoft-365/compliance/turn-audit-log-search-on-or-off?preserve-view=true&view=o365-worldwide).
- Your tenant has a subscription that supports unified audit logging. Learn more in [Microsoft 365 guidance for security & compliance](/office365/servicedescriptions/office-365-platform-service-description/office-365-securitycompliance-center).
- Microsoft Entra permissions to configure the Microsoft Entra app registration. Depending on your Microsoft Entra configuration, these permissions could be an **Application Developer** role or higher. Find more guidance in [Least privileged roles by task in Microsoft Entra ID](/entra/identity/role-based-access-control/delegate-by-task).

> [!NOTE]
> To grant rights for your application to access the Office 365 Management APIs, you can use authentication services that the APIs provide through Microsoft Entra ID.

## Create a Microsoft Entra app registration for Office 365 Management API access

Follow these steps to set up a Microsoft Entra app registration for an HTTP call in a Power Automate flow to connect to the audit log. Learn more in [Get started with Office 365 Management APIs](/office/office-365-management-api/get-started-with-office-365-management-apis).

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **App registrations**.

   :::image type="content" source="media/coe33.png" alt-text="Screenshot showing the location of the App registrations Azure service.":::

1. Select **+&nbsp;New Registration**.

1. Enter a name, such as **Microsoft 365 Management**, but don't change any other settings. Then select **Register**.

1. Select **API Permissions** > **+&nbsp;Add a permission**.

   :::image type="content" source="media/coe34.png" alt-text="Screenshot showing the location of the Add a permission button of the API permissions menu.":::

1. Select **Office 365 Management API**, and configure permissions as follows:

   1. Select **Application permissions**, then select **ActivityFeed.Read**.

       :::image type="content" source="media/coe36new.png" alt-text="Screenshot that shows the ActivityFeed.Read setting on the Request API permissions page of the API permissions menu.":::

   1. Select **Add permissions**.

1. Select **Grant Admin Consent for <*your organization*>**. Learn more about  [prerequisites](/azure/active-directory/manage-apps/grant-admin-consent#prerequisites) for setting up admin content.

   The API permissions now reflect delegated **ActivityFeed.Read** permissions with a status of **Granted for \<*your organization*\>**.

1. Select **Certificates and secrets**.

1. Select **+&nbsp;New client secret**.

1. Add a description and expiration in line with your organization's policies. Then select **Add**.

1. Copy and paste the application (client) ID to a text document such as a Notepad file.

1. Select **Overview**, and copy and paste the application (client) ID and directory (tenant) ID values to the same text document. 

    > [!IMPORTANT]
    > Make sure you note which globally unique identifier (GUID) corresponds to each value. You need these values when you configure the custom connector.

### Update environment variables

Use environment variables to choose the legacy Office 365 Management API or the Graph API. Store the client ID and secret for the app registration in environment variables. Depending on your cloud type for the HTTP action, set audience and authority service endpoints with environment variables. Your cloud type can be commercial, US Government Community Cloud (GCC), US GCC High, or US Department of Defense (DoD). Update the new [environment variables](faq.md#update-environment-variables) before you turn on the flows.

You can store the client secret in plain text in the **Audit Logs - Client Secret** environment variable. However, we don't recommend this approach. Instead, create and store the client secret in Azure Key Vault and reference it in the **Audit Logs - Client Azure Secret** environment variable.

> [!NOTE]
> The flow that uses this environment variable is configured with a condition to expect either the **Audit Logs - Client Secret** or **Audit Logs - Client Azure Secret** environment variable. However, you don't need to edit the flow to work with Azure Key Vault.

| Name | Description | Value |
|------|-------------|-------|
| Audit Logs - Use Graph API | A parameter that controls whether Graph API should be used to query events. | <p>**No** (default)</p><p>Sync flow uses the legacy Office 365 Management API.</p> |
| Audit Logs - Audience | The audience parameter for the HTTP calls. | <ul><li>Commercial (default): `https://manage.office.com`</li><li>GCC: `https://manage-gcc.office.com`</li><li>GCC High: `https://manage.office365.us`</li><li>DoD: `https://manage.protection.apps.mil`</li></ul> |
| Audit Logs - Authority | The authority field in the HTTP calls. | <ul><li>Commercial (default): `https://login.windows.net`</li><li>GCC: `https://login.windows.net`</li><li>GCC High: `https://login.microsoftonline.us`</li><li>DoD: `https://login.microsoftonline.us`</li></ul> |
| Audit Logs - ClientID | The app registration client ID. | The application client ID from the [Create a Microsoft Entra app registration for Office 365 Management API access](#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step. |
| Audit Logs - Client Secret | The app registration client secret (not the secret ID, but the actual value) in plain text. | <p>The application client secret from the [Create a Microsoft Entra app registration for the Office 365 Management API access](#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step.</p><p>If you're using Azure Key Vault to store your client ID and secret, leave this variable empty.</p> |
| Audit Logs - Client Azure Secret | The Azure Key Vault reference of the app registration client secret. | <p>The Azure Key Vault reference for the application client secret from the [Create a Microsoft Entra app registration for the Office 365 Management API access](#create-a-microsoft-entra-app-registration-for-office-365-management-api-access) step.</p><p>If you're storing your client ID in plain text in the **Audit Logs - Client Secret** environment variable, leave this variable empty. This variable expects the Azure Key Vault reference, not the secret. Learn more in [Use environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets).</p> |

### Start a subscription to audit log content

1. Go to [make.powerapps.com](https://make.powerapps.com).
 
1. Select **Solutions**.
 
1. Open the **Center of Excellence – Core Components** solution.

1. Turn on the **Admin | Audit Logs | Office 365 Management API Subscription** flow. Run the flow by entering *start* as the operation to run.

   :::image type="content" source="media/coe-startsubscription.png" alt-text="Screenshot that shows the location of the Run button in the navigation bar and the start Operation in the Run flow pane." lightbox="media/coe-startsubscription.png":::
   
1. Open the flow, and verify that the action to start the subscription is passed.

> [!IMPORTANT]
> If you previously enabled the subscription, you see a *(400) The subscription is already enabled* message. This message means the subscription is already enabled. You can ignore this message and continue with the setup.
> 
> If you don't see the preceding message or a (200) response, the request likely failed. There might be an error with your setup that's keeping the flow from working. Common issues to check are:
>
> - Are audit logs enabled, and do you have permission to view the audit logs? Test if the logs are enabled by searching in [Microsoft Purview Compliance Manager](https://compliance.microsoft.com/auditlogsearch).
> - Did you enable the audit log recently? If so, try again in a few minutes, to give the audit log time to activate.
> - Validate that you correctly followed the steps in [Create a Microsoft Entra app registration for the Office 365 Management API access](#create-a-microsoft-entra-app-registration-for-the-office-365-management-api-access).
> - Validate that you correctly updated the environment variables for these flows.

### Turn on flows

1. Go to [make.powerapps.com](https://make.powerapps.com).
 
1. Select **Solutions**.
 
1. Open the **Center of Excellence – Core Components** solution.
 
1. Turn on the **Admin | Audit Logs | Update Data (V2)** flow. This flow updates the Power Apps table with information about the last launch. It also adds metadata to the audit log records.
 
1. Turn on the **Admin | Audit Logs | Sync Audit Logs (V2)** flow. This flow runs on an hourly schedule and collects audit log events into the audit log table.

## Provide feedback

If you find an issue with the CoE Starter Kit, file a bug against the solution at [aka.ms/coe-starter-kit-issues](https://aka.ms/coe-starter-kit-issues).
