---
title: "Troubleshooting: User needs read-write access  | MicrosoftDocs"
description: "Troubleshooting: User needs read-write access"
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Troubleshooting: User needs read-write access

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

You don’t have sufficient permissions to access [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. A [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps system administrator will need to do the following in the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps:  
  
1. [!INCLUDE[proc_settings_security](../includes/proc-settings-security.md)]  
  
2. Choose **Users**.  
  
3. Open the user record.  
  
4. Choose **More Commands** (![More commands button](../admin/media/not-available.gif "More commands button")) > **Manage Roles**.  
  
5. Make note of the role assigned to the user. If appropriate, select a different security role. Close the Manage User Roles dialog box.  
  
6. Choose **Security** > **Security Roles**.  
  
7. Choose the security role from step 4.  
  
8. Choose **Core Records**.  
  
9. Confirm that the **Read** permission for **User Entity UI Settings** is set to the User level (a yellow circle with a wedge-shaped segment).  
  
     If the security role is missing this permission, the system administrator will need to change this setting by clicking or tapping on it.  
  
   ![User Entity UI settings](../admin/media/user-entity.png "User Entity UI settings")  
  
> [!NOTE]
>  If you have multiple security roles assigned, confirm that at least one assigned role has the User Entity UI Settings privilege set to the User level.  
  
### See also  

