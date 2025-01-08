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

When SharePoint access is needed from Power Automate or non-user context, an Azure Application needs to be set up to access. Starting in March 2025, the current access is being removed to improve system reliability.

## Create an Azure Application with SharePoint permissions

1. Open [Microsoft Azure](https://portal.azure.com/#home)
1. Under **Azure services** select button **App registrations**
1. Select button **New registration**
1. Enter **Name** for the application
1. Under **Supported account types** select value **Accounts in this organizational directory only**
   1. NOTE: Other types are not supported at this time
1. Select **Register** button to create the **App registration**
1. In the left navigation list, select **Manage** > **API permissions**
1. Under **Configured permissions** select button **Add a permission** to open the **Request API permissions** panel
   1. Select button **SharePoint**
   1. Under *What types of permissions does your application require?* select button **Application permissions**

## Setup Admin Consent

1. Open [Microsoft Azure](https://portal.azure.com/#home)
1. Select button **Microsoft Entra ID**

