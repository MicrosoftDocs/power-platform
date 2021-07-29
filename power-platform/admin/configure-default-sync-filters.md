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

Server-side synchronization uses filter criteria that’s set in synchronization filters to determine which app rows are synchronized with Exchange for each user. Sync filters are first initialized for a user when server-side synchronization is configured by a user for rows such as appointments, contacts, and tasks. For more information, see [Create or modify online synchronization filters](choose-records-synchronize-dynamics-365-outlook-exchange.md#create-or-modify-online-synchronization-filters).
 
When a user mailbox is set up to use server-side synchronization for appointments, contacts, and tasks, their personal option filters list will have default logic for each table applied immediately. When the next sync cycle happens server-side sync will use this logic to synchronize existing rows that meet the fetchXML logic provided in each filter.



There are times when the default logic might synchronize rows which an organization doesn’t want to push to Exchange, such as the default **My Outlook Contacts** filter.
As an example, an organization might not want to synchronize every active contact that is owned by the synchronizing user and wants to put additional restrictions in the filter logic distributed by default. This logic could be changed one by one for every user, but this is time consuming and it would need to be changed each time a user is setup with server-side sync.mAnother way to modify this logic is to change the default logic distributed to users when they’re set up with server-side synchronization for the first time. 

> [!NOTE]
> Default synchronization templates can’t be edited within the Dynamics 365 organization solution editor. This needs to be done through calls to the Dynamics 365 API using the XrmToolBox. The [XrmToolBox](https://www.xrmtoolbox.com/) is a third-party application that has multiple different tools for interacting with Dynamics 365 data. For more information on the tool, see [Documentation for XrmToolBox](https://www.xrmtoolbox.com/documentation/). 


## Check the current default Outlook template filters


1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment. 

2. On the command bar, select **Settings** > **Email** > **Server profiles**.  

   > [!div class="mx-imgBorder"] 
   > ![Screenshot of mail server profile setting.](media/server-profile-settings.png "Email server profile setting")
