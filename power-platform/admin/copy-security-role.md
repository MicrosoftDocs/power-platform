---
title: "Copy a security role  | MicrosoftDocs"
description: Copy a security role
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/09/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Save time creating a security role by copying one

If you want to create a security role that is similar to another security role, you can copy an existing security role and save it with a new name. You can then modify the privileges and access levels to accommodate the new security role.  
  
> [!NOTE]
> - You can't copy a security role to a different business unit.  
> - Security role privileges are subject to change with updates and the copied security role could become out-of-date. You should periodically check security role privileges. See [Create an administrative user and prevent elevation of security role privilege](prevent-elevation-security-role-privilege.md) for an alternative method to assign security role privileges that will change dynamically.
  
1. [!INCLUDE[proc_permissions_system_admin_and_customizer](../includes/proc-permissions-system-admin-and-customizer.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_check_your_security_role](../includes/proc-check-your-security-role.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the Microsoft Power Platform admin center, select an environment. 

3. Select **Settings** > **Users + permissions** > **Security roles**.  
  
4. In the list of security roles, under **Name**, select the security role you want to copy, and then on the Actions toolbar, select **More Actions** > **Copy Role**.  
  
5. In the **Copy Security Role** dialog box, in the **New Role Name** text box, type in the name for the new security role.  
  
6. To modify the new security role after creating a copy, verify that the **Open the new security role when copying is complete** check box is selected; otherwise, clear the check box.  
  
7. Select **OK**.  
  
### See also  
 [Security concepts](../admin/wp-security-cds.md)   
 [Security roles](../admin/security-roles-privileges.md)   
 [Field-level security](../admin/field-level-security.md)
 [Prevent elevation of security role privilege](prevent-elevation-security-role-privilege.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]