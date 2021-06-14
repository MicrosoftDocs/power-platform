---
title: "Set up security permissions for a field  | MicrosoftDocs"
description: Set up security permissions for a field
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/17/2021
author: jimholtz
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Set up security permissions for a field 

<!-- legacy procedure -->

You can restrict access to a field by creating a field security profile. After you create the profile, you assign users and or teams to that profile, and set up specific read, create, or write permissions for the field.  
  
 [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Security concepts](wp-security-cds.md)  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the web app, go to **Settings** (![Settings](media/settings-gear-icon.png "Settings")) > **Advanced Settings**.

3. Select **Settings** > **Security**.
  
4. Select **Field Security Profiles**, and then on the command bar, select **New**.  
  
5. Enter a name and a description (optional) and select **Save**.  
  
6. Under **Common**, select **Field permissions**.  
  
7. Select a field, and then select **Edit**.  
  
8. Select the permissions that you want to assign to users or teams, and then select **OK**.  
  
9. To add users or teams:  
  
   1.  Under **Members**, select **Teams** or **Users**.  
  
   2.  On the command bar, select **Add**.  
  
   3.  In the **Look Up Records** dialog box, select a team or user from the list (or search for a team or user), and then select **Select**.  
  
   4.  Repeat the preceding steps to add multiple teams or users, and then select **Add**.  
  
### See also  
 [Enable or disable security for a field](../admin/enable-disable-security-field.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]