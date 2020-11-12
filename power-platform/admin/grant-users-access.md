---
title: "Grant users access  | MicrosoftDocs"
description: Grant users access
author: jayasreekumar
ms.author: jkumar
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Grant users access

To have users up and running in Power Apps and customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), you complete some administrative tasks in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]—which you generally do only once—followed by administrative tasks.  

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

To have users up and running in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), you complete some administrative tasks in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]—which you generally do only once—followed by administrative tasks.  

  
Power Apps is an online service subscription. When you signed up for this service, you received a set of licenses with your subscription, one license for each user. You can purchase additional licenses if you need them.  
  
 As described in step one that follows, in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], register your users so that they are recognized in the [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)], assign a license to each user, and then assign administrative roles to the users you choose to fill those roles. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Assigning admin roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504)  
  
In Power Apps, populate the service with your organization’s data, including users and their security roles, business units, and any existing data that you want to import from other applications or services. If your organization uses business units, assign users to the appropriate business unit, and then assign a security role to each user. Customer engagement apps includes predefined security roles that aggregate a set of user permissions to simplify user security management. An organization can define additional roles or edit predefined security roles to meet its unique security needs. For more information about security roles, see [Security roles and privileges](../admin/security-roles-privileges.md).  
  
> [!IMPORTANT]
>  When you assigned any of the licenses or the Microsoft Power Automate license to a user,  the user is automatically added to all your environments, however users can’t access any apps until they’ve been assigned at least one security role. See [Step Two: Assign security roles](../admin/grant-users-access.md#BKMK_StepTwo).  
  
<a name="BKMK_O365CRMroles"></a>   

## Differences between the Microsoft Online services environment administrative roles and Microsoft Dataverse security roles  
 *Administrative roles* are available to assign to users in the [!INCLUDE[pn_MS_Online_Services_Portal](../includes/pn-ms-online-services-portal.md)]. The administrative roles cover a set of rights and permissions related to managing the service subscription, such as adding users and assigning licenses. The global administrator role has rights to control every aspect of the subscription and to add subscriptions to other online services. The password administrator role has rights to reset a user’s password, create service requests, and monitor the service.  
  
 *Security roles* are assigned within customer engagement apps and cover rights and permissions-related aspects, for example, permission to update records or to publish customizations.  
  
 The roles are similar in that both types contain aggregated sets of permissions that allow access to some items and not to others, and that allow some actions to be taken but not others. The roles are different in that the first one applies to the management of the subscription but not to the service itself, and the second applies only within the service.  
  
 Using roles is a powerful way to group a set of rights that are common to a job title or business unit. This way, the administrator can grant a whole set of permissions to users simply by assigning a user or group of users to a given role.  
  
## Step One: Provision users, and assign licenses and administrative roles in the Microsoft 365 admin center  
 Your organization’s subscription to Power Apps provides access to the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] through a global administrator account. The global administrator manages every aspect of the subscription and may add subscriptions to other [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)].  
  
 As the global administrator for your organization, one of your first tasks is to create users in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. This registers users in the system and enables users to be licensed to use services available within the online service environment. You decide which service you want your users to have by assigning a license for that service to a user. For instructions about creating users in the [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)], see [Add users and assign licenses at the same time](https://go.microsoft.com/fwlink/p/?LinkId=251998). For instructions about assigning a license to a user, see [Assign or remove licenses](https://docs.microsoft.com/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide).  
  
 During your planning phase, you might have identified a set of key administrative roles that you want to fill. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Plan for deployment and administration](../admin/plan-for-deployment-and-administration.md). Because the administrative roles provide coverage for administrative tasks when the global administrator is not available, it’s a best practice to assign these roles to users, including assigning the global administrator role to a second user. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Assigning admin roles](https://go.microsoft.com/fwlink/p/?LinkId=255444) and [Permissions in Microsoft 365](https://go.microsoft.com/fwlink/p/?LinkId=255464).  
  
### The online service sends an invitation to each user  
 After you set up a user in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], that user receives an email invitation with a link and a password for the [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)]. The credentials in the invitation provide access to the portal and to documentation. However, the users who receive these invitations can’t access customer engagement apps until you complete step two in this process.  
  
<a name="BKMK_StepTwo"></a>   

## Step Two: Assign security roles in Dynamics 365 apps  
 Sign in to customer engagement apps and add business units (if your organization needs more than one business unit), and assign security roles and business units to users. The users you registered with the online service in step one are automatically added to customer engagement apps. After you assign at least one security role to a user, that user can click the link in the email invitation, enter credentials, and begin using customer engagement apps. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Assign a security role to a user](create-users-assign-online-security-roles.md#assign-a-security-role-to-a-user).  
  
> [!IMPORTANT]
> Before you start adding information to customer engagement apps, we recommend that you turn off or disable your browser’s pop-up blocker. Pop-up blockers can block data-entry dialog boxes. 
  
 You might have data located in other systems. In your planning phase, you considered how you’ll import this data. Before you invite users into customer engagement apps, ensure that you have completed the data migration process. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Import data (all record types)](../admin/import-data-all-record-types.md).  
  
### See also  
 [Plan for deployment and administration](../admin/plan-for-deployment-and-administration.md)   
 [Import data (all record types)](../admin/import-data-all-record-types.md)   
