---
title: "Troubleshooting: Common user access issues  | MicrosoftDocs"
description: "Troubleshooting: Common user access issues"
author: jayasreekumar
ms.author: jkumar
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/25/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Troubleshooting: Common user access issues

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

## User access diagnostic tool in the Power Platform admin center

Several factors influence user access in a Common Data Service environment. To help administrators with diagnosing user access to an environment and reasons for access or no access, the new “Run diagnostics” feature in the Power Platform admin center provides basic access diagnostics for individual users in the environment. The feature helps to detect potential causes to user sign-in and other issues and suggests potential mitigations. For more information, see: [Diagnose user access in an environment](diagnose-user-access.md).

## User has no roles 

When an error screen stating the user has no roles is encountered, a system administrator will need to assign roles to the user. Roles can be assigned directly to the user, or to a group team that the user is a part of. For information on how to assign Common Data Service security roles to a user, see: 
[Assign a security role to a user](create-users-assign-online-security-roles.md#assign-a-security-role-to-a-user)

## User does not have a license / user does not belong to the organization 

1. Verify if a license has been assigned to the user and assign one if not already. See: [Add a license to a user account](create-users-assign-online-security-roles.md#add-a-license-to-a-user-account).
2. Once a license is assigned, it may take some time for the license change to sync to the Common Data Service environment. To trigger a sync for this user, the system administrator for the environment can re-add the user to the environment. See: [Add users to an environment that has a Common Data Service database](add-users-to-environment.md#add-users-to-an-environment-that-has-a-common-data-service-database).

## User is not a member of the environment’s security group 

1. As a system administrator of the environment, verify that the Common Data Service environment is associated with any Azure Active Directory group. See:  [Associate a security group with a Common Data Service environment](control-user-access.md#associate-a-security-group-with-a-common-data-service-environment).
2. Ensure the user with the access issue is a member of the group associated with the environment. See: [Create a security group and add members to the security group](control-user-access.md#create-a-security-group-and-add-members-to-the-security-group).
3. Once user membership in the environment’s group is updated, it may take some time for the change to sync to the Common Data Service environment. To trigger a sync for this user, the system administrator for the environment can re-add the user to the environment. See: [Add users to an environment that has a Common Data Service database](add-users-to-environment.md#add-users-to-an-environment-that-has-a-common-data-service-database).

## User doesn’t have sufficient permissions 

You don't have sufficient permissions to access customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). A system administrator will need to do the following:  
  
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

