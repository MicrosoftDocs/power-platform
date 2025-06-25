---
title: Global admins and Power Platform admins can administer without a license
description: Learn about the levels of permission in customer engagement apps available for global admins and Microsoft Power Platform admins who don't have a license.
author: praveenmantha 
ms.subservice: admin
ms.author: pmantha
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/10/2024
search.audienceType: 
  - admin
contributors:
  - srpoduri 
---
# Global admins and Power Platform admins can administer without a license

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

By default, all Global admin and Microsoft Power Platform admins who do not have a license are granted administrative access mode. Administrative access mode limits access to those areas of Dynamics 365 apps used to configure or customize the system.  
  
To give these administrators access to additional areas, such as the Sales, Marketing, and Service areas, a license must be added to the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] user account, by using the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. Note that Administrative access mode cannot be changed on the user form.  
  
## Create a Power Platform admin account  
  
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com), and then select **Users** > **Active Users**.  
  
2. Select an existing user in the list. If you want to create a new administrative user, see [Create or edit users](https://support.office.com/article/Create-or-edit-users-435ccec3-09dd-4587-9ebd-2f3cad6bc2bc) and [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  
  
3. Select **Licenses and apps**.  
  
4. Make sure a license is **not** assigned to this user, and then select **Save changes**.  
  
   > [!IMPORTANT]
   > Unlicensed Power Platform admins have access to the *administrative* areas. However, if the administrator also needs access to additional areas you must select a license for the user.  
  
5. Select **Manage roles**, and then select **Show all by category** > **Power Platform Administrator**. For more information about these roles, see [Assign admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/assign-admin-roles).  

6. Select  **Save changes**.  
  
> [!NOTE]
> Global and Power Platform admins who don't have a license are automatically synced into the environment with an access mode of **Administrative** while administrators who have a license are synced into the environment with an access mode of **Read-Write**.
> 
> Unlicensed administrators who need to work with Power Apps for Admins PowerShell module or management connectors need to sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) at least once before invoking these administrative commands.
> 
> For tenants with special capabilities, such as pay-as-you-go plans, per app plans, or [special licenses](pricing-billing-skus.md#tenant-level-special-licenses), all users except administrators have read/write access set by default. Microsoft 365 global admins, Power Platform admins, or Dynamics 365 admins need a "per user" license (Power Apps Premium or Power Apps Basic or Power Apps use rights included with Dynamics 365 licenses) added in order to be assigned read/write permission in the access mode. Learn more in [Assign Microsoft 365 licenses to users](/microsoft-365/admin/manage/assign-licenses-to-users). 

### Related content

[Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504) <br />
[Create an Administrative user account](create-users.md#create-an-administrative-user-account)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
