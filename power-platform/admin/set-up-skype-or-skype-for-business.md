---
title: "Set up Skype or Skype for Business  | MicrosoftDocs"
description: Set up Skype or Skype for Business 
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
# Set up Dynamics 365 for Customer Engagement apps (online) to use Skype or Skype for Business

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

When you use [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)] and [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps, your organization can benefit from these capabilities:  
  
- Real-time communications with customers, colleagues, and team members without leaving [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. Click or tap a person’s phone number to call them.  
  
- Track meetings as Activities in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  
  
- Get Presence information for members of the same email domain you are signed in with in [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)].  
  
  ![Call a contact with Skype](../admin/media/crm-itpro-crmo365tg2-kimpresence.png "Call a contact with Skype")  
  
## Set up Skype in Microsoft Dynamics 365 for Customer Engagement apps (online)  
  
1. Verify that IM presence is enabled in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. Go to **Settings** > **Administration** > **System Settings** > **General tab**.  
  
   ![Set the IM presence option](../admin/media/crm-itpro-crmo365tg2-presencesetting.png "Set the IM presence option")  
  
2. In **System Settings**, set the telephony provider to [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)].  
  
   ![Select Skype or Lync as the provider](../admin/media/crm-itpro-crmo365tg2-lyncprovider.png "Select Skype or Lync as the provider")  
  
3. [!INCLUDE[proc_office365_signin](../includes/proc-office365-signin.md)]  
  
4. On the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] page, click or tap **Admin** > **Skype for Business** > **organization**.  
  
5. Choose the **general** tab. Review and set the presence privacy mode.  
  
   > [!NOTE]
   >  Presence information is shown for members of the same email domain you are signed in to with [!INCLUDE[pn_skype_for_business](../includes/pn-skype-for-business.md)]. For example, if you are signed in with someone@contoso.com, you will see presence for other @contoso.com users.  
   > 
   >  Instruct users to add the following as trusted sites in their browser:  
   > 
   > - https://*.dynamics.com  
   > - https://*.lync.com  
   > - https://*.sharepoint.com  
   > - https://login.microsoftonline.com  
  
6. Choose the **external communications** tab. Review and set the **external access** and public **IM connectivity** settings.  
  
   ![Lync admin center external communications settings](../admin/media/crm-itpro-crmo365tg2-lyncsettingsexternal.png "Lync admin center external communications settings")  
  
## Tracking Skype  
 Now that [!INCLUDE[pn_skype](../includes/pn-skype.md)] is setup, your [!INCLUDE[pn_skype](../includes/pn-skype.md)] calls are tracked as activities.  
  
 ![Lync calls tracked as activities](../admin/media/crm-itpro-crmo365tg2-lynctrack.png "Lync calls tracked as activities")  
  
### See also 
 [Skype for Business and Skype integration with Microsoft Dynamics 365 for Customer Engagement](skype-business-integration.md)   
 [Skype for Business help](https://support.office.com/skype-for-business)
