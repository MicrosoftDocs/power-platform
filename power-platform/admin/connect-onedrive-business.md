---
title: Enable OneDrive for Business (on-premises)
description: Enable OneDrive for Business (on-premises)
author: sericks007
contributors: 
  - josaw1
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/21/2025
ms.subservice: admin
ms.author: sericks
search.audienceType: 
  - admin
---
# Enable OneDrive for Business (on-premises)

As the system administrator, you need to enable [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] for your users so they can create and manage private documents with [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)].
  
> [!NOTE]
> This topic applies to organizations deploying on-premises versions of [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), or an online/on-premises mix of these products. For information on integrating [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] online with customer engagement apps, see: [Enable OneDrive for Business](../admin/enable-onedrive-for-business.md).

## Requirements

To use [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] with [!INCLUDE[pn_microsoft_dynamics_crm_2016_server](../includes/pn-microsoft-dynamics-crm-2016-server.md)], you need to set up and turn on the following:  
  
- [Set up SharePoint integration](../admin/set-up-sharepoint-integration.md) and have at least one team site.  
  
- Set up permission on the root [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] team site for all users who use [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] in customer engagement apps. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Plan sites and manage users](https://support.office.com/article/Plan-sites-and-manage-users-95F9EB7A-4AC8-4DD5-A883-17686CBF8FFF)  
  
- Turn on the **Search service** for SharePoint on-premises so it can access shared documents from other users. It's enabled by default on [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] but not on [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] on-premises. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create and configure a Search service application in SharePoint Server 2013](/SharePoint/search/create-and-configure-a-search-service-application).
  
## Enable OneDrive for Business

To enable [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)], take the following steps:  
  
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.  
1. Select **Settings** > **Integration** > **Document management settings**.
1. Select **Enable OneDrive for Business** to enable it, then select **OK**.  
  
If you're running *[!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] on-premises*, on the Windows Server where [!INCLUDE[pn_SharePoint_Server_short](../includes/pn-sharepoint-server-short.md)] is running, open the **[!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] Management Shell** and run the following commands to set up permissions between [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] and [!INCLUDE[pn_microsoft_dynamics_crm_2016_server](../includes/pn-microsoft-dynamics-crm-2016-server.md)].  
  
> [!NOTE]
> If you already completed the steps in [Configure server-based authentication with customer engagement apps and SharePoint on-premises](../admin/configure-server-based-authentication-sharepoint-on-premises.md) to set up permissions, then you can skip running the PowerShell commands.  
  
```powershell
 
Add-Pssnapin *  
# Access WellKnown App principal  
[Microsoft.SharePoint.Administration.SPWebService]::ContentService.WellKnownAppPrincipals  
  
# Create WellKnown App principal  
$ClientId = "00000007-0000-0000-c000-000000000000"  
$PermissionXml = "<AppPermissionRequests AllowAppOnlyPolicy=""true""><AppPermissionRequest Scope=""http://sharepoint/content/tenant"" Right=""FullControl"" /><AppPermissionRequest Scope=""http://sharepoint/social/tenant"" Right=""Read"" /><AppPermissionRequest Scope=""http://sharepoint/search"" Right=""QueryAsUserIgnoreAppPrincipal"" /></AppPermissionRequests>"  
  
$wellKnownApp= New-Object -TypeName "Microsoft.SharePoint.Administration.SPWellKnownAppPrincipal" -ArgumentList ($ClientId, $PermissionXml)  
  
$wellKnownApp.Update()  
  
```  
  
## Controlling access to OneDrive for Business

 To toggle the availability of [!INCLUDE[pn_onedrive](../includes/pn-onedrive.md)] for end users through the **OneDrive for Business** privilege, take the following steps:  

1. In the Power Platform admin center, select an environment.
1. Select **Settings** > **Users + permissions** > **Security roles**.
1. Choose a security role, and then select the **Core Records** tab.
1. Under **Miscellaneous Privileges**, toggle the **OneDrive for Business** privilege to the desired availability.  
  
   > [!NOTE]
   > This privilege is visible in the Security Roles dialog only after [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] is enabled.  
  
   ":::image type="content" source="media/onedrive-business-privileges.png" alt-text="Toggle availability of OneDrive for Business":::

### See also

- [Set up SharePoint integration](../admin/set-up-sharepoint-integration.md)
- [Use OneDrive for Business to manage your private documents](/dynamics365/customerengagement/on-premises/basics/use-onedrive-business-manage-private-documents)
- [What is OneDrive for Business?](https://support.office.com/article/What-is-OneDrive-for-Business-187f90af-056f-47c0-9656-cc0ddca7fdc2)
- [SharePoint Online and OneDrive for Business: software boundaries and limits](https://support.office.com/article/SharePoint-Online-and-OneDrive-for-Business-software-boundaries-and-limits-8F34FF47-B749-408B-ABC0-B605E1F6D498)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
