---
title: "Configure Azure App with SharePoint Access | MicrosoftDocs"
description: Configure Azure App with SharePoint Access for API access to access the SharePoint integration table
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/08/2025
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
---
# Configure Azure App for SharePoint Access

When SharePoint integration access is needed from Power Automate or an API context, an Azure Application needs to be set up to grant access. Starting in March 2025, the current access is being removed to improve system protection.

## Create an Azure Application with SharePoint permissions

1. Open [Microsoft Azure](https://portal.azure.com/#home)

1. Under **Azure services** select **App registrations** button

1. Select **New registration** button

1. Enter **Name** for the application

1. Under **Supported account types** select value **Accounts in this organizational directory only**
   - NOTE: Other types aren't supported at this time

1. Select **Register** button to create the **App registration**

1. Note the **Application (client) ID** and **Directory (tenant) ID**
   1. In the navigation list, select **Overview**
   1. Under **Essentials**, copy the **Application (client) ID** and **Directory (tenant) ID** values for use in the next section

1. In the navigation list, select **Manage** > **API permissions**

1. Under **Configured permissions** select **Add a permission** button to open the **Request API permissions** panel
   1. Select **SharePoint** button
   1. Under *What type of permissions does your application require?* select button **Application permissions**

## Setup Admin Consent

1. Open [Microsoft Azure](https://portal.azure.com/#home)

1. Select **Microsoft Entra ID** button

1. In the navigation list, select **Manage** > **App registrations**

1. In the applications list, select the app registration name created in the previous section

1. In the navigation list, select **Manage** > **Certificates & secrets**

1. Select tab **Federated credentials**

1. Select button **Add credential**

1. In **Federated credential scenario** field, select **Other issuer**

1. In **Issuer** field, enter the Issuer URL
   - Value Format: `https://login.microsoftonline.com/<tenant-id>/v2.0`
   - Replace `<tenant-id>` with the **Directory (tenant) ID** guid value from the previous section
   - Example `https://login.microsoftonline.com/00000000-0000-0000-0000-000000000000/v2.0`

1. In **Value** field, enter the Subject Identifier 
    - Value Format: `/eid1/c/pub/t/v4j5cvGGr0GRqy180BHbRw/a/CQSGf3JJtEi27nY2ePL7UQ/Env/3a5a51c7-a395-e61d-8f8c-c67df78a983b/powerpagesmanagedidentity/<any-guid>`
    - Example: `/eid1/c/pub/t/v4j5cvGGr0GRqy180BHbRw/a/CQSGf3JJtEi27nY2ePL7UQ/Env/3a5a51c7-a395-e61d-8f8c-c67df78a983b/powerpagesmanagedidentity/00000000-0000-0000-0000-000000000000`
   
1. Select **Add** button to create the credential

## Post into Dataverse tables

