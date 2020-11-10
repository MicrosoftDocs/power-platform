---
title: "Control field synchronization with Outlook  | MicrosoftDocs"
description: Control field synchronization with Outlook
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Control field synchronization with Outlook

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

<!-- legacy procedure -->

With field synchronization, admins can set the sync direction between customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), and [!INCLUDE[pn_microsoft_dynamics_crm_for_outlook](../includes/pn-microsoft-dynamics-crm-for-outlook.md)] fields. You can control synchronization when using either [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] synchronization or server-side synchronization ([!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]).  
  
 For example, a salesperson may want to take personal notes about a contact and not want the notes to synchronize with data available to all users. An admin can set the Personal Notes field for contacts in Outlook to not synchronize [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] with customer engagement apps so the salesperson's notes will remain private.  
  
> [!TIP]
> ![Video symbol](../admin/media/video-thumbnail-4.png "Video symbol") Check out the following video: [Configurability in Synchronizing Data with Outlook or Exchange in Microsoft Dynamics CRM 2015](https://youtu.be/BMZsVUuaklo?list=PLC3591A8FE4ADBE07)  
  
## Set field synchronization between customer engagement apps and Outlook  
  
1. Sign in as an admin. 

2. In the web app, select **Settings** > **Administration** > **System Settings** > **Synchronization** tab.
  
   For [Unified Interface](about-unified-interface.md), select Settings (![Gear button](../admin/media/selection-rule-gear.png "Gear button")) in the upper-right corner > **Advanced Settings** > **Settings** > **Administration** > **System Settings** > **Synchronization** tab.
  
3. Under **Synchronize items with Outlook or Exchange**, select **synchronized fields**.  
  
4. For the fields you want to change synchronization, choose the arrows in the Sync Direction column. Each choice will change the direction.  
  
   ![Appointment fields for synchronization](../admin/media/appointment-field-sync.png "Appointment fields for synchronization")  
  
   > [!TIP]
   >  Hover over a field name to see the fields mapped to it.  
  
5. Select **OK** > **OK** to close the open dialog boxes.  
  
   Let your users know they can view (not change) the synchronization settings. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [What fields can be synchronized between customer engagement apps and Outlook?](what-fields-synchronized-outlook.md)  
  
## Performance and synchronization  
 Configuring synchronization might have an impact on the time it takes to sync between [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] and customer engagement apps. You should test your configuration before deploying to ensure satisfactory sync times.  
  
## Permissions and synchronization  
 Role-based security controls access to a specific entity type, record-based security controls access to individual records, and field-level security controls access to specific fields. All these can impact what is synchronized between customer engagement apps and [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)].  
  
 Best practice is to review the security settings for these security methods to ensure field synchronization is processes as desired. For more information see:  
  
-   Securing roles: [Create or edit a security role](../admin/create-edit-security-role.md)  
  
-   Securing fields: [Add or remove security from a field](enable-disable-security-field.md)  
  
[!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [How field security affects synchronization between customer engagement apps and Outlook](../admin/how-field-security-affects-synchronization-between-outlook.md) and [Security concepts](../admin/wp-security-cds.md)  
  
### See also  
