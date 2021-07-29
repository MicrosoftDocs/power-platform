---
title: "Configure default sync filters for appointments, contacts, and tasks | MicrosoftDocs"
description: Configure default sync filters for appointments, contacts, and tasks.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/1/2021
author: revachauhan
ms.subservice: admin
ms.author: rechauha
ms.reviewer: mkaur
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Configure default sync filters for appointments, contacts, and tasks

Server-side synchronization uses filter criteria that’s set in synchronization filters to determine which app rows are synchronized with Exchange for each user. Sync filters are first initialized for a user when server-side synchronization is configured by a user for rows such as appointments, contacts, and tasks. For more information, see Create or modify online synchronization filters.

> [!IMPORTANT]
> [!INCLUDE[cc_feature_requires_office_365](../includes/cc-feature-requires-office-365.md)]  

## Get Exchange ready

 To use [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] with customer engagement apps, you must have an [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] subscription that either comes as part of a [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] subscription or can be subscribed to separately. For information about [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], go to:  
  
-   [Exchange Online](/exchange/exchange-online)
-   [Exchange Online service description](/office365/servicedescriptions/exchange-online-service-description/exchange-online-service-description)
-   [Microsoft 365 and Office 365 service descriptions](/office365/servicedescriptions/office-365-service-descriptions-technet-library)  
  
> [!TIP]
>  To make sure you've got a good connection to [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], run the [Microsoft Remote Connectivity Analyzer](https://testconnectivity.microsoft.com/). For information about which tests to run, see [Test mail flow with the Remote Connectivity Analyzer](https://technet.microsoft.com/library/dn305950\(v=exchg.150\).aspx).


## Create an email server profile for Exchange Online

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment. 

2. On the command bar, select **Settings** > **Email** > **Server profiles**.  

   > [!div class="mx-imgBorder"] 
   > ![Screenshot of mail server profile setting.](media/server-profile-settings.png "Email server profile setting")
