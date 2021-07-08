---
title: "Requirements for using SharePoint document management"
description: "Learn about the software requirements for using SharePoint document management for apps in Dynamics 365, including site collections and server-based integration."
author: Mattp123
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/29/2019
ms.subservice: admin
ms.author: matp
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# SharePoint Document Management software requirements

If you want to use [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] document management functionality with model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, you must meet the requirements listed in this topic.  

<a name="docman_online"></a>   
## Use document management 
 If you are using server-based integration with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], you can use any of the following SharePoint versions. 
-  [!INCLUDE[pn_microsoft_sharepoint_online](../includes/pn-microsoft-sharepoint-online.md)] 
- SharePoint 2016 on-premises
- [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 on-premises (or a later version).  

**A SharePoint site collection**. You also need to have at least one site collection configured and available for model-driven apps in Dynamics 365.  

**Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration**  must be enabled.  

> [!IMPORTANT]
>  The document management feature requires that model-driven apps in Dynamics 365 and [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] subscriptions be under the same tenant.  
> 
> [!INCLUDE[pn_sharepoint_foundation](../includes/pn-sharepoint-foundation.md)] versions aren’t compatible with model-driven apps in Dynamics 365 document management.  

 Users who access [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] from model-driven apps in Dynamics 365 must have appropriate permissions on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection where the document management components are installed. For more information about how to grant membership on a site collection, see the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Help.  

<a name="BKMK_enable_servertoserver"></a>   

## Server-based SharePoint integration  
 Earlier versions of model-driven apps in Dynamics 365 document management use a client-to-server strategy to authenticate and transmit data from model-driven apps in Dynamics 365 to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. Server-based (using server-to-server authentication) [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration provides the following benefits:  

- User interface that is consistent with the newly-updated user interface.  

- Users can create and view folders when using document management.

- To configure and use document management, you do not need to be signed in to both model-driven apps in Dynamics 365 and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  


<!-- 
**[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] authentication method support**  


|                                                    [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] version                                                     | List component support |                                   Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration support                                    |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] or [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 |          Yes           | Yes with [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 when used with Dynamics 365 apps |
|                                          [!INCLUDE[pn_Microsoft_SharePoint_2010](../includes/pn-microsoft-sharepoint-2010.md)] SP1 or SP2                                          |          Yes           |                                                                                    No                                                                                     |
|                                             [!INCLUDE[pn_microsoft_sharepoint_online](../includes/pn-microsoft-sharepoint-online.md)]                                              |          Yes           |                                                                                    Yes                                                                                    |

 For information about how to enable server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration, see [Set up SharePoint integration with Dynamics 365 apps](../admin/set-up-sharepoint-integration.md).  -->

<!-- 
 For more information about the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)], see [Dynamics CRM List Component for SharePoint](../admin/sharepoint-document-management-software-requirements.md#BKMK_listComp).  


<a name="BKMK_listComp"></a>   
## Dynamics CRM List Component for SharePoint  
 The [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)] makes Dynamics 365 apps documents that are stored on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] available to you in a format that has the look and feel of Dynamics 365 apps. This feature also lets Dynamics 365 apps automatically create folders that will be used to store documents related to Dynamics 365 apps records on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  

 The [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)] has the following benefits:  

- Users can create and view folders when using document management within Dynamics 365 apps.  

- Users can create [custom content types](https://go.microsoft.com/fwlink/p/?LinkID=396378) such as a Sales Contract content type.  

> [!IMPORTANT]
> - Notice that the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)] isn’t required when you use server-based integration with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Server-based SharePoint integration](../admin/sharepoint-document-management-software-requirements.md#BKMK_enable_servertoserver)  
> - Cient-to-server authentication strategies that require [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] server sandboxing, like those used with the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)],  may be deprecated soon.  
> - There are two versions of the [!INCLUDE[pn_list_component_short](../includes/pn-list-component-short.md)]:  
> 
>   - **[!INCLUDE[pn_crm_2016_list_component_sharepoint_server_2010](../includes/pn-crm-2016-list-component-sharepoint-server-2010.md)]** . This version doesn’t work with [!INCLUDE[pn_sharepoint_2013](../includes/pn-sharepoint-2013.md)].  
>   - **[!INCLUDE[pn_crm_2016_list_component_sharepoint_server_2013](../includes/pn-crm-2016-list-component-sharepoint-server-2013.md)]** . This version doesn’t work with [!INCLUDE[pn_ms_SharePoint_2010_short](../includes/pn-ms-sharepoint-2010-short.md)].  -->

### See also  
[Set up SharePoint integration](set-up-sharepoint-integration.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
