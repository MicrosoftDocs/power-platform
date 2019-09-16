---
title: "SharePoint Document Management software requirements for Dynamics 365 for Customer Engagement apps | MicrosoftDocs"
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
ms.assetid: 736cf9ab-6a7f-4dc8-940a-d7302e09e858
caps.latest.revision: 55
author: Mattp123
ms.author: matp
manager: kvivek
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - Powerplatform
---
# SharePoint Document Management software requirements

*This content also applies to the on-premises version.*

If you want to use [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] document management functionality with [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps, you must meet the requirements listed in this topic.  

<a name="docman_online"></a>   
## Use document management in Dynamics 365 for Customer Engagement apps (online)  
 If you are using server-based integration with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], you can use any of the following SharePoint versions. 
-  [!INCLUDE[pn_microsoft_sharepoint_online](../includes/pn-microsoft-sharepoint-online.md)] 
- SharePoint 2016 on-premises
- [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 on-premises (or a later version).  

**A SharePoint site collection**. You also need to have at least one site collection configured and available for [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  

**Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration**  must be enabled.  

> [!IMPORTANT]
>  The document management feature requires that [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps and [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] subscriptions be under the same tenant.  
> 
> [!INCLUDE[pn_sharepoint_foundation](../includes/pn-sharepoint-foundation.md)] versions aren’t compatible with [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps document management.  

 Users who access [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] from [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps must have appropriate permissions on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection where the document management components are installed. For more information about how to grant membership on a site collection, see the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Help.  

<a name="BKMK_enable_servertoserver"></a>   

## Server-based SharePoint integration  
 Earlier versions of [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps document management use a client-to-server strategy to authenticate and transmit data from [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. Server-based (using server-to-server authentication) [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration provides the following benefits:  

- User interface that is consistent with the newly-updated [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps user interface.  

- Users can create and view folders when using document management within Dynamics 365 for Customer Engagement apps.

- To configure and use document management, you do not need to be signed in to both [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  


<!-- 
**[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] authentication method support**  


|                                                    [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] version                                                     | List component support |                                   Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration support                                    |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] or [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 |          Yes           | Yes with [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 when used with [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps |
|                                          [!INCLUDE[pn_Microsoft_SharePoint_2010](../includes/pn-microsoft-sharepoint-2010.md)] SP1 or SP2                                          |          Yes           |                                                                                    No                                                                                     |
|                                             [!INCLUDE[pn_microsoft_sharepoint_online](../includes/pn-microsoft-sharepoint-online.md)]                                              |          Yes           |                                                                                    Yes                                                                                    |

 For information about how to enable server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration, see [Set up SharePoint integration with Dynamics 365 for Customer Engagement](../admin/set-up-sharepoint-integration.md).  -->

<!-- 
 For more information about the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)], see [Dynamics CRM List Component for SharePoint](../admin/sharepoint-document-management-software-requirements.md#BKMK_listComp).  


<a name="BKMK_listComp"></a>   
## Dynamics CRM List Component for SharePoint  
 The [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)] makes [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps documents that are stored on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] available to you in a format that has the look and feel of [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. This feature also lets [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps automatically create folders that will be used to store documents related to [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps records on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  

 The [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)] has the following benefits:  

- Users can create and view folders when using document management within [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  

- Users can create [custom content types](http://go.microsoft.com/fwlink/p/?LinkID=396378) such as a Sales Contract content type.  

> [!IMPORTANT]
> - Notice that the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)] isn’t required when you use server-based integration with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Server-based SharePoint integration](../admin/sharepoint-document-management-software-requirements.md#BKMK_enable_servertoserver)  
> - Cient-to-server authentication strategies that require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server sandboxing, like those used with the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)],  may be deprecated soon.  
> - There are two versions of the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)]:  
> 
>   - **[!INCLUDE[pn_crm_2016_list_component_sharepoint_server_2010](../includes/pn-crm-2016-list-component-sharepoint-server-2010.md)]** . This version doesn’t work with [!INCLUDE[pn_sharepoint_2013](../includes/pn-sharepoint-2013.md)].  
>   - **[!INCLUDE[pn_crm_2016_list_component_sharepoint_server_2013](../includes/pn-crm-2016-list-component-sharepoint-server-2013.md)]** . This version doesn’t work with [!INCLUDE[pn_ms_SharePoint_2010_short](../includes/pn-ms-sharepoint-2010-short.md)].  -->

### See also  
[Set up SharePoint integration](set-up-sharepoint-integration.md)
