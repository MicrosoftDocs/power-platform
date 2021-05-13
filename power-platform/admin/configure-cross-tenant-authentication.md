---
title: "Configure cross-tenant authentication | MicrosoftDocs"
description: View and manage on-premises data sources.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/11/2021
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Configure cross-tenant authentication

This topic covers how to connect your Dynamics 365 app in one tenant to Microsoft Exchange Online in another tenant. This involves a series of configuration steps in Microsoft Azure and Dynamics 365.

## Azure configuration

Sign in to https://portal.azure.com and do the following steps.

### Step one: Register your Dynamics 365 app in Azure

See [Quickstart: Register an application with the Microsoft identity platform](/azure/active-directory/develop/quickstart-register-app).

Follow the steps in the **Register an application** section. 

- For step 6, select **Accounts in any organizational directory**.

### Step two: Add API permissions

See [Quickstart: Configure a client application to access a web API](/azure/active-directory/develop/quickstart-configure-app-access-web-apis). 

Follow the steps in the **Add permissions to access your web API** section. 

- For step 4, select **APIs my organization uses** instead of **My APIs**.
- For step 5, search for and select **Office 365 Exchange Online** > **Application permissions**. 
- For step 6, under **Other permissions**, select **full_access_as_app**.

Make note of the **Application (client) ID** which you'll use when configuring Dynamics 365.

### Step three: Add client secret

Follow the steps in this section: [Option 2: Create a new application secret](/azure/active-directory/develop/howto-create-service-principal-portal)

## Dynamics 365 configuration

Sign in to https://admin.powerplatform.microsoft.com and do the following steps.



https://docs.microsoft.com/en-us/onedrive/find-your-office-365-tenant-id



### Step one: Create a new email server profile








### Step two: Configure a mailbox

### Step three: Check telemetry

