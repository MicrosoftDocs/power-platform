---
title: "Assign licenses | MicrosoftDocs"
description: About assigning licenses to a user.
author: jimholtz
ms.reviewer: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Assign licenses

A user account must be assigned a license in order for the user to have access to the service. Note that when you assign a user the global administrator or the service administrator role in the [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)], it automatically assigns the user the System Administrator security role. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Differences between the Microsoft Online services environment administrative roles and security roles](grant-users-access.md#BKMK_O365CRMroles)  

## Add a license to a user account  
You can license the user when you create the user account, or you can license the user later. You must assign a license to every user account that you want to access the online service. 
  
For step-by-step instructions to use user licenses, see [Assign licenses to users](/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide).
 
For step-by-step instructions to use Power Apps per app plans, see [Power Apps per app plans](about-powerapps-perapp.md).
  
> [!IMPORTANT]
> Licensed users must be assigned at least one security role to access customer engagement apps. Security roles can be assigned either directly or indirectly as a member of a [group team](manage-group-teams.md).
  
 **About user licenses**  
  
- Use user licenses to provide access to your organization. You need one user license per person with an active user record who signs in to your organization.  
  
- When you add a new person, the **New user account** form displays the number of user licenses available. You can add additional licenses by choosing **Billing** > **Purchase Services** from the left-side menu in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
- You need a user license for each invitation you issue. Even an invitation that isn't accepted requires a user license until the invitation expires two weeks after it was issued.
  
- If you have more user licenses than you're using, contact support to reduce the number of licenses. You can't reduce the number of licenses to fewer than you're currently using or fewer than your offer allows. Any changes are reflected in your next billing cycle.  
  
- Each user license requires a unique Microsoft account, and every user who signs in needs a license. Most subscriptions include a specific number of user licenses.  

> [!NOTE]
> Certain default security roles are assigned to users based on the license and/or solution installed. These security roles only give users Read access to apps that are installed in the environment. For example, when a user is assigned the Dynamics 365 Plan license and is synced to an environment that has the Customer Service Hub app, the user is automatically assigned the Customer Service app access security role. No data access permission is granted to this role. The administrator is still required to assign the appropriate security role to the user (either directly or indirectly as a member of a [group team](manage-group-teams.md#about-group-teams) in order for the user to view and interact with the data. 
