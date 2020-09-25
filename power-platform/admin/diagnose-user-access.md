---
title: "Diagnose user access in an environment  | MicrosoftDocs"
description: About diagnose user access in an environment 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/25/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Diagnose user access in an environment 

Multiple factors affect user access to Common Data Service environments. The "Run diagnostics" feature allows administrators to assess user access to an environment and provides details and mitigation suggestions as to why a user can or can't access a Common Data Service environment. 

A user’s access to a Common Data Service environment is determined through the following criteria.

The user: 

1.	must be enabled for sign-in in Azure Active Directory.
2.	must have a valid license that has a Dynamics or Power Platform recognized service plan or the environment must have active per app plans.
3.	must be a member of the environment’s Azure Active Directory Group (if one has been associated with the environment).
4.	must have at least one Common Data Service security role assigned directly to them or to a [group team](manage-teams.md#about-group-teams) they are a member of.

User level of access within the environment and to the resources (apps and data) in the environment is determined by the privileges defined in the security roles assigned to them. Their access mode being [Administration](admin-mode.md) or [Read-Write](create-users-assign-online-security-roles.md#create-a-read-write-user-account) also determines their level of access within an environment.

Use the following steps to run user access diagnostics on a user in an Common Data Service environment.

1. In the [Power Platform admin center](https://admin.powerplatform.microsoft.com), select an environment. 

2. Select **Settings** > **Users + permissions** > **Users**.  

3. Select a user. 

4. Select **Run diagnostics** and review the details for the user.

5. Review the details for the user.

   > [!div class="mx-imgBorder"] 
   > ![Run diagnostics results](media/run-diagnostics-results.png "Run diagnostics results")

> [!NOTE]
> The action of running/re-running diagnostics will force the user information in Azure Active Directory to sync (synchronize) to the environment’s Common Data Service database to provide up-to-date status on the user’s properties. If the diagnostic run does not eliminate the root cause of a user access issue, please provide the results of the diagnostic run in the support ticket you create as this will greatly help Microsoft support engineers to resolve your issue faster. 

## Known issue

The check for presence of security roles assigned to a user only checks for roles directly assigned to the user and does not have the capability today to check for the presence of roles inherited through group team memberships.

