---
title: Create users 
description: Learn about creating users.
author: paulliew
ms.reviewer: ellenwehrle
ms.subservice: admin
ms.author: paulliew
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/02/2026
search.audienceType: 
  - admin
contributors:
  - shahzorkhan123 
  - val-bc 
ms.custom:
  - "admin-security"
  - NewPPAC
  - sfi-image-nochange
  - sfi-ga-nochange
---
# Create users

Use the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] to create user accounts for every user who needs access to apps, flows, or agents. The user account registers the user with [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)].

## Create a user account

 When you create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], the system generates a user ID and temporary password for the user. You can let the service send an email message to the user as clear text. Although the password is temporary, consider copying the information to send to the user through a more secure channel, such as from an email service that can digitally encrypt the contents. 

For step-by-step instructions for creating a [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] user account, see [Add users individually or in bulk](/microsoft-365/admin/add-users/add-users).  
  
> [!NOTE]
> When you create a user and assign a license in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], the user is also created in customer engagement apps. It can take a few minutes to complete the synchronization process between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and customer engagement apps.
>
> By entering a user ID and password, a user can access the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] to view information about the service. However, the user doesn't have access to customer engagement apps until the user has a security role assigned either directly or indirectly as a member of a [group team](manage-group-teams.md). 

> [!TIP] 
> To force an immediate synchronization between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and customer engagement apps, complete the following steps:  
> 
> - Sign out of the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Close all open browsers used for the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Sign back in to the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
## User types

### Regular users

These users are the regular synchronized users from Microsoft Entra ID.

### Agent users (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

These users have [agent identities in Microsoft Entra Agent ID](/entra/agent-id/agent-identities) and are added into the Dataverse environment to get data access.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

### Application users

Identified by the presence of ApplicationId attribute in the system user record. To check the Microsoft Entra application ID, go to [View or edit the details of an application user](manage-application-users.md#view-or-edit-the-details-of-an-application-user).

### Non-interactive users

- License-specific provisioning business rules don't apply to these users after they're marked as non-interactive. Note: security group specific rules still apply. 
- Can't access Microsoft Dataverse web interface or admin portals.
- Can only access Dataverse via SDK/API calls.
- There's a maximum limit of seven non-interactive users per instance.

### Users without licenses (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

- Microsoft Entra ID users who don't have a Dynamics 365 or Power Apps license assigned.
- Admins can enable the [**Activities for users without licenses**](settings-features.md#activities-for-users-without-licenses-preview) feature to allow these users to be added to Dataverse activities.
- Created in Dataverse when they're added to Dataverse activities in ToLine, ccLine, or bccLine.
- Created with a user status of **Disabled**.
- Can't access Microsoft Dataverse web applications, Power Apps, or Power Platform admin portals.
- Can be converted to regular users when a Dynamics 365 or Power Apps license is assigned.
- Admins can't create these users manually.

### Support user

- Dataverse creates the user record and doesn't synchronize it with Microsoft Entra ID.
- Placeholder user record for all of the internal Microsoft support users. 
- Key identifiers: 
  - UPN (User Principal Name) value is crmoln@microsoft.com.
  - Access mode value is 3.
- All Microsoft support users are mapped to this well-known record at runtime.

Learn more in [System and application users](system-application-users.md).

### Delegated administrator

- Dataverse creates the user record and doesn't synchronize it with Microsoft Entra ID. 
- Acts as a placeholder user record for all of customer's delegated admin partner users to access Dataverse as delegated administrators. 
- Key identifiers: 
  - UPN value is crmoln2@microsoft.com. 
  - Access mode value is 5. 
- Maps all the delegated admin partner users to this well-known record at runtime.

Learn more in [For partners: the Delegated Administrator](for-partners-delegated-administrator.md) and [System and application users](system-application-users.md).

## User profile information

The [!INCLUDE [pn-office-365-admin-center](../includes/pn-office-365-admin-center.md)] maintains and manages some user profile information. When you create or update a user, the system automatically updates and synchronizes these user profile fields in your Microsoft Power Platform environments.

The following table shows the fields that the **Users** section of the [!INCLUDE [pn-office-365-admin-center](../includes/pn-office-365-admin-center.md)] manages.

<table>
<thead>
<tr class="header">
<th><p>Customer engagement apps user form </th><th>Dataverse SystemUser object</th><th>Microsoft 365/Microsoft Entra user</th></tr>
</thead>
<tbody>
<tr><td>User Name</td><td>DomainName</td><td>Username</td></tr>
<tr><td>Full Name*  </td><td>Full Name </td><td>Full Name </td></tr>
<tr><td>Title </td><td>JobTitle </td><td>Job title </td></tr>
<tr><td>First Name </td><td>FirstName </td><td>First Name </td></tr>
<tr><td>Last Name </td><td>LastName </td><td>Last Name </td></tr>
<tr><td>Primary Email**</td><td>InternalEmailAddress***</td><td>Mail </td></tr>
<tr><td>Main Phone </td><td>Address1_Telephone1 </td><td>Office phone</td></tr>
<tr><td>Mobile Phone  </td><td>MobilePhone  </td><td>Mobile phone</td></tr>
<tr><td>Street  </td><td>Address1_Line1   </td><td>Street address   </td></tr>
<tr><td>City  </td><td>Address1_City   </td><td>City   </td></tr>
<tr><td>State/Province   </td><td>Address1_StateOrProvince    </td><td>State or province    </td></tr>
<tr><td>Postal Code   </td><td>Address1_PostalCode    </td><td>Postal Code    </td></tr>
<tr><td>Country   </td><td>Address1_Country    </td><td>Country or region    </td></tr>
<tr><td>AzureActiveDirectoryObjectId****     </td><td>AzureActiveDirectoryObjectId   </td><td>ObjectId   </td></tr>
<tr><td colspan="3">* The system doesn't automatically update or synchronize the Full Name with customer engagement apps.<br>** To prevent data loss, the system doesn't automatically update or synchronize the PrimaryEmail field with customer engagement apps.<br>*** Customers can update InternalEmailAddress. After this update, sync no longer updates this field.<br>**** ObjectID of a user or a service principal in Microsoft Entra ID.<br /></td></tr>
</tbody>
</table>

> [!NOTE]
> Microsoft 365, Microsoft Entra, and Power Platform **never** synchronize custom fields.
> 
> All fields are **always** synchronized, except fields explicitly mentioned as not automatically updated (custom fields, Full Name, Primary Email, and Internal Email Address after a customer update).
>
> If the First Name is originally blank, the system adds a "#" as the First Name.

## View and edit a user profile

To view and edit a user's profile in the Power Platform admin center:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, and then select **Users**.
1. Select a user from the list.

A pane is displayed with details of the user. You can view and modify key user profile details, including security roles, team membership, business unit, manager, position, and more.

Additionally, you can:
- Use **Run diagnostics** to troubleshoot access problems.
- Use **Refresh user** to resync information from Microsoft Entra ID. 

## Add a license to a user account

You can license the user when you create the user account, or you can license the user later. You must assign a license to every user account that you want to access the online service. See [Assign licenses](assign-licenses.md).

## Assign a security role

Security roles control a user's access to data through a set of access levels and permissions. The combination of access levels and permissions that are included in a specific security role sets limits on the user's view of data and on the user's interactions with that data.  See [Assign a security role to a user](assign-security-roles.md).

## Enable or disable user accounts

User enablement and disablement only apply to environments that have a Dataverse database. To enable a user in an environment that has a Dataverse database, ensure that they're allowed to sign in, assign a license to the user, and then add the user to the security group that's associated with the environment. These criteria are the same ones you use to [add users to an environment](add-users-to-environment.md). 

To enable a user, assign a license to the user and add the user to the security group that's associated with an environment. If you enable a user account that was disabled, you must send a new invitation for the user to access the system.  
  
To disable a user account, remove a license from the user or remove the user from the security group that's associated with an environment. Removing a user from the security group doesn't remove the user's license. If you want to make the license available to another user, you must remove the license from the user account that you disabled.  

> [!NOTE]
> You can also remove all security roles from a user to prevent the user from signing in to and accessing customer engagement apps. However, this action doesn't remove the license from the user, and the user remains in the list of enabled users. Don't use this method to remove access from a user.  
>
> When you use a security group to manage enabling or disabling users or provisioning access to an org, nested security groups within the selected security group aren't supported and are ignored.
>
> You can [assign records](/powerapps/user/assign-or-share-records) to a disabled user account and also [share reports](/dynamics365/customer-engagement/basics/share-report-users-teams) and accounts with them. This action can be useful when migrating on-premises versions to online. If you need to assign a security role to users who have a Disabled status, you can do so by enabling the allowRoleAssignmentOnDisabledUsers in [OrgDBOrgSettings](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm).
>
> A Global admin, Power Platform admin, or a Dynamics 365 admin doesn't need a license to be enabled in an environment. Learn more in [Global admins and Power Platform admins can administer without a license](global-service-administrators-can-administer-without-license.md). But since they're unlicensed, they're set in the [Administrative access mode](create-users.md#create-a-read-write-user-account).  

You must be a member of an appropriate administrator role to complete these tasks. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Assign admin roles](/microsoft-365/admin/add-users/assign-admin-roles)  

### Allow a user account in an environment  

To allow a user in an environment that has a Dataverse database, you need to allow sign-in for the user, assign a license to the user, and then add the user to a security group.

#### To allow sign-in

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. In the navigation pane, select **Users**, and then choose **Active users**.
1. On **Active users**, select the user you want to update.
1. Under the user's display name, ensure that you see **Sign in allowed**. If you don't, select **Block this user**, and then unblock sign in.

#### To assign a license

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. In the navigation pane, select **Users**, and then choose **Active users**.
1. On **Active users**, select the user you want to update.
1. Select the **Licenses and apps** tab, and then choose the licenses you want to assign.
1. Select **Save changes** to apply the changes.

#### To add a user to a security group

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. In the navigation pane, select **Teams & groups**, and then choose **Active teams & groups**.
1. Select the security group associated with your environment.
1. Select the **Membership** tab.
1. In the navigation pane, select **Members**, and then select **Add members** from the command bar.
1. Choose users from the list or search for users, and then select **Add** to apply the changes.

### Prohibit a user account in an environment 

To prohibit a user account in an environment that has a Dataverse database, remove the user from the security group or remove the license from the user.

#### To remove a user from a security group

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. In the navigation pane, select **Teams & groups**, and then choose **Active teams & groups**.
1. Select the security group associated with your environment.
1. Select the **Membership** tab.
1. In the navigation pane, select **Members**. 
1. Select the users you want to remove, and then select **Remove as member** to apply the changes.

#### To remove a license from a user

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. In the navigation pane, select **Users**, and then choose **Active users**.
1. On **Active users**, select the user you want to update.
1. Select the **Licenses and Apps** tab, and then choose the licenses you want to remove.
1. Select **Save changes** to apply the changes.

Removing a license from a user might not always disable the user account, though the license is freed up for assigning to another user. The recommended approach to disabling a user account in an environment is to remove them from the security group that's associated with the environment.

> [!NOTE]
> You can also delete users in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. When you remove a user from your subscription, the license assigned to that user automatically becomes available to be assigned to a different user. If you want the user to still have access to other applications you manage through [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)]&mdash;for example, [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] or [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)]&mdash;don't delete them as a user. Instead, remove the license you assigned to them.  
> 
> When you sign out of the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], you aren't signing out of customer engagement apps. You have to do that separately.  

> [!TIP]
> To force an immediate synchronization between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and customer engagement apps, complete the following steps:  
> 
> - Sign out of the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Close all open browsers used for the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Sign back in to the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  

## Add users to Dataverse

For users to access applications and data in an environment, the SystemUser table in Dataverse must have a record for each user identity. You can add users to Dataverse through different mechanisms, either automatic or on demand: 

> [!TIP]
> Check out the following video: [Adding users to Dataverse](https://learn-video.azurefd.net/vod/player?id=373c7bec-b315-4958-8bb7-1d5d6fb03a81).

1. A system background process runs periodically to synchronize changes from Microsoft Entra and updates the SystemUser records in Dataverse based on a predetermined set of [requirements](#requirements-for-successfully-adding-users-in-dataverse). The time it takes to synchronize all changes into Dataverse depends on the total number of users that must be added or updated. For large organizations with thousands of users in Microsoft Entra ID, create security groups associated with each environment, so you add only the required subset of users into Dataverse.

   > [!NOTE]
   > The automatic synchronization process doesn't pick up all users added in Microsoft Entra ID. [This section](#user-types) details the eligibility criteria the system background process applies to add a user from Microsoft Entra ID into Dataverse.

1. If users already exist in Microsoft Entra ID, the process automatically adds them to the SystemUsers table when they first attempt to access the environment. If a user already exists in Dataverse but is in a disabled state, attempting to access the environment updates the user's state to "enabled", assuming they're entitled at the time of access. 

1. Users with the necessary permissions can use the [API](/powershell/module/microsoft.powerapps.administration.powershell/add-adminpowerappssyncuser?view=pa-ps-latest&preserve-view=true) to add or update users in Dataverse on demand. 

1. Administrators can use the Power Platform admin center user management experience to [add users in Dataverse on demand](add-users-to-environment.md#add-users-to-an-environment-that-has-a-dataverse-database). 

## Categories of users not added automatically in Dataverse

In certain conditions, the system background process doesn't add users automatically into Dataverse. In these cases, add users on demand either when they first attempt to access the environment or by an administrator using the API or the Power Platform admin center. These conditions are:

1. Users are part of a Dataverse for Teams environment type.
1. Users are part of an environment with a Dataverse database and have a free Dataverse service plan from Microsoft 365 licenses.
1. Users are part of an environment with a Dataverse database and environment level app-pass license type.

> [!NOTE]
> You can't add users to the SystemUser table either automatically or on demand in environments without Dataverse database.  

## Requirements for successfully adding users in Dataverse

To successfully add a user to the Dataverse table, ensure the following criteria are met: 

1. The user is enabled and not deleted or soft-deleted in Microsoft Entra ID. The user must be enabled in Microsoft Entra to be enabled in a Dataverse database. If you add a user to Dataverse and then delete the user in Microsoft Entra ID, the state in the Dataverse table updates to "disabled".  

1. The user has a valid license, with these exceptions:
   1. Admin users don't require a license. Unlicensed Microsoft Entra admins are enabled in the systems as "Setup user" and have administrative only access mode. 
   1. Individual users don't need a license when the environment has app pass capacity. This exception only applies to adding users on demand (either at first attempt to access the environment or through API/Power Platform admin center). 
   1. Individual users don't need a license when the tenant they're part of has a tenant level Marketing license. This exception only applies to adding users on demand (either at first attempt to access the environment or through API/Power Platform admin center). 
   1. Non-interactive users don't need a license.
   1. Free Dataverse plans from Microsoft 365 license are honored when users added on-demand (either at first attempt to access the environment or through API/Power Platform admin center). 

    > [!NOTE]
    > Guest users should also have a license from the environment's tenant. License from Guest user's tenant isn't considered as valid license.

1. If the environment has a security group defined, the user must be part of the respective security group, unless the user is a Tenant or Power Platform Administrator. Nonadmin users or Dynamics 365 service admin must be in the security group to access the system. When you add the owner of the security group to Dataverse through an on-demand action, the user is considered a valid member of the security group and is added to Dataverse successfully.  

Adding users to Dataverse has different implications depending on the environment type:

1. If users are part of a trial environment, they don't need email approval for being added to Dataverse. You add users to Dataverse only on demand. The background sync process still runs to keep the users in the environment up-to-date, but it doesn't add users automatically.

1. Only the initial user that created the developer environment type is added to Dataverse.

1. Users that are part of a Dataverse for Teams environment are added to Dataverse's SystemUser table as a result of the user's first attempt to access the environment.

## Create a read-write user account

By default, all licensed users have an access mode of **Read-Write**. This access mode gives the user full access rights based on the assigned security privileges.

**To update the access mode of a user:**

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, and then select **Users**.
1. Select a user. A pane is displayed showing details about the user.
1. In the command bar, select **...**, and then choose **Manage user in Dynamics 365**.
1. In the user form, select the **Administration** tab.
1. In the **Client Access License (CAL) Information** pane, from the **Access Mode** list, select **Read-Write**.  
1. In the command bar, select **Save** to apply the changes.

## Create an administrative user account

An administrative user is a user who has access to the settings and administration features, but has no access to any of the functionalities. Use this account to assign administrative users to perform day-to-day maintenance functions such as creating user accounts, managing security roles, and so on. Because an administrative user doesn't have access to customer data, apps, or any functionality, the user doesn't require a license after setup.

You need to have the System Administrator security role or equivalent permissions to create an administrative user. First, you create a user account in Microsoft 365, and then in to the customer engagement app, select the **Administrative** access mode for the account.

> [!NOTE]
> Any admin user with the Global admin, Power Platform admin, or Dynamics 365 Service admin role will receive the **Administrative** access mode as long as there are no user licenses assigned. This is true regardless of enabling app-passes or pay-as-you-go use at the tenant level.
> 
> Go to [Create an administrative user and prevent elevation of security role privilege](prevent-elevation-security-role-privilege.md) for an example of how an Administrative user account can be used.

Create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. Be sure to assign a license to the account. You'll remove the license in a later step after you've assigned the **Administrative** access mode.

1. In the **Optional settings** form, expand **Roles**.
1. Scroll down the form, and then select **Show all by category**.
1. Select the **Power Platform Administrator** or **Dynamics 365 Administrator** check box.
1. Wait for the user to sync to the environments.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, and then select **Users**.
1. Select a user. A pane is displayed showing details about the user.
1. In the command bar, select **...**, and then choose **Manage user in Dynamics 365**.
1. In the user form, select the **Administration** tab.
1. In the **Client Access License (CAL) Information** pane, from the **Access Mode** list, select **Administrative**.  
1. In the command bar, select **Save** to apply the changes.

Now you need to remove the license from the account.  

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. In the navigation pane, select **Users**, and then choose **Active users**.
1. On **Active users**, select the user you want to update.
1. Select the **Licenses and Apps** tab, and then clear the license boxes.
1. Select **Save changes** to apply the changes.
  
## Create a non-interactive user account

A non-interactive user account doesn't represent a person. It's an access mode you create with a user account. Use it for programmatic access to and from customer engagement apps between applications. A non-interactive user account lets these applications or tools&mdash;such as a connector from customer engagement apps to ERP&mdash;authenticate and access customer engagement apps without requiring a license. For each environment, you can create up to seven non-interactive user accounts.  
  
You need the System Administrator security role or equivalent permissions to create a non-interactive user. 

First, create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. Be sure to assign a license to the account. Then in customer engagement apps, select the non-interactive access mode for the account.  

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, and then select **Users**.
1. Select a user. A pane is displayed showing details about the user.
1. In command bar, select **...**, and then select **Manage user in Dynamics 365**.
1. In the user form, select the **Administration** tab.
1. In the **Client Access License (CAL) Information** pane, from the **Access Mode** list, select **Non-interactive**.  
1. In the command bar, select **Save** to apply the changes.

Next, remove the license from the account.  

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. In the navigation pane, select **Users**, and then choose **Active users**.
1. On the **Active users** page, select the non-interactive user account. 
1. Select the **Licenses and Apps** tab, and then clear the license boxes.
1. Select **Save changes** to apply the changes.

Go back to the customer engagement app and confirm that the non-interactive user account **Access Mode** is still set to **Non-interactive**.  

## Create an agent user (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, and then select **Agents**.
1. Select **+ Add agent** from the command bar. The **Add agent** pane appears.
1. Choose the agent user from the search list, and then select **Add** to add the agent.
1. On the **Manage security roles** page, select a security role for your agent.
1. Select **Save** to apply the changes.

For step-by-step information about creating a Microsoft Entra agent identity, see [Create agent identities in agent identity platform](/entra/agent-id/create-delete-agent-identities?tabs=microsoft-graph-api).

## Create an application user

Use server-to-server (S2S) authentication to securely and seamlessly communicate between Dataverse and your web applications and services. S2S authentication is the common way that apps registered on [!INCLUDE[pn_microsoft_appsource](../includes/pn-microsoft-appsource.md)] access the Dataverse data of their subscribers. All operations that your application or service performs by using S2S are performed as the application user you provide, rather than the user who's accessing your application.  

You create all application users with a non-interactive user account, but they don't count toward the limit of seven non-interactive user accounts. In addition, there's no limit on how many application users you can create in an environment.

> [!CAUTION]
> The system adds a hashtag (#) as the first name for the application user you create. This addition is by design.

For step-by-step information about creating an application user, see [Create an application user](manage-application-users.md#create-an-application-user).

### Enable or disable application users

When you create application users, they're automatically enabled. The default **Application User** form shows the status in the form footer, but you can't update the **Status** field.

You can customize the default **Application User** form to allow updates to the **Status** field so that you can enable or disable application users, if necessary. For step-by-step information about customizing the default **Application User** form, see [Enable or disable application users](/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#enable-or-disable-application-users).

> [!CAUTION]
> Disabling an application user breaks all the integration scenarios that use the application user.

### Manage application users in the Power Platform admin center

Microsoft is in the process of moving application user management from the legacy web client as documented in [Enable or disable application users](create-users.md#enable-or-disable-user-accounts). To manage application users from the Power Platform admin center, see [Manage application users in the Power Platform admin center](manage-application-users.md).

## How stub users are created

A stub user is a user record that you create as a placeholder. For example, you import records that refer to this user but the user doesn't exist in customer engagement apps. This user can't sign in, can't be enabled, and can't be synchronized to Microsoft 365. You can only create this type of user through data import.

> [!CAUTION]
> To prevent creating duplicate user records with the same UPN or throw errors during data import workflows, ensure that users exist in Entra ID and are sufficiently licensed for pre-provisioning. Office licenses aren't supported for pre-provisioning, but any Power Apps Premium or Dynamics 365 licenses are supported for pre-provisioning. Once users meet these requirements, they're synchronized with Dataverse environments.  
> If you must reassign records from a stub user to another user, use the [Add-BulkRecordsToUsers](https://github.com/microsoft/PowerApps-Samples/tree/master/powershell/UserManagement/Microsoft.PowerPlatform.Administration.UserManagement#command-add-bulkrecordstousers).

A default security role is automatically assigned to these imported users. The **Salesperson** security role is assigned in a Dynamics 365 Sales environment and the **Basic User** security role is assigned in other environments.

> [!NOTE]
> By default, you can only assign a security role to users with an Enabled status. If you need to assign a security role to users who have a Disabled status, you can do so by enabling the allowRoleAssignmentOnDisabledUsers [OrgDBOrgSettings](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm).

### View stub users
To view a stub user's profile in the Power Platform admin center, complete the following steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, and then select **Users**.
1. In the **Search** bar, search for **stub users**.
1. Select a stub user to view the user details.

> [!NOTE]
> The **Refresh user** and **User diagnostics** options aren't available for a stub user.

### Update a user record to reflect changes in Microsoft Entra ID

When you create a new user or update an existing user in Dynamics 365 Customer Engagement (on-premises), the system populates some fields in the user records, such as name and phone number, with information from Active Directory Domain Services (AD DS). After you create the user record, the system doesn't synchronize Microsoft Entra user accounts and customer engagement apps user records. If you make changes to the Microsoft Entra user account, you must manually edit the user record to reflect the changes.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 
1. Expand **Users + permissions**, and then select **Users**.
1. Select the user you want to update.

The following table shows the fields that the user form (user record) populates from the Microsoft Entra user account.

<table>
<thead>
<tr class="header">
<th><p>User form</p></th>
<th><p>Active Directory user</p></th>
<th><p>Active Directory object tab</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>User name</p></td>
<td><p>User logon name</p></td>
<td><p>Account</p></td>
</tr>
<tr class="even">
<td><p>First name</p></td>
<td><p>First name</p></td>
<td><p>General</p></td>
</tr>
<tr class="odd">
<td><p>Last name</p></td>
<td><p>Last name</p></td>
<td><p>General</p></td>
</tr>
<tr class="even">
<td><p>Main Phone</p></td>
<td><p>Telephone number</p></td>
<td><p>General</p></td>
</tr>
<tr class="odd">
<td><p>Primary Email</p></td>
<td><p>Email</p></td>
<td><p>General</p></td>
</tr>
<tr class="even">
<td><p>Address*</p></td>
<td><p>City</p></td>
<td><p>Address</p></td>
</tr>
<tr class="odd">
<td><p>Address*</p></td>
<td><p>State/province</p></td>
<td><p>Address</p></td>
</tr>
<tr class="even">
<td><p>Home phone</p></td>
<td><p>Home</p></td>
<td><p>Telephones</p></td>
</tr>
<tr>
<td colspan="3">* The Address field comprises the values from the City and State/province fields in Microsoft Entra ID.</td></tr>
</tbody>
</table>

## FAQ

### If I disable or remove a license for a user in Microsoft Entra ID, how does that change show up in Dataverse?
 
The user record stays in Dataverse, but its state changes to **disabled**.  

### Are all users in Microsoft Entra added to Dataverse?

Only users who meet specific criteria are added to Dataverse. If existing users no longer meet these criteria, their state changes to **disabled**.

### How can I improve the performance of adding users in Dataverse?

Assign a Microsoft Entra security group to the environment. This practice not only follows best practices but also can boost performance when you add users from that security group to Dataverse. 

### Related content

[User settings](users-settings.md) <br />
[Get started with security roles in Dataverse](/training/modules/get-started-security-roles/) <br />
[Assign a security role to a user](assign-security-roles.md) <br />
[Opt-out of automatic license-based user roles management](opt-out-automatic-license.md)
