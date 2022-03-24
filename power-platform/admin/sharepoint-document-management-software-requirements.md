---
title: "Requirements for using SharePoint document management"
description: "Learn about the software requirements for using SharePoint document management for apps in Dynamics 365, including site collections and server-based integration."
author: Mattp123
manager: kvivek
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: admin
ms.date: 09/10/2020
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

If you want to use [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] document management functionality with customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), you must meet the requirements listed in this topic.  

<a name="docman_online"></a>   
## Use document management 
 If you are using server-based integration with [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)], you can use any of the following SharePoint versions. 
-  [!INCLUDE[pn_microsoft_sharepoint_online](../includes/pn-microsoft-sharepoint-online.md)] 
- SharePoint 2016 on-premises
- [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 on-premises (or a later version).  

**A SharePoint site collection**. You also need to have at least one site collection configured and available for customer engagement apps.  

**Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration**  must be enabled.  

> [!IMPORTANT]
>  The document management feature requires that customer engagement apps and [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] subscriptions be under the same tenant.  
> 
> [!INCLUDE[pn_sharepoint_foundation](../includes/pn-sharepoint-foundation.md)] versions aren’t compatible with customer engagement apps document management.  

 Users who access [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] from customer engagement apps must have appropriate permissions on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection where the document management components are installed. For more information about how to grant membership on a site collection, see the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Help.  
 
> [!NOTE]
> Sharepoint integration can only be enabled by a user with global administrator permissions. Delegate administrators are not able to enable Sharepoint functionality.

<a name="BKMK_enable_servertoserver"></a>   

## Server-based SharePoint integration  
 Earlier versions of customer engagement apps document management use a client-to-server strategy to authenticate and transmit data from customer engagement apps to [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)]. Server-based (using server-to-server authentication) [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration provides the following benefits:  

- User interface that is consistent with the newly-updated user interface.  

- Users can create and view folders when using document management.

- To configure and use document management, you do not need to be signed in to both customer engagement apps and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].  




### See also  
[Set up SharePoint integration](set-up-sharepoint-integration.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
