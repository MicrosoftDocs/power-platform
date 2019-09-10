---
title: "Global and Service administrators can administer without a license | MicrosoftDocs"
description: Global and Service administrators can administer without a license 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/03/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Office 365 Global admins and Dynamics 365 Service admins can administer without a license

By default, all Office 365 Global administrators and Dynamics 365 Service administrators who do not have a [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps license are granted the following two levels of permission in Customer Engagement apps.  
  
-   System administrator security role  
  
-   Administrative access mode  
  
The System administrator security role is typically granted to Dynamics 365 for Customer Engagement administrators giving them unrestricted access to the administrative (Settings) areas, which are used for managing and configuring features of [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  
  
Administrative access mode limits access to those areas of [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps used to configure or customize the system.  
  
To give these administrators access to additional areas, such as the Sales, Marketing, and Service areas, a Customer Engagement apps license must be added to the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global administrator or Dynamics 365 Service administrator user account, by using the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. Note that Administrative access mode cannot be changed on the user form in the [!INCLUDE[pn_crm_online_shortest](../includes/pn-crm-online-shortest.md)] application.  
  
## Create a Dynamics 365 for Customer Engagement Service administrator account  
  
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com), and then choose **Users** > **Active Users**.  
  
2. Select an existing user in the list. If you want to create a new administrative user, see [Create or edit users](https://support.office.com/article/Create-or-edit-users-435ccec3-09dd-4587-9ebd-2f3cad6bc2bc) and [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  
  
3. Next to **Product licenses**, click **Edit**.  
  
4. Make sure a [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps license is **not** assigned to this user, and then click **Save**.  
  
   > [!IMPORTANT]
   > Unlicensed [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global and Dynamics 365 Service administrators have access to the *administrative* areas of Customer Engagement apps. However, if the administrator also needs access to additional areas of Customer Engagement apps you must select a Customer Engagement apps license for the user.  
  
5. Next to **Roles**, click **Edit** and then click either **Global administrator** or **Customized administrator** > **Dynamics 365 service administrator**. For more information about these roles, see [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  
  
6. Enter an alternate email address, and then click **Save**.  
  
### See also  
 [Manage subscriptions, licenses, and user accounts](../admin/manage-subscriptions-licenses-user-accounts.md)
