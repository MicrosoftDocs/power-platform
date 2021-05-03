---
title: "Troubleshoot common user access issues for Dataverse environments"
description: "Learn how to run and interpret diagnostics for user access to environments, including criteria for access."
author: jimholtz
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/04/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Troubleshooting: Common user access issues

Multiple factors affect user access to Microsoft Dataverse environments. Administrators can use the **Run diagnostics** command to assess user access to a Dataverse environment, and get details and mitigation suggestions as to why a user can or can't access the environment.

To access a Dataverse environment, a user must meet the following criteria:

1. Be enabled for sign-in in Azure Active Directory (Azure AD).
2. Have a valid license that has a Dynamics 365 or Microsoft Power Platform recognized service plan, or the environment must have active per-app plans.
3. Be a member of the environment's Azure AD group (if one has been associated with the environment).
4. Have at least one Dataverse security role assigned directly to them or to a [group team](manage-group-teams.md) they're a member of.

A user's level of access within the environment and to the resources (apps and data) in the environment is determined by the privileges defined in the security roles assigned to that user. Their access mode being [Administrative](create-users-assign-online-security-roles.md#create-an-administrative-user-account) or [Read-Write](create-users-assign-online-security-roles.md#create-a-read-write-user-account) also determines their level of access within an environment.

## User diagnostics

Use the following steps to run user access diagnostics on a user in a Dataverse environment.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment. 

2. Select **Settings** > **Users + permissions** > **Users**.  

3. Select a user. 

4. Select **Run diagnostics**.

   > [!div class="mx-imgBorder"] 
   > ![Select Run diagnostics](media/teams-environment-user-list.png "Select Run diagnostics") 

5. Review the details for the user, and take any needed corrective actions.

   > [!div class="mx-imgBorder"] 
   > ![Run diagnostics results](media/run-diagnostics-results.png "Run diagnostics results")

> [!NOTE]
> The action of running or rerunning diagnostics will force the user information in Azure AD to synchronize to the environment's Dataverse database to provide up-to-date status on the user's properties. If the diagnostic run doesn't eliminate the root cause of a user access issue, please provide the results of the diagnostic run in the support ticket you create; this will greatly help Microsoft Support engineers to resolve your issue faster.

## Access issues

The following issues are documented below.

|Issue  |
|---------|
| [User access diagnostic tool in the Power Platform admin center](#user-access-diagnostic-tool-in-the-power-platform-admin-center)     |
| [User has no roles](#user-has-no-roles)     |
| [User does not have a license / user does not belong to the organization](#user-does-not-have-a-license--user-does-not-belong-to-the-organization)    |
| [User is not a member of the environment’s security group](#user-is-not-a-member-of-the-environments-security-group)     |
| [User doesn’t have sufficient permissions](#user-doesnt-have-sufficient-permissions)     |
| [User is missing from environment despite meeting all requirements](#user-is-missing-from-environment-despite-meeting-all-requirements)     |
| [Adding or refreshing users on demand](#adding-or-refreshing-users-on-demand)    |
| [Known issue](#known-issue)     |

If you don't see your issue:

- See if you can get your question answered here: https://powerusers.microsoft.com/t5/Power-Apps-Community/ct-p/PowerApps1.
- Create a [support request](https://powerapps.microsoft.com/support/).

### User access diagnostic tool in the Power Platform admin center

Several factors influence user access in a Microsoft Dataverse environment. To help administrators with diagnosing user access to an environment and reasons for access or no access, the new “Run diagnostics” feature in the Power Platform admin center provides basic access diagnostics for individual users in the environment. The feature helps to detect potential causes to user sign-in and other issues and suggests potential mitigations. See [User diagnostics](#user-diagnostics).

### User has no roles 

When an error screen stating the user has no roles is encountered, a system administrator will need to assign roles to the user. Roles can be assigned directly to the user, or to a group team that the user is a part of. For information on how to assign Dataverse security roles to a user, see: 
[Assign a security role to a user](create-users-assign-online-security-roles.md#assign-a-security-role-to-a-user).

### User does not have a license / user does not belong to the organization 

1. Verify if a license has been assigned to the user and assign one if not already. See: [Add a license to a user account](create-users-assign-online-security-roles.md#add-a-license-to-a-user-account).
2. Once a license is assigned, it may take some time for the license change to sync to the Dataverse environment. To trigger a sync for this user, the system administrator for the environment can re-add the user to the environment. See: [Add users to an environment that has a Dataverse database](add-users-to-environment.md#add-users-to-an-environment-that-has-a-dataverse-database). 

### User is not a member of the environment’s security group 

1. As a system administrator of the environment, verify that the Dataverse environment is associated with any Azure Active Directory group. See:  [Associate a security group with a Dataverse environment](control-user-access.md#associate-a-security-group-with-a-dataverse-environment). 
2. Ensure the user with the access issue is a member of the group associated with the environment. See: [Create a security group and add members to the security group](control-user-access.md#create-a-security-group-and-add-members-to-the-security-group).
3. Once user membership in the environment’s group is updated, it may take some time for the change to sync to the Dataverse environment. To trigger a sync for this user, the system administrator for the environment can re-add the user to the environment. See: [Add users to an environment that has a Dataverse database](add-users-to-environment.md#add-users-to-an-environment-that-has-a-dataverse-database). 

### User doesn’t have sufficient permissions 

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
   
### User is missing from environment despite meeting all requirements 

In some cases, users are not automatically provisioned into Dataverse environments. 

If a user meets all access requirements but is still missing from an environment, the user may fall into one of the following cases:

1. Users with only Office licenses (with Dataverse plan enabled) will not be pre-provisioned into Dataverse environments.

2. Owners of Azure AD groups that are associated with Dataverse environments will not be pre-provisioned.

3. Members of Azure AD groups that are part of a Group Team created for the Azure AD group will not be pre-provisioned. 

4. Users will not be pre-provisioned into Microsoft Dataverse for Teams environments.

Although these users are not pre-provisioned, they can be added to environments through on-demand sync. See the section below for ways to add or refresh users on demand.

### Adding or refreshing users on demand

As mentioned above, there are cases where users are not provisioned automatically. Additionally, there may be delays in reflecting the users' latest status in environments. In such cases, adding or refreshing specific users on demand can be helpful. 

There are multiple ways to do this: 

1. **Just-in-time (JIT) user provisioning**: When users access an environment URL, access requirements are checked at the time of sign-in and qualified users are added to the environment.

2. **User impersonation call**: Impersonation call triggers a JIT sync for the user. See [How to impersonate a user](/powerapps/developer/common-data-service/webapi/impersonate-another-user-web-api#how-to-impersonate-a-user).

3. **Add users** in the Power Platform admin center: Admins can add or refresh users. See [Add users to an environment](add-users-to-environment.md).

4. **Powershell cmdlets**: See [Powershell support for Power Apps](./powerapps-powershell.md#power-apps-cmdlets-for-administrators).

5. **Connectors**: See [Power Platform for Admins](/connectors/powerplatformforadmins/#force-sync-user).

6. **Power Automate template**: See [Force Sync Azure Active Directory Group members to specified CDS instance](https://us.flow.microsoft.com/galleries/public/templates/6e4162ca7afc48479e3ad1caadc6c1e6/force-sync-azure-active-directory-group-members-to-specified-cds-instance/).

### Known issue

The check for the presence of security roles assigned to a user only checks for roles directly assigned to the user and can't currently check for roles inherited through group team memberships.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
