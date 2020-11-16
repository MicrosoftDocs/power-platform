---
title: "Set up security permissions for a field  | MicrosoftDocs"
description: Set up security permissions for a field
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/30/2020
ms.author: jimholtz
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

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

You can restrict access to a field by creating a field security profile. After you create the profile, you assign users and or teams to that profile, and set up specific read, create, or write permissions for the field.  
  
 [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Security concepts](wp-security-cds.md)  
  
1. [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
    Check your security role  
  
   - [!INCLUDE[proc_follow_steps_in_link](../includes/proc-follow-steps-in-link.md)]  
  
   - [!INCLUDE[proc_dont_have_correct_permissions](../includes/proc-dont-have-correct-permissions.md)]  
  
2. In the web app, go to **Settings** > **Security**.
  
3. Click **Field Security Profiles**, and then on the command bar, click **New**.  
  
4. Enter a name and a description (optional) and click **Save**.  
  
5. Under **Common**, click **Field permissions**.  
  
6. Select a field, and then click **Edit**.  
  
7. Select the permissions that you want to assign to users or teams, and then click **OK**.  
  
8. To add users or teams:  
  
   1.  Under **Members**, click **Teams** or **Users**.  
  
   2.  On the command bar, click **Add**.  
  
   3.  In the **Look Up Records** dialog box, select a team or user from the list (or search for a team or user), and then click **Select**.  
  
   4.  Repeat the preceding steps to add multiple teams or users, and then click **Add**.  
  
### See also  
 [Enable or disable security for a field](../admin/enable-disable-security-field.md)
