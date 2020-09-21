---
title: "Enable OneDrive for Business (online)  | MicrosoftDocs"
description: Enable OneDrive for Business (online)
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
# Enable OneDrive for Business (online)

This feature was introduced in [!INCLUDE[pn_crm_online_2016_update_shortest](../includes/pn-crm-online-2016-update-shortest.md)].  
  
 Users can create and manage private documents with [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. Those documents can be accessed in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), after the system administrator has enabled [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)].  
  
## Requirements  

> [!NOTE]
>  This topic applies to organizations deploying online versions of [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] and customer engagement apps. For information on integrating [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] on-premises with Dynamics 365 apps, or an online/on-premises mix of these products, see: [Enable OneDrive for Business (on-premises)](../admin/connect-onedrive-business.md).  

 The following are required to use [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] with customer engagement apps:  
  
- [Set up customer engagement apps to use SharePoint Online](set-up-dynamics-365-online-to-use-sharepoint-online.md).  
  
- A [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] license for each user. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [What is OneDrive for Business?](https://support.office.com/article/What-is-OneDrive-for-Business-187f90af-056f-47c0-9656-cc0ddca7fdc2)  
  
- A [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] license for each user. Users with a [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] license can use [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. For [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)], [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] subscriptions come with [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] licenses.  
  
- [!INCLUDE[cc_Office365PlanRequirement](../includes/cc-office365planrequirement.md)]  
  
- Before using [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] in customer engagement apps, the administrator and end users should access [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] through the web interface. For example, if you're using [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)], go to **<https://admin.microsoft.com>** > **app launcher**![Microsoft 365 app launcher](../admin/media/crm-itpro-officeapplauncher.png "Microsoft 365 app launcher") > **OneDrive**. The site and other information required by customer engagement apps to enable [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] integration gets created only when the site is accessed.  
  
## Enable OneDrive for Business  
 You can enable [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] as follows.  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Integration** > **Document management settings**. 
  
3. Select **Enable OneDrive for Business** to enable it, and then select **OK**.  
  
## Controlling access to OneDrive for Business
 You can toggle availability of [!INCLUDE[pn_onedrive](../includes/pn-onedrive.md)] in customer engagement apps for end users through the **OneDrive for Business** privilege.  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Users + permissions** > **Security roles**. 
  
3. Select a security role, and then select the **Core Records** tab.  
  
4. Under **Miscellaneous Privileges**, toggle the **OneDrive for Business** privilege to the desired availability.  
  
   ![Toggle availability of OneDrive for Business](../admin/media/crm-itpro-onedriveforbusn-priv.png "Toggle availability of OneDrive for Business")  
  
### See also  
 [Enable OneDrive for Business (on-premises)](connect-onedrive-business.md)   
 [What is OneDrive for Business?](https://support.office.com/article/What-is-OneDrive-for-Business-187f90af-056f-47c0-9656-cc0ddca7fdc2)
