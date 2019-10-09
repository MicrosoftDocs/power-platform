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
# Office 365 Global admins and Common Data Service Service admins can administer without a license

By default, all Office 365 Global administrators and Common Data Service Service administrators who do not have a license are granted the following two levels of permission in model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service.  
  
-   System administrator security role  
  
-   Administrative access mode  
  
The System administrator security role is typically granted to administrators giving them unrestricted access to the administrative (Settings) areas, which are used for managing and configuring features of model-driven apps in Dynamics 365.  
  
Administrative access mode limits access to those areas of Dynamics 365 apps used to configure or customize the system.  
  
To give these administrators access to additional areas, such as the Sales, Marketing, and Service areas, a license must be added to the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global administrator or Common Data Service Service administrator user account, by using the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. Note that Administrative access mode cannot be changed on the user form.  
  
## Create a Common Data Service Service administrator account  
  
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com), and then choose **Users** > **Active Users**.  
  
2. Select an existing user in the list. If you want to create a new administrative user, see [Create or edit users](https://support.office.com/article/Create-or-edit-users-435ccec3-09dd-4587-9ebd-2f3cad6bc2bc) and [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  
  
3. Next to **Product licenses**, click **Edit**.  
  
4. Make sure a license is **not** assigned to this user, and then click **Save**.  
  
   > [!IMPORTANT]
   > Unlicensed [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global and Common Data Service Service administrators have access to the *administrative* areas. However, if the administrator also needs access to additional areas you must select a license for the user.  
  
5. Next to **Roles**, click **Edit** and then click either **Global administrator** or **Customized administrator** > **Dynamics 365 service administrator**. For more information about these roles, see [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  
  
6. Enter an alternate email address, and then click **Save**.  
  
### See also  

