---
title: Permissions and roles for SharePoint document management tasks
description: Learn about the security roles and permissions required for document management tasks when using SharePoint.
author: devkeydet
ms.component: pa-admin
ms.topic: concept-article
ms.date: 01/23/2026
ms.subservice: admin
ms.author: marcsc
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Permissions required for document management tasks

The following table shows the default security roles or other permissions that are needed to perform each document management task with [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)].  
  
> [!IMPORTANT]
>  If you’re using [!INCLUDE[pn_crm_for_outlook_full](../includes/pn-crm-for-outlook-full.md)], you can’t do any of these tasks while you’re offline.  
  
|  Tasks related to document management  |   Minimum security role or other permission required     |
|---------------------------------------------|-----------------------|
| Enable or disable document management    |  **Security roles**:  System Administrator or System Customizer<br /><br /> **Privileges**:  Read, Write on all record types that are customizable.<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions**: Create, Read, Write, Append, Append To          |
|   Create or edit site records      |  **Security roles**:  System Administrator or System Customizer<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions**: Site Create, Read, Write, Append, Append To                                               |
|  Create or edit document location records  | **Security roles**:  Salesperson or Basic User<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions**: Read, Append To<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions**: Create, Read, Write, Append, Append To |
| Run the Enable Server-based SharePoint Integration Wizard  |  **Security roles**:  System Administrator<br /><br /> **Privileges**: All other security roles require the Run SharePoint Integration Wizard permission to run the Enable Server-based SharePoint Integration Wizard.           |
|  Make a site your default site  |  **Security roles**: System Administrator or System Customizer<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions**: Read, Write                                                                |
| Validate sites |  **Security roles**:  System Administrator or System Customizer<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions**: Read, Write                                                               |
| Add or edit a document location from a record     |     **Security roles**: Any<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions**: Read, Append To<br /><br />**[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions**: Create, Read, Write, Append, Append To      |
| Fix a broken location |  **Security roles**:  Any<br /><br />**[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions**: Read, Write|
|  Manage documents   | **Security roles**:  Any<br /><br /> **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions**: Read, Write |
  
### Related content
 [Manage Your Documents](../admin/manage-documents-using-sharepoint.md) <br /> 
[Validate and fix SharePoint site URLs](troubleshoot-set-up-sharepoint-online.md#validate-and-fix-sharepoint-site-urls)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
