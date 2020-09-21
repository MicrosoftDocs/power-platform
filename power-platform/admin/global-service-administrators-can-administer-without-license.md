---
title: "Global and Power Platform admins can administer without a license | MicrosoftDocs"
description: Global and Power Platform admins can administer without a license 
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Global admins and Power Platform admins can administer without a license

By default, all Global admin and Power Platform admins who do not have a license are granted the following two levels of permission in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation).  
  
- System administrator security role  
- Administrative access mode  
  
The System administrator security role is typically granted to administrators giving them unrestricted access to the administrative (Settings) areas, which are used for managing and configuring features of customer engagement apps.  
  
Administrative access mode limits access to those areas of Dynamics 365 apps used to configure or customize the system.  
  
To give these administrators access to additional areas, such as the Sales, Marketing, and Service areas, a license must be added to the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global administrator or Power Platform admin user account, by using the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. Note that Administrative access mode cannot be changed on the user form.  
  
## Create a Power Platform admin account  
  
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com), and then choose **Users** > **Active Users**.  
  
2. Select an existing user in the list. If you want to create a new administrative user, see [Create or edit users](https://support.office.com/article/Create-or-edit-users-435ccec3-09dd-4587-9ebd-2f3cad6bc2bc) and [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  
  
3. Next to **Product licenses**, click **Edit**.  
  
4. Make sure a license is **not** assigned to this user, and then click **Save**.  
  
   > [!IMPORTANT]
   > Unlicensed [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global and Power Platform admins have access to the *administrative* areas. However, if the administrator also needs access to additional areas you must select a license for the user.  
  
5. Select **Manage roles**, and then select either **Global administrator** or **Show all by category** > **Power Platform admin**. For more information about these roles, see [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  
  
6. Select  **Save changes**.  
  
> [!NOTE]
> Global and Power Platform admins who don't have a license are automatically synced into the environment with an access mode of 'Administrative' while administrators who have a license are synced into the environment with an access mode of 'Read-Write'.  These administrators are assigned a System Administrator security role. 
> 
> Unlicensed administrators who need to work with Power Apps for Admins PowerShell module or management connectors need to sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) at least once before invoking these administrative commands.

### See also  
[Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504) <br />
[Create an Administrative user account](https://docs.microsoft.com/power-platform/admin/create-users-assign-online-security-roles#create-an-administrative-user-account)
