---
title: "Enable change tracking to control data synchronization  | MicrosoftDocs"
description: Enable change tracking to control data synchronization
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Enable change tracking to control data synchronization

Large organizations that synchronize their data with external data sources can now enable entities for change tracking. You can export or retrieve a selected set of data, and then keep the external data warehouse in sync.  
  
 By selecting, or deselecting, change tracking for specific entities you can reduce the load on your server resources and save processing time when extracting data and synchronizing it to an external store. You can enable change tracking for both system and custom entities.  
  
1. [!INCLUDE[proc_customization_customize_system](../includes/proc-customization-customize-system.md)]  
  
2. Select an entity, and under **Data Services**, select the **Change Tracking** check box.  
  
   ![Select Change Tracking for an entity](../admin/media/change-tracking.PNG "Select Change Tracking for an entity")  
  
