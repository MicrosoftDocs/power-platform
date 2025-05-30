---
title: Enable and make available OneDrive for Business (online)
description: Learn about licensing and other requirements for using OneDrive for Business, and how to enable it in your environment and control access in apps.
author: sericks007
contributors: 
  - yingchin
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/29/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# Enable OneDrive for Business (online)

You can create and manage private documents with [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] and access the documents in these customer engagement apps:

- Dynamics 365 Sales
- Dynamics 365 Customer Service
- Dynamics 365 Field Service
- Dynamics 365 Marketing
- Dynamics 365 Project Service Automation
  
## Requirements  

> [!IMPORTANT]
> This topic applies to organizations deploying online versions of [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] and customer engagement apps. [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] relies on server-based SharePoint integration. To use this feature, your organization needs to have at least one active SharePoint site and your admin needs to enable server-based integration.
>
> For information on integrating [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] on-premises with Dynamics 365 apps, or an online/on-premises mix of these products, see: [Enable OneDrive for Business (on-premises)](../admin/connect-onedrive-business.md).  

Before you use [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] in customer engagement apps, be sure to meet these requirements:  
  
- [Set up customer engagement apps to use SharePoint Online](set-up-dynamics-365-online-to-use-sharepoint-online.md).  
  
- A [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] license for each user. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [What is OneDrive for Business?](https://support.office.com/article/What-is-OneDrive-for-Business-187f90af-056f-47c0-9656-cc0ddca7fdc2)  
  
- A [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] license for each user. Users with a [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] license can use [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)]. For [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)], [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] subscriptions come with [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)] licenses.  
  
- [!INCLUDE[cc_Office365PlanRequirement](../includes/cc-office365planrequirement.md)]  
  
- The administrator and end users need to access [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] through the web interface to allow the customer engagement apps to access the required site and other related information that enable [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)] integration with the customer engagement apps. For example, if you use [!INCLUDE[pn_sharepoint_online](../includes/pn-sharepoint-online.md)], go to **<https://admin.microsoft.com>** > **app launcher**![Microsoft 365 app launcher](../admin/media/crm-itpro-officeapplauncher.png "Microsoft 365 app launcher") > **OneDrive**.
  
## Enable OneDrive for Business

Take these steps to enable [!INCLUDE[pn_onedrive_for_business](../includes/pn-onedrive-for-business.md)].  

### [Modern admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Integration**, then select **Document management settings**.
1. Select **Enable OneDrive for Business**, then select the **Enable OneDrive for Business** check box to activate it.
1. Select **OK** to save the changes.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Integration**, then select **Document management settings**.
1. Select **Enable OneDrive for Business**, then select the **Enable OneDrive for Business** check box to activate it.
1. Select **OK** to save the changes.

---

## Controlling access to OneDrive for Business

You can toggle availability of [!INCLUDE[pn_onedrive](../includes/pn-onedrive.md)] in customer engagement apps for end users through the **OneDrive for Business** privilege.  

### [Modern admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Users + permissions**, then select **Security roles**.
1. Select a security role, then go to the **Miscellaneous privileges** tab.
1. Assign the **OneDrive for Business** privilege to the appropriate level.
1. In the command bar, select **Save** to apply the changes.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**.  
1. Expand **Users + permissions**, then select **Security roles**.
1. Select a security role, then go to the **Miscellaneous Privileges** tab.
1. Assign the **OneDrive for Business** privilege to the appropriate level.
1. In the command bar, select **Save** to apply the changes.

---

### Related content

 [Enable OneDrive for Business (on-premises)](connect-onedrive-business.md)
 [What is OneDrive for Business?](https://support.office.com/article/What-is-OneDrive-for-Business-187f90af-056f-47c0-9656-cc0ddca7fdc2)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
