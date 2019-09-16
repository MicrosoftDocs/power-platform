---
title: "Set up SharePoint integration with Dynamics 365 for Customer Engagement apps | MicrosoftDocs"
ms.custom: 
ms.date: 05/29/2019
ms.reviewer: 
ms.service: crm-online
ms.suite: 
ms.tgt_pltfrm: 
ms.topic: article
applies_to: 
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
ms.assetid: b066f14a-e1a8-4a35-8f46-98ce79c38af3
caps.latest.revision: 40
author: Mattp123
ms.author: matp
manager: brycho
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# Set up SharePoint integration

*This content also applies to the on-premises version.*

With [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps, you can use the document management capabilities of [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] from within [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)]. You can store and manage documents in the context of a [!INCLUDE[pn_dynamics_crm](../includes/pn-dynamics-crm.md)] record on a [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)], and leverage the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] infrastructure to share, manage, and collaborate efficiently. Because the documents are stored on a [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)], non-[!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps users can directly access the documents on the [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)], provided they have the appropriate permissions.  
  
 For document management functionality, you enable server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration (recommended) on a site collection in [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] provides the following benefits.  
  
- Users sign-in once and do not have to sign-in to both [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
- No additional software is required to install on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  
  
- [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] documents will display in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps lists.  
  
- Users can perform [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] actions from the Dynamics 365 for Customer Engagement apps command bar.  
  
### See also 
 [Manage your documents](../admin/manage-documents-using-sharepoint.md)  <br /> 
 [Permissions required for document management tasks](../admin/permissions-required-document-management-tasks.md)   <br />
 [Validate and fix SharePoint site URLs](troubleshoot-set-up-sharepoint-online.md#validate-and-fix-sharepoint-site-urls) <br />
 [Enable SharePoint document management for specific entities](enable-sharepoint-document-management-specific-entities.md)
