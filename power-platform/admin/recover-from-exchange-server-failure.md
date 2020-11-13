---
title: "Recover from Exchange Server failure  | MicrosoftDocs"
description: Recover from Exchange Server failure
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Recover from Exchange Server failure

The process to restore a [!INCLUDE[pn_Exchange_Server_full](../includes/pn-exchange-server-full.md)] computer that is used by customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), depends on how that environment of [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] is being used. The only time apps-related data exists on [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] occurs when you use a forward mailbox with the [!INCLUDE[pn_CRM_E-Mail_Router](../includes/pn-crm-e-mail-router.md)] or server-side synchronization. Customer engagement apps don’t directly use [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] mailboxes.  

> [!NOTE]
> This topic applies to Email Router which has been deprecated and was removed in version 9.0. We strongly recommend that you migrate all email routing functionality to use the server-side synchronization feature.
  
## Restore Exchange Server in a Microsoft Dataverse environment  
  
1. Restore [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)].  
  
2. If the Email Router was installed on the computer that is running [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] (not recommended), reinstall the Email Router.  
  
3. Restore the Microsoft.Crm.Tools.EmailAgent.xml file. By default, this file is located in the C:\Program Files\Microsoft Customer Engagement Email\Service folder on the computer where the Email Router is installed. If this file isn’t available, you must reconfigure the profiles, settings, users, queue, and forward-mailbox information by running the Email Router Configuration Manager.  
  
For more information about [!INCLUDE[pn_Exchange_Server_2016](../includes/pn-exchange-server-2016-short.md)] backup and recovery, see [Backup, restore, and disaster recovery](https://technet.microsoft.com/library/mt697598(v=exchg.160).aspx).  

For more information about [!INCLUDE[pn_Exchange_Server_2013_full](../includes/pn-exchange-server-2013-full.md)] backup and recovery, see [Backup, restore, and disaster recovery](https://technet.microsoft.com/library/dd876874\(v=exchg.150\).aspx).  
  
For more information about [!INCLUDE[pn_Exchange_Server_2010_full](../includes/pn-exchange-server-2010-full.md)] backup and recovery, see [Understanding Backup, Restore and Disaster Recovery](https://technet.microsoft.com/library/dd876874\(v=exchg.141\).aspx).  
  
### See also  
