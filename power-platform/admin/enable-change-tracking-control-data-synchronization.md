---
title: "Customize change tracking of data entities for synchronization"
description: "Learn how to selectively enable change tracking for data entities in Microsoft Power Platform, improving synchronization with external data sources."
author: sericks007
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/26/2022
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Enable change tracking to control data synchronization

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Large organizations that synchronize their data with external data sources can enable tables (entities) for change tracking. You can export or retrieve a selected set of data, and then keep the external data warehouse in sync.  
  
 By selecting, or deselecting, change tracking for specific tables (entities) you can reduce the load on your server resources and save processing time when extracting data and synchronizing it to an external store. You can enable change tracking for both system and custom tables (entities).  

## Using Power Apps settings

1. Sign in to [Power Apps](https://make.powerapps.com/).

2. Expand **Dataverse**, and then select **Tables**.

3. Select a table, and then in **Table properties** select **Properties**.

4. In the Edit table page, expand **Advanced options**.

5. In the **For this table** section, enable the **Track Changes** checkbox.

   :::image type="content" source="media/enable-track-changes.png" alt-text="Select checkbox to enable Track Changes.":::

6. Select **Save**.

> [!NOTE]
> When you enable Track Changes you cannot disable it.

## Using legacy settings

1. [!INCLUDE[proc_customization_customize_system](../includes/proc-customization-customize-system.md)]  
  
2. Select an entity, and under **Data Services**, select the **Change Tracking** check box.  
  
   ![Select Change Tracking for an entity.](../admin/media/change-tracking.PNG "Select Change Tracking for an entity")  
  


[!INCLUDE[footer-include](../includes/footer-banner.md)]
