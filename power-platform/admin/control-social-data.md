---
title: "Control receiving social data  | MicrosoftDocs"
description: Control receiving social data
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/09/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Control receiving social data

<!-- legacy procedure -->

You can enable or disable your ability to receive social data in model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service.  
  
## Enable or disable social engagement  
 By default, social engagement is enabled and social data is received.  
  
> [!NOTE]
>  If you disable social engagement, you can no longer create or update social data in model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service. If you try to convert a social activity to a case while social engagement is disabled, you'll get an error message. The error occurs because the **Convert To Case** action tries to update the social activity **Regarding** field. The same error occurs if you try to assign a social activity record or a social profile record to another user.  
  
1. In the web app, go to **Settings** > **Administration** > **General** tab.
  
2. Select **System Settings**.  
  
3. Under **Disable Social Engagement**, select **Yes** to stop receiving social data. To receive data, select **No**.  
  
4. Select **OK**.  
  
### See also  
 [Connect to Microsoft Social Engagement](../admin/connect-microsoft-social-engagement.md)   
 [Receive social data in Microsoft Dynamics CRM](https://go.microsoft.com/fwlink/p/?LinkID=392629)
