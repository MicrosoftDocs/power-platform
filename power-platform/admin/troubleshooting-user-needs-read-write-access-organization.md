---
title: "Troubleshooting: User needs read-write access  | MicrosoftDocs"
description: "Troubleshooting: User needs read-write access"
author: jayasreekumar
ms.author: jayasreekumar
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/15/2020
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Troubleshooting: User needs read-write access

You don't have sufficient permissions to access model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service. A system administrator will need to do the following:  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Users + permissions** > **Users**.  
  
3. Open the user record.  
  
4. Select **More Commands** (![More commands button](../admin/media/not-available.png "More commands button")) > **Manage Roles**.  
  
5. Make note of the role assigned to the user. If appropriate, select a different security role. Close the Manage User Roles dialog box.  
  
6. Select **Security** > **Security Roles**.  
  
7. Select the security role from step 4.  
  
8. Select **Core Records**.  
  
9. Confirm that the **Read** permission for **User Entity UI Settings** is set to the User level (a yellow circle with a wedge-shaped segment).  
  
     If the security role is missing this permission, the system administrator will need to change this setting by clicking or tapping on it.  
  
   ![User Entity UI settings](../admin/media/user-entity.png "User Entity UI settings")  
  
> [!NOTE]
>  If you have multiple security roles assigned, confirm that at least one assigned role has the User Entity UI Settings privilege set to the User level.  
  
### See also  

