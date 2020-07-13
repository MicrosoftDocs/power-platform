---
title: "Troubleshooting: Common user access issues  | MicrosoftDocs"
description: "Troubleshooting: Common user access issues"
author: jayasreekumar
ms.author: jayasreekumar
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/13/2020
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Troubleshooting: Common user access issues

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

