---
title: "Requirements for using SharePoint document management"
description: "Learn about the software requirements for using SharePoint document management for apps in Dynamics 365, including site collections and server-based integration."
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.subservice: admin
ms.date: 09/10/2020
ms.author: matp
search.audienceType: 
  - admin
---
# SharePoint document management software requirements

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

If you want to use [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)] document management functionality with Power Apps model-driven apps or customer engagement apps, such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation, you must meet the requirements listed in this article.  

Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration provides the following benefits:  

- Modern user interface that is consistent with the current user interface.

- Users can create and view folders when using document management.

- To configure and use document management, you don't need to be signed in to the app and [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)].

## Document management requirements

**SharePoint**. You can use any of the following SharePoint versions:
- SharePoint in Microsoft 365
- SharePoint 2016 on-premises
- [!INCLUDE[pn_microsoft_sharepoint_2013](../includes/pn-microsoft-sharepoint-2013.md)] SP1 on-premises (or a later version)  

**SharePoint site collection**. You need to have at least one site collection configured and available for your app.  

**Server-based [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] integration**  must be enabled. More information: [Set up SharePoint integration](set-up-sharepoint-integration.md) 

> [!IMPORTANT]
>  The document management feature requires that Power Apps or customer engagement apps subscription be under the same tenant as the [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] subscription.  
> 
> [!INCLUDE[pn_sharepoint_foundation](../includes/pn-sharepoint-foundation.md)] versions aren’t compatible with Power Apps and customer engagement apps document management.  

 Users who access [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] from an app must have appropriate permissions on the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] site collection where the document management components are installed. For more information about how to grant membership on a site collection, see the [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Help.  
 
> [!NOTE]
> SharePoint integration can only be enabled by a user with global administrator permissions. Delegate administrators are not able to enable SharePoint functionality.

### See also  

[SharePoint, OneNote, and OneDrive integration with Microsoft Dataverse](/power-apps/maker/data-platform/sharepoint-onedrive-onenote-intro)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
