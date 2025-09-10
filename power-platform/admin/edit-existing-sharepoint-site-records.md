---
title: "Edit existing SharePoint site records"
description: Edit existing SharePoint site records in Power Platform to manage document management settings for your apps.
author: Mattp123
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/10/2025
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
---
# Edit existing SharePoint site records

Store documents related to your records in [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] folders and manage the folders and documents from within Power Apps apps and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). Integrating [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] document management with your apps makes it easy to access and share documents associated with your records.  
  
> [!TIP]
>  You can take advantage of server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration between Power Apps and customer engagement apps and [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)]. Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration provides an immersive document management experience consistent with the look and feel of Power Apps and customer engagement apps.  
> 
>  You can use server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration for on-premises and hybrid [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] deployments. For information about setting up server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration using a wizard, go to [Set up SharePoint integration](set-up-sharepoint-integration.md)  
  
 If you have already set up SharePoint document management, and want to edit your site records, use the following procedure.  
  
## Edit site records

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Manage** on the left navigation pane, select **Environments**, and then open the environment you want.
1. Select **Settings** on the command bar.
1. Select **Integration** > **Document management settings**.
1. Select **SharePoint Sites**.
1. Select the site record **Name** for the site you want to modify to open it. You might need to change the view dropdown list to **Active SharePoint Sites** to display the records. You must have SharePoint integration enabled for any SharePoint site records to exist.
1. Modify any of the following settings:  
  
   - **Name**. Add or change the name for the site..  
   - **Owner**. By default, the person who created the site is listed as the owner of the site record.  
   - **Description**. Add or change the description for the site. For example, specify what documents the site contains.  
   - **URL Type**. Specify whether you want to add an absolute (full) or relative URL for the site.  
  
     - **Absolute URL**. To point this site record to a site collection or site in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], specify the fully qualified URL of the site collection or site. You can use this record as a parent site to create other site records with relative URLs for sites inside the site collection or sites on the same [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site.  
  
     - **Relative URL**. Use this option when you have at least one site record pointing to a site collection in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. In the **Parent Site** box, select an existing  site record. If the site record that you selected as a parent site points to a site collection on SharePoint, specify the name of an existing site in the second box. If the site record that you selected as a parent site points to a site on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], specify the name of an existing subordinate site on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
1. Select **Save and Close**.  

<!-- 
## Classic experience
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - Don't have the correct permissions? Contact your system administrator.  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Integration** > **Document management settings**.  

3. Select **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Sites**.  
  
4. Select the site record you want to modify, and then select **Edit**.  
  
5. Modify any of the following settings:  
  
   - **Name**. Add or change the name for the site..  
  
   - **Owner**. By default, the person who created the site is listed as the owner of the site record.  
  
   - **Description**. Add or change the description for the site. For example, specify what documents the site contains.  
  
   - **URL Type**. Specify whether you want to add an absolute (full) or relative URL for the site.  
  
     - **Absolute URL**. To point this site record to a site collection or site in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], specify the fully qualified URL of the site collection or site. You can use this record as a parent site to create other site records with relative URLs for sites inside the site collection or sites on the same [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site.  
  
     - **Relative URL**. Use this option when you have at least one site record pointing to a site collection in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. In the **Parent Site** box, select an existing  site record. If the site record that you selected as a parent site points to a site collection on SharePoint, specify the name of an existing site in the second box. If the site record that you selected as a parent site points to a site on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], specify the name of an existing subordinate site on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
6. Select **Save**.  
  
7. Select **Save and Close**.  -->
  
> [!NOTE]
>  To activate or deactivate a site record, on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Sites page, select the site record, and then in the **Records** group, select **Activate** or **Deactivate**.  
  
### See also

[Set up SharePoint integration](set-up-sharepoint-integration.md)   



[!INCLUDE[footer-include](../includes/footer-banner.md)]
