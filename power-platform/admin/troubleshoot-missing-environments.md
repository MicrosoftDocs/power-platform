---
title: "Troubleshoot missing environments"
description: "Learn how to update a record’s owner, an Owning Business Unit, or both an Owner and Owning Business Unit because the record changes ownership."
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/03/2022
ms.subservice: admin
author: davidme-ms
ms.author: davidme 
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---
# Troubleshoot missing environments

It’s not uncommon for an administrator or a maker to expect to find an environment in the environment list and discover that one or more environments is “missing” from the list. This can occur in the Power Platform admin center, in the Power Apps maker portal, or in the Power Automate portal. Each of these experiences has different requirements for inclusion of environments in the list. The set of environments a given user will see in the list in the context of each of these experiences will vary. 

This document describes the criteria for environment inclusion in each product experience and provides guidance on how to troubleshoot. 

## Prerequisites 

To troubleshoot an environment missing issue, three pieces of information are required: 

1. Which environment does the user expect to see in the list that they aren’t seeing? This can be specified by the environment identifier (typically a GUID), the environment display name, or the Dataverse instance URL (if the environment has a Dataverse database). 

2. Which user is experiencing the problem? Since role assignments vary from user to user, the identity of the user experiencing the problem is required information. This can be given by the Microsoft Entra object ID or by the UPN of the user. 

3. In which product experience is the customer missing the environment? The rules for inclusion are different for the Power Platform admin center, the Power Apps maker portal, and the Power Automate portal, so this is required information. 

## Requirements for access by product experience 

This table lays out the unique requirements that must be met for an environment to show up in the environment list in each of the main product experiences. 


|Product experience   |Inclusion rules   |
|---------|---------|
|Power Platform admin center environment list      | Users must have administrative access to the environment for the environment to show up in the main Power Platform admin center environment list (System Administrator role in Dataverse, Environment Admin role for environments without Dataverse). Microsoft Entra Global admins, Power Platform admins, delegated admins, and authorized service principals will see all environments in the tenant. Dynamics 365 admins are limited to seeing environments in which they're a member of the environment security group, if one has been applied.         |
|Power Apps maker portal environment list      | The environment list in the Power Apps maker portal includes all environments in which the user has been assigned the Environment maker role plus any environments in which the user has maker permission to one or more apps. **Note**: Assignment of the Environment Administrator role doesn't cause the environment to be included in the environment list in the maker portal.         |
|Power Automate portal environment list      | The Power Automate portal includes environments in which the user has any built-in security role plus any environments in which the user is a co-owner of one or more flows.         |

> [!NOTE]
> PowerShell for [Power Platform Administrators](powerapps-powershell.md#power-apps-cmdlets-for-administrators), CLI ([pac admin list](../developer/cli/reference/admin.md#pac-admin-list)), and related administration APIs and tooling use the same inclusion rules as the Power Platform admin center. 

## Troubleshooting steps 

The troubleshooting steps should be carried out by an administrator of the environment with access to the environment in the Power Platform admin center, or by a user who is a member of the Global administrator or Power Platform administrator directory roles. 

### Sync delays 

Due to caches and asynchronous processes in the service, users that were only very recently given access to an environment may not see it show up in the list right away. Generally, they should have access within a minute or two, however it would be prudent to wait 10 minutes before proceeding with further troubleshooting steps. 

### Tenants with many environments 

To ensure the admin center loads quickly for tenants with many environments, the environment list in the admin center may only display a small subset of the environments upon first load. Look for and select **Show all** at the bottom of the list to see the full list of environments in the tenant that you're authorized to access. Using the search function will also trigger the loading of all environments.

:::image type="content" source="media/loading-more-environments.png" alt-text="Loading more environments in the background.":::

### Check if the environment has been deleted 

If users that are members of the tenant-level administrator directory roles aren't able to see the environment in the admin center, then you should first check whether the environment has been deleted. If it was recently deleted, an administrator can initiate a [recover environment](recover-environment.md) operation. 

If the environment hasn't been deleted and still doesn’t show up in the admin center for users that are Global admins or Power Platform admins, then you may need to create a [support request](get-help-support.md) for further diagnostics and remediation steps. Be sure to provide the three key pieces of information as noted in the [Prerequisites section](#prerequisites) above.  

### Check role assignments of the user 

The most common reason for environments to not show up in the list is a missing [role assignment](assign-security-roles.md). Compare the roles assigned to the user with the requirements in the [Requirements table](#requirements-for-access-by-product-experience) above. 

In Dataverse environments, the role may be assigned directly to the user or indirectly via an assignment of the role to an [Microsoft Entra group team](manage-teams.md). 

> [!NOTE]
> Role assignments made via Dataverse owner teams will not cause an environment to be included in the environment list. Do not attempt to use owner teams for this purpose. 

### Run user access diagnostics 

This step only applies to environments with a Dataverse database. Many of the same issues that can cause a user to have issues accessing an environment at runtime can also cause the environment to be missing for the user in the admin center and/or other experiences. Powerful [user access diagnostics](troubleshooting-user-needs-read-write-access-organization.md) are available in the admin center. It's strongly suggested to use this feature to check for and to remediate common issues that might prevent a user from having access to an environment. 

Common issues that may be identified by this step include: 

1. The user is [not a member of the environment security group](troubleshooting-user-needs-read-write-access-organization.md#user-isnt-a-member-of-the-environments-security-group). 
2. The user is missing from the environment, or the user record in Dataverse is out of sync with Microsoft Entra ID, and so the user may need to be [explicitly added by an administrator](add-users-to-environment.md). 

## Special notes about developer, trial, and support environment types 

This section only applies to developer, trial, and support environments with a Dataverse database.

Global administrators and Power Platform administrators have administrative access to all environments in the tenant in the Power Platform admin center. However, the developer, trial, and support environment types have special user sync behavior such that only the initial user is added to the SystemUsers table in Dataverse. This may mean that further administrators need to be [explicitly added to the environment](add-users-to-environment.md) in order for them to have complete access to all administrative functions. A common example is using management connectors to access the environment. 

## Getting help 

After following this guide and confirming role assignments for the user, if the environment is still not showing up in the list, you may need to create a [support request](get-help-support.md) for further diagnostics and remediation steps. Be sure to provide the three key pieces of information as noted in the prerequisites section above.  





[!INCLUDE[footer-include](../includes/footer-banner.md)]