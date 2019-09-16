---
title: "Permissions required for document management tasks for Dynamics 365 for Customer Engagement apps | MicrosoftDocs"
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
ms.assetid: ffa19af1-251f-4feb-b427-1cf8e1bb9e93
caps.latest.revision: 16
author: Mattp123
ms.author: matp
manager: kvivek
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# Permissions required for document management tasks

*This content also applies to the on-premises version.*

The following table shows the default security roles or other permissions that are needed to perform each document management with [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] task.  
  
> [!IMPORTANT]
>  If you’re using [!INCLUDE[pn_crm_for_outlook_full](../includes/pn-crm-for-outlook-full.md)], you can’t do any of these tasks while you’re offline.  
  
|                        Tasks related to document management                         |                                                                                                                          Minimum security role or other permission required                                                                                                                          |
|-------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                        Enable or disable document management                        |         Security roles:  System Administrator or System Customizer<br /><br /> Privileges:  Read, Write on all record types that are customizable.<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions: Create, Read, Write, Append, Append To          |
|                             Create or edit site records                             |                                               Security roles:  System Administrator or System Customizer<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions: Site Create, Read, Write, Append, Append To                                               |
|                      Create or edit document location records                       | Security roles:  Salesperson<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions: Read, Append To<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions: Create, Read, Write, Append, Append To |
|              Run the Enable Server-based SharePoint Integration Wizard              |          Security roles:  System Administrator<br /><br /> Privileges: All other security roles will require the Run SharePoint Integration Wizard permission to run the Enable Server-based SharePoint Integration Wizard in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.           |
|                            Make a site your default site                            |                                                               Security roles: System Administrator or System Customizer<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions: Read, Write                                                                |
|                                   Validate sites                                    |                                                               Security roles:  System Administrator or System Customizer<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions: Read, Write                                                               |
|                    Add or edit a document location from a record                    |     Security roles: Any<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site permissions: Read, Append To<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions: Create, Read, Write, Append, Append To      |
|                                Fix a broken location                                |                                                                           Security roles:  Any<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions: Read, Write                                                                            |
|                                  Manage documents                                   |                                                                           Security roles:  Any<br /><br /> [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Document Location permissions: Read, Write                                                                            |
  
### See also  
 [Manage Your Documents](../admin/manage-documents-using-sharepoint.md) <br /> 
[Validate and fix SharePoint site URLs](troubleshoot-set-up-sharepoint-online.md#validate-and-fix-sharepoint-site-urls)

