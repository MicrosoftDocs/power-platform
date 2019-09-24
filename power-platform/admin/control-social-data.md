---
title: "Control receiving social data  | MicrosoftDocs"
description: Control receiving social data
author: jimholtz
manager: kvivek
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
---
# Control receiving social data

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

You can enable or disable your ability to receive social data in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  
  
## Enable or disable social engagement  
 By default, social engagement is enabled and social data is received.  
  
> [!NOTE]
>  If you disable social engagement, you can no longer create or update social data in [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps. If you try to convert a social activity to a case while social engagement is disabled, you’ll get an error message. The error occurs because the **Convert To Case** action tries to update the social activity **Regarding** field. The same error occurs if you try to assign a social activity record or a social profile record to another user.  
  
1. [!INCLUDE[proc_settings_administration](../includes/proc-settings-administration.md)]  
  
2. Choose **System Settings**.  
  
3. Under **Disable Social Engagement**, select **Yes** to stop receiving social data in [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps. To receive data, select **No**.  
  
4. Choose **OK**.  
  
### See also  
 [Connect to Microsoft Social Engagement](../admin/connect-microsoft-social-engagement.md)   
 [Receive social data in Microsoft Dynamics CRM](http://go.microsoft.com/fwlink/p/?LinkID=392629)
