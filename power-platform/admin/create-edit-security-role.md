---
title: Create or edit a security role to manage access 
description: You can create new security roles to accommodate changes in your business requirements or you can edit the privileges associated with an existing security role.
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks
ms.custom: "admin-security"
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/31/2023
search.audienceType: 
  - admin
---
# Create or edit a security role to manage access 

You can create new security roles to accommodate changes in your business requirements or you can edit the privileges associated with an existing security role.
  
 If you need to back up your security role changes, or export security roles for use in a different implementation, you can export them as part of exporting customizations. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Export your customizations as a solution](/powerapps/maker/common-data-service/use-solutions-for-your-customizations)  

For information on predefined security roles, see [Predefined security roles](database-security.md#predefined-security-roles).
  
## Create a security role  
  
1. Make sure that you have the System Administrator permission.
  
    Check your security role  
  
   - [!INCLUDE[proc_check_your_security_role](../includes/proc-check-your-security-role.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Microsoft Power Platform admin center, select an environment. 

3. Select **Settings** > **Users + permissions** > **Security roles (Preview)**.  
   
4. On the Actions toolbar, select **New**.  
  
5. Specify privileges for each security role using the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience.
  
6. When you have finished configuring the security role, on the toolbar, select or tap **Save and Close**.  
  
## Create a security role by Copy Role

1. Make sure that you have the System Administrator permission.
  
    Check your security role  
  
   - [!INCLUDE[proc_check_your_security_role](../includes/proc-check-your-security-role.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Users + permissions** > **Security roles (Preview)**.  
  
4. Select the Security role you want to copy from.

5. On the Actions toolbar, select **Copy Role**.  

6. Enter the New Role Name, and check the box for **Open the new security role when copying is complete**.

7. Select **OK**.
  
8. When Copying Role is complete, navigate to each tab, ie Core Records, Business Management, Customization, etc.

9. Specify privileges for each security role using the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience.

## Edit a security role  
 Before you edit an existing security role, make sure that you understand the principles of data access. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Controlling Data Access](../admin/security-roles-privileges.md)  
  
> [!NOTE]
> You can't edit the System Administrator security role. To create a security role similar to the System Administrator security role, copy the System Administrator security role, and make changes to the new role.  
  
1. Make sure that you have the System Administrator or equivalent permissions.
  
    Check your security role  
  
   - [!INCLUDE[proc_check_your_security_role](../includes/proc-check-your-security-role.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Power Platform admin center, select an environment. 

3. Select **Settings** > **Users + permissions** > **Security roles (Preview)**.  
  
4. In the list of security roles, double-select or tap a name to open the page associated with that security role.  
  
5. Specify privileges for each security role using the [new](security-roles-privileges.md#define-the-privileges-and-properties-of-a-security-role) or [legacy](security-roles-privileges.md#security-roles-and-the-legacy-ui) experience.
    
6. When you have finished configuring the security role, on the toolbar, select or tap **Save and Close**.  
  
## Minimum privileges for common tasks  

It's helpful to keep in mind the minimum privileges that are needed for some common tasks, including opening model-driven apps. This means that a user is required to have a security role with these privileges to run applications.
 
Don't use the downloadable solution for the **min prv apps use** role, available in the [Microsoft Download Center](https://go.microsoft.com/fwlink/?linkid=2221577), which will be retired soon. Instead, you must use the new predefined security role called **App Opener**.
 
Copy the **App Opener** security role to create a custom security role by following the [Create a security role by Copy Role](#create-a-security-role-by-copy-role) instructions. When you have finished creating a custom security role, select it and navigate to each tab, such as **Core Records**, **Business Management**, and **Customization** to set the appropriate privileges. 
  
- When logging in to model-driven apps or any of the customer engagement apps:  
  
  -   Assign the **App Opener** security role or the custom security role you created (by copying the **App Opener** security role) to your user.
  
  -   To render an table grid (that is, to view lists of records and other data), assign the following privileges on the Core Records tab: Read privilege on the table, Read Saved View, Create/Read/Write User Entity UI Settings
      and assign the following privilege on the Business Management tab: Read User.   

- When logging in to [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]:

   - To render navigation for customer engagement apps and all buttons: assign the min prv apps use security role or a copy of this security role to your user   
  
  - To render an table grid: assign Read privilege on the table  
  
  - To render tables: assign Read privilege on the table 

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RW10lgO]
  
## Privacy notices  
[!INCLUDE[cc_privacy_crm_for_phones](../includes/cc-privacy-crm-for-phones.md)]
  
[!INCLUDE[cc_privacy_crm_for_tablets](../includes/cc-privacy-crm-for-tablets.md)]
  %7BID%7D
[!INCLUDE[cc_privacy_crm_go_offline_in_outlook](../includes/cc-privacy-crm-go-offline-in-outlook.md)]
  
[!INCLUDE[cc_privacy_crm_sync_to_outlook](../includes/cc-privacy-crm-sync-to-outlook.md)]
  
 [!INCLUDE[cc_privacy_export_to_excel](../includes/cc-privacy-export-to-excel.md)]
  
 [!INCLUDE[cc_privacy_crm_print](../includes/cc-privacy-crm-print.md)]
  
### See also  
 [Security concepts](../admin/wp-security-cds.md)   
 [Copy a security role](../admin/copy-security-role.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
