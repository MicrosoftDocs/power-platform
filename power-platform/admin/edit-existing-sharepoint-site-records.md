---
title: "Edit existing SharePoint site records for Dynamics 365 for Customer Engagement apps | MicrosoftDocs"
ms.custom: 
ms.date: 09/30/2017
ms.reviewer: 
ms.service: crm-online
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: article
applies_to: 
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
ms.assetid: 2b0f8bb9-548f-498a-83b8-d7fbf3c05884
caps.latest.revision: 19
author: Mattp123
ms.author: matp
manager: brycho
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# Edit existing SharePoint site records

*This content also applies to the on-premises version.*

Store documents related to your [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps records in [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] folders and manage the folders and documents from within [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. Integrating [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document management with [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps makes it easy to access and share documents associated with your [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps records.  
  
> [!TIP]
>  If you’re using [!INCLUDE[pn_crm_2013_sp_shortest](../includes/pn-crm-2013-sp-shortest.md)] or later, you can take advantage of server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration between Customer Engagement apps and [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)]. Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration provides an immersive document management experience consistent with the look and feel of [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  
> 
>  If you’re using Customer Engagement apps or [!INCLUDE[pn_crm_2016](../includes/pn-crm-2016.md)], you can use server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration for on-premises and hybrid [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] deployments. For information about setting up server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration using a wizard, see [Set up SharePoint integration with Microsoft Dynamics 365 for Customer Engagement](set-up-sharepoint-integration.md)  
  
 If you have already set up SharePoint document management, and want to edit your site records, use the following procedure.  
  
## Edit site records  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - Don’t have the correct permissions? Contact your system administrator.  
  
2. [!INCLUDE[proc_settings_doc_management](../includes/proc-settings-doc-management.md)]  
  
3. Click **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Sites**.  
  
4. Select the site record you want to modify, and then click **Edit**.  
  
5. Modify any of the following settings:  
  
   - **Name**. Add or change the name for the site..  
  
   - **Owner**. By default, the person who created the site is listed as the owner of the site record.  
  
   - **Description**. Add or change the description for the site. For example, specify what documents the site contains.  
  
   - **URL Type**. Specify whether you want to add an absolute (full) or relative URL for the site.  
  
     - **Absolute URL**. To point this site record to a site collection or site in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], specify the fully qualified URL of the site collection or site. You can use this record as a parent site to create other site records with relative URLs for sites inside the site collection or sites on the same [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site.  
  
     - **Relative URL**. Use this option when you have at least one site record pointing to a site collection in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. In the **Parent Site** box, select an existing [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps site record. If the site record that you selected as a parent site points to a site collection on SharePoint, specify the name of an existing site in the second box. If the site record that you selected as a parent site points to a site on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], specify the name of an existing subordinate site on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
  <!--  - **List component is installed**. Select this check box if the URL that you specified is a site collection on [!INCLUDE[pn_sharepoint_server_2010](../includes/pn-sharepoint-server-2010.md)] or [!INCLUDE[pn_sharepoint_server_2013](../includes/pn-sharepoint-server-2013.md)] and if the site collection has the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps List component installed. This check box is available only if you use the **Absolute URL** option.  
  
     > [!TIP]
     >  The List component has been deprecated in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. For information on switching from the List component to server-based integration, see [Switching from the list component or changing the deployment](switch-dynamics-crm-online-dynamics-365.md)  -->
  
6. Click **Save**.  
  
7. Click **Save and Close**.  
  
> [!NOTE]
>  To activate or deactivate a site record, on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Sites page, select the site record, and then in the **Records** group, click **Activate** or **Deactivate**.  
  
### See also  
 [Set up SharePoint integration with Microsoft Dynamics 365 for Customer Engagement](set-up-sharepoint-integration.md)   
 [Switching from the list component or changing the deployment](switch-dynamics-crm-online-dynamics-365.md)
