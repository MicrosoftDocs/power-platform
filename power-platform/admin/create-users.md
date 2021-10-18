---
title: "Create users | MicrosoftDocs"
description: About creating users.
author: jimholtz
ms.reviewer: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.custom: "admin-security"
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/18/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create users

You use the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] to create user accounts for every user who needs access to apps created using Power Apps and customer engagement apps in Dynamics 365 (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). The user account registers the user with [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)]. 

## Create a user account  
 When you create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], the system generates a user ID and temporary password for the user. You have the option to let the service send an email message to the user as clear text. Although the password is temporary, you might consider copying the information to send to the user through a more secure channel, such as from an email service that can digitally encrypt the contents. 

For step-by-step instructions for creating a [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] user account, see [Add users individually or in bulk](/microsoft-365/admin/add-users/add-users).  
  
> [!NOTE]
> When you create a user and assign a license in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], the user is also created in customer engagement apps. It can take a few minutes to complete the synchronization process between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and customer engagement apps.
>
> By entering a user ID and password, a user can access the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] to view information about the service. However, the user won't have access to customer engagement apps until the user has a security role assigned either directly or indirectly as a member of a [group team](manage-group-teams.md). 

> [!TIP] 
> To force an immediate synchronization between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and customer engagement apps, do the following:  
> 
> - Sign out of the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Close all open browsers used for the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Sign back in to the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
## User types

### Regular users
These are the regular synchronized users from Azure Active Directory (Azure AD).

### Application users
Identified by the presence of ApplicationId attribute in the system user record. To check the Azure AD application ID, see [View or edit the details of an application user](manage-application-users.md#view-or-edit-the-details-of-an-application-user).

### Non-interactive users
- License specific provisioning business rules does not apply to these users after they are marked as non-interactive. Note: security group specific rules still apply. 
- Cannot access Microsoft Dataverse web interface or admin portals.
- Can only access Dataverse via SDK/API calls.
- There is a maximum limit of 7 non-interactive users per instance.

### Support user
See [System and application users](system-application-users.md).

- Not synchronized with Azure AD, and created by Dataverse out of the box.
- Placeholder user record for all of the internal Microsoft support users. 
- Key identifiers: 
  - UPN value is crmoln@microsoft.com.
  - Access mode value is 3.
- All Microsoft support users will be mapped to this well-known record at runtime.

### Delegated administrator

See the following: <br />
[For partners: the Delegated Administrator](for-partners-delegated-administrator.md) <br />
[System and application users](system-application-users.md)

- Not synchronized with Azure AD, and created by Dataverse out of the box. 
- Placeholder user record for all of customer’s delegated admin partner users to access Dataverse as delegated administrators. 
- Key identifiers: 
  - UPN value is crmoln2@microsoft.com. 
  - Access mode value is 5. 
- All the delegated admin partner users will be mapped to this well-known record at runtime. 

## User profile information

Some user profile information is maintained and managed in the [!INCLUDE [pn-office-365-admin-center](../includes/pn-office-365-admin-center.md)]. After you create or update a user, these user profile fields are automatically updated and synchronized in your Microsoft Power Platform environments.

The following table shows the fields that are managed in the **Users** section of the [!INCLUDE [pn-office-365-admin-center](../includes/pn-office-365-admin-center.md)].

<table>
<colgroup>
<col style="width: 50%"/>
<col style="width: 50%"/>
</colgroup>
<thead>
<tr class="header">
<th><p>Customer engagement apps user form </th><th>Microsoft 365/Azure AD user</th></tr>
</thead>
<tbody>
<tr><td>User Name</td><td>Username</td></tr>
<tr><td>Full Name  </td><td>First name + Last name </td></tr>
<tr><td>Title </td><td>Job title </td></tr>
<tr><td>Primary Email* </td><td>Email </td></tr>
<tr><td>Main Phone </td><td>Office phone</td></tr>
<tr><td>Mobile Phone  </td><td>Mobile phone</td></tr>
<tr><td>Fax  </td><td>Fax number  </td></tr>
<tr><td>Address  </td><td>Street address   </td></tr>
<tr><td>Address   </td><td>City   </td></tr>
<tr><td>Address   </td><td>State or province    </td></tr>
<tr><td>Address    </td><td>Country or region    </td></tr>
<tr><td>AzureActiveDirectoryObjectId**     </td><td>ObjectId   </td></tr>
<tr><td colspan="2">* To prevent data loss, the Primary Email field isn't automatically updated and synchronized with customer engagement apps.<br />**object ID of a user or a service principal in Azure Active Directory</td></tr>
</tbody>
</table>

The following image shows Microsoft 365 user contact fields.

![Job title, Department, Office, Office phone, Mobile phone, Fax number, Street address, City, State or province, ZIP or postal code, Country or region.](media/office-365-contact-info.png "Job title, Department, Office, Office phone, Mobile phone, Fax number, Street address, City, State or province, ZIP or postal code, Country or region")

## Add a license to a user account  
You can license the user when you create the user account, or you can license the user later. You must assign a license to every user account that you want to access the online service. See [Assign licenses](assign-licenses.md).

## Assign a security role
Security roles control a user's access to data through a set of access levels and permissions. The combination of access levels and permissions that are included in a specific security role sets limits on the user's view of data and on the user's interactions with that data.  See [Assign a security role to a user](assign-security-roles.md).

## Enable or disable user accounts

User enablement and disablement only applies to environments that have a Dataverse database. To enable a user in an environment that has a Dataverse database, ensure that they're allowed to sign in, assign a license to the user, and then add the user to the security group that's associated with the environment. These are the same criteria used to [add users to an environment](add-users-to-environment.md). 

To enable a user, assign a license to the user and add the user to the security group that's associated with an environment. If you enable a user account that was disabled, you must send a new invitation for the user to access the system.  
  
To disable a user account, remove a license from the user or remove the user from the security group that's associated with an environment. Removing a user from the security group doesn't remove the user's license. If you want to make the license available to another user, you have to remove the license from the user account that was disabled.  

> [!NOTE]
> You can also remove all security roles from a user to prevent the user from signing in to and accessing customer engagement apps. However, this doesn't remove the license from the user, and the user will remain in the list of enabled users. We don't recommend using this method to remove access from a user.  
>
> When you use a security group to manage enabling or disabling users or provisioning access to an org, nested security groups within the selected security group aren't supported and will be ignored.
>
> You can [assign records](/powerapps/user/assign-or-share-records) to a disabled user account and also [share reports](/dynamics365/customer-engagement/basics/share-report-users-teams) and accounts with them. This can be useful when migrating on-premises versions to online. If you need to assign a security role to users who have a Disabled status, you can do so by enabling the allowRoleAssignmentOnDisabledUsers in [OrgDBOrgSettings](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm).
> 
> A Global admin, Power Platform admin, or a Dynamics 365 admin does not need a license to be enabled in a Dataverse environment. See: [Global admins and Power Platform admins can administer without a license](global-service-administrators-can-administer-without-license.md). But since they are unlicensed, they will be set in the [Administrative access mode](create-users.md#create-a-read-write-user-account).  

You must be a member of an appropriate administrator role to do these tasks. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Assign admin roles](/microsoft-365/admin/add-users/assign-admin-roles)  

### Enable a user account in an environment  

To enable a user in an environment that has a Dataverse database, you enable sign-in for the user, assign a license to the user, and then add the user to a security group.

**To enable sign-in**
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
2. Select **Users** > **Active users**, and then select the user. 
3. Ensure that under the user's display name, you see **Sign in allowed**. If you don't, select **Block this user**, and then unblock sign in.


**To assign a license**
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
2. Select **Users** > **Active users**, and then select the user. 
3. Select the **Licenses and Apps** tab, and then select the licenses you want to assign. 
4. Select **Save changes**. 

**To add a user to a security group**
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
2. Select **Groups** > **Groups**. 
3. Select the security group that's associated with your environment. 
4. Select the **Members** tab. 
5. Under **Members**, select **View all and manage members** >**Add members**.
6. Choose users from the list or search for users, and then select **Save**.

### Disable a user account in an environment 

To disable a user account in an environment that has a Dataverse database, you can either remove the user from the security group or remove the license from the user.

**To remove a user from a security group**
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
2. Select **Groups** > **Groups**. 
3. Select the security group that's associated with your environment. 
4. Select the **Members** tab. 
5. Under **Members**, select **View all and manage members**
6. Select the users in the list to remove them, and then select **Save**.

**To remove a license from a user**
1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
2. Select **Users** > **Active users**, and then select the user. 
3. Select the **Licenses and Apps** tab, and then select the licenses you want to remove. 
4. Select **Save changes**. 

Note that removing a license from a user might not always result in disabling the user account, though the license will be freed up for assigning to another user. The recommended approach to disabling a user account in an environment is to remove them from the security group that's associated with the environment. 
 
> [!NOTE]
> You can also delete users in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. When you remove a user from your subscription, the license assigned to that user automatically becomes available to be assigned to a different user. If you want the user to still have access to other applications you manage through [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)]&mdash;for example, [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] or [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)]&mdash;don't delete them as a user. Instead, simply remove the license you've assigned to them.  
> 
> When you sign out of the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], you aren't signing out of customer engagement apps. You have to do that separately.  

> [!TIP]
> To force an immediate synchronization between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and customer engagement apps, do the following:  
> 
> - Sign out of the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Close all open browsers used for the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Sign back in to the customer engagement app and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  

## Add users to Dataverse 

For users to have access to applications and data in a Dataverse environment, at a minimum the SystemUser table in Dataverse must have a record corresponding to the respective user identity. There are different mechanisms to add users in Dataverse, either automatic or on demand: 

> [!TIP]
> Check out the following video: [Adding users to Dataverse](https://www.microsoft.com/videoplayer/embed/RWJBra).

1. A system background process runs every 30 minutes to synchronize changes from Azure AD and updates the SystemUser records in Dataverse based on pre-determined set of [requirements](#requirements-for-successfully-adding-users-in-dataverse). The time taken to synchronize all changes into Dataverse is dependent on total number of users must be added or updated. For large organizations with thousands of users in Azure AD, we recommend creating security groups associated with each environment, so only the required subset of users is added into Dataverse. 

   > [!NOTE]
   > Not all users added in Azure AD will be pickup by the automatic synchronization process. [This section](#user-types) details the eligibility criteria the system background process applies to add a user from Azure AD into Dataverse.

2. If users already exist in Azure AD, they are automatically added to SystemUsers table at first attempt to access the Dataverse environment. Note that if a user already exists in Dataverse, but in a disabled state, attempting to access the environment will result in the user’s state to be updated to “enabled”, assuming they are entitled at the time of access. 

3. Users that have the necessary permissions, can use the [API](/powershell/module/microsoft.powerapps.administration.powershell/add-adminpowerappssyncuser?view=pa-ps-latest) to add or update users in Dataverse on demand. 

4. Administrators can leverage the Power Platform admin center user management experience to [add users in Dataverse on demand](add-users-to-environment.md#add-users-to-an-environment-that-has-a-dataverse-database). 

## Categories of users not added automatically in Dataverse 

In certain conditions, the above-mentioned system background process is not adding users automatically into Dataverse. In these cases, users will be added on demand either when they first attempt to access the environment or by an administrator using the API or the Power Platform admin center. These conditions are: 

1. Users are part of a Dataverse for Teams environment type. 
2. Users are part of an environment with a Dataverse database and have a free Dataverse service plan from Microsoft 365 licenses. 
3. Users are part of an environment with a Dataverse database and environment level app-pass license type. 

> [!NOTE]
> Users cannot be added to SystemUser table either automatically or on demand in case of environments without Dataverse database.  

## Requirements for successfully adding users in Dataverse 

Below criteria must be met for successfully adding the user in the Dataverse table: 

1. User must be enabled and not deleted or soft-deleted in Azure AD. User must be enabled in Azure AD to be enabled in a Dataverse database. If user is added to Dataverse and then deleted in Azure AD, the state in the Dataverse table will be updated to “disabled”.  

2. User must have a valid license with these exceptions: 
   1. Admin users do not require a license. Unlicensed Azure AD admins are enabled in the systems as “Setup user” and have administrative only access mode. 
   2. Individual users do not need to have a license when the environment has app pass capacity. This only applies to adding users on demand (either at first attempt to access the environment or through API/Power Platform admin center). 
   3. Individual users do not need to have a license when the tenant they are part of has a tenant level Marketing license. This only applies to adding users on demand (either at first attempt to access the environment or through API/Power Platform admin center). 
   4. Non-interactive users do not need a license 
   5. Free Dataverse plans from M365 license are honored when users added on-demand (either at first attempt to access the environment or through API/Power Platform admin center)  

> [!NOTE]
> Guest users should also have a license from the environment’s tenant. License from Guest user's tenant is NOT considered as valid license.

3. If the environment has a security group defined, user must be part of the respective security group, unless the user is a Tenant or Power Platform Administrator. Non-admin users or D365 service admin must be in the security group to access the system. When the owner of the security group is added to Dataverse through an on-demand action, the user will be considered a valid member of the security group and will be added to Dataverse successfully.  

Adding users to Dataverse has different implications depending on the environment type: 

1. If users are part of a trial environment, then they will not need email approval for being added to Dataverse. Users will only be added to Dataverse on demand. The background sync process will still run to keep the users in the environment up-to-date, but will not add users automatically. 

2. Only the initial user that created the developer environment type will be added to Dataverse. 

3. Users that are part of a Dataverse for Teams environment will only be added to Dataverse’s SystemUser table as result of the user’s first attempt to access the environment. 


## Create a Read-Write user account
By default, all licensed users are created with an access mode of **Read-Write**. This access mode provides full access rights to the user based on the security privileges that are assigned.

**To update the access mode of a user**

1. In the Power Platform admin center, select an environment, and go to **Settings** > **Users + permissions** > **Users**.
  
2. Select **Enabled Users**, and then select a user's full name.  
  
3. In the user form, scroll down under **Administration**  to the **Client Access License (CAL) Information** section. In the **Access Mode** list, select **Read-Write**.  

4. Select the **Save** icon.

## Create an Administrative user account
An Administrative user is a user who has access to the Settings and Administration features but has no access to any of the functionality. Use this account to assign administrative users to perform day-to-day maintenance functions (create user accounts, manage security roles, and so on). Because an administrative user doesn't have access to customer data nor any functionality, the user doesn't require a license (after setup).

You need to have the System Administrator security role or equivalent permissions to create an administrative user. First, you'll create a user account in Microsoft 365, and then in to the customer engagement app, select the **Administrative** access mode for the account.

> [!NOTE]
> See [Create an administrative user and prevent elevation of security role privilege](prevent-elevation-security-role-privilege.md) for an example of how an Administrative user account can be used.

1. Create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
    Be sure to assign a license to the account. You'll remove the license (in step 12) after you've assigned the **Administrative** access mode.
  
2. In the **Optional settings** form, expand **Roles**.

3. Clear the **User (no administrator access)** check box.

4. Scroll down the form, and then select the **Show all** link.

5. Select the **service administrator** check box.
   **Note:** If you've selected **Global Administrator**, you don't need to select this option.
  
  Wait for the user to sync to the environments.

6. In the Power Platform admin center, select an environment, and go to **Settings** > **Users + permissions** > **Users**.
  
7. Select **Enabled Users**, and then select a user's full name.  
  
8. In the user form, scroll down under **Administration** to the **Client Access License (CAL) Information** section. In the **Access Mode** list, select **Administrative**.  

   Now you need to remove the license from the account.  
  
9. Go to the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
10. Select **Users** > **Active Users**.  
  
11. Select the Administrative user account, and then select the **Licenses and Apps** tab.  
  
12. Clear the license box(es), and then select **Save changes**.

## Create a non-interactive user account  
 The non-interactive user isn't a "user" in the typical sense&mdash;it doesn't represent a person, it's an access mode that's created by means of a user account. It's used for programmatic access to and from customer engagement apps between applications. A non-interactive user account lets these applications or tools&mdash;such as a connector from customer engagement apps to ERP&mdash;authenticate and access customer engagement apps without requiring a license. For each environment, you can create up to seven non-interactive user accounts.  
  
 You need to have the System Administrator security role or equivalent permissions to create a non-interactive user. First, you'll create a user account in Microsoft 365. Then, in customer engagement apps, select the non-interactive access mode for the account.  
  
1. Create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
   Be sure to assign a license to the account.  
  
2. In the Power Platform admin center, select an environment, and go to **Settings** > **Users + permissions** > **Users**.
  
3. Select **Enabled Users**, and then select a user's full name.  
  
4. In the user form, scroll down under **Administration**  to the **Client Access License (CAL) Information** section. In the **Access Mode** list, select **Non-interactive**.  
  
   You then need to remove the license from the account.  
  
5. Go to the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
6. Select **Users** > **Active Users**.  
  
7. On the **Licenses and Apps** tab, select the non-interactive user account.  
  
8. Clear the license box(es), and then select **Save changes**.  
  
9. Go back to the customer engagement app and confirm that the non-interactive user account **Access Mode** is still set for **Non-interactive**.  

## Create an application user  
You can use server-to-server (S2S) authentication to securely and seamlessly communicate between Dataverse and your web applications and services. S2S authentication is the common way that apps registered on [!INCLUDE[pn_microsoft_appsource](../includes/pn-microsoft-appsource.md)] use to access the Dataverse data of their subscribers. All operations performed by your application or service by using S2S will be performed as the application user you provide, rather than the user who's accessing your application.  

All application users are created with a non-interactive user account, however they aren't counted toward the limit of seven non-interactive user accounts. In addition, there's no limit on how many application users you can create in an environment.

> [!CAUTION]
> For an application user, the system adds a "#" as the First Name for the Application User you create. This is by design.

For step-by-step information about creating an application user, see [Create an application user](manage-application-users.md#create-an-application-user).

### Enable or disable application users

When application users are created, they're automatically enabled. The default **Application User** form shows the status in the form footer; the **Status** field can't be updated.

You can customize the default **Application User** form to allow updates to the **Status** field so that you can enable or disable application users, if required. For step-by-step information about customizing the default **Application User** form, see [Enable or disable application users](/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#enable-or-disable-application-users).

> [!CAUTION]
> Disabling an application user will break all the integration scenarios that use the application user.

### Manage application users in the Power Platform admin center

We are in the process of moving application user management from the legacy web client as documented in [Enable or disable application users](create-users.md#enable-or-disable-user-accounts). See the following topic for managing application users from the Power Platform admin center: [Manage application users in the Power Platform admin center](manage-application-users.md).

## How stub users are created
A stub user is a user record that has been created as a placeholder. For example, records have been imported that refer to this user but the user doesn't exist in customer engagement apps. This user can't sign in, can't be enabled, and can't be synchronized to Microsoft 365. This type of user can only be created through data import. 

A default security role is automatically assigned to these imported users. The **Salesperson** security role is assigned in an environment and the **Basic User** security role is assigned in a Power Apps environment.

> [!NOTE]
> By default, a security role can only be assigned to users with an Enabled status. If you need to assign a security role to users who have a Disabled status, you can do so by enabling the allowRoleAssignmentOnDisabledUsers [OrgDBOrgSettings](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm). 

### Update a user record to reflect changes in Azure AD

When you create a new user or update an existing user in Dynamics 365 Customer Engagement (on-premises), some fields in the user records, such as name and phone number, are populated with the information obtained from Active Directory Domain Services (AD DS). After the user record is created, no further synchronization occurs between Azure AD user accounts and customer engagement apps user records. If you make changes to the Azure AD user account, you must manually edit the user record to reflect the changes.

1. In the Power Platform admin center, select an environment, and go to **Settings** > **Users + permissions** > **Users**.

2. In the list, select the user record you want to update, and then select **Edit**.

The following table shows the fields that are populated on the user form (user record) from the Azure AD user account.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
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
<td colspan="3">* The Address field comprises the values from the City and State/province fields in Azure AD.</td></tr>
</tbody>
</table>


## FAQ

### If a user that is added to Dataverse SystemUser table becomes disabled or unlicensed in Azure AD, how is that reflected in Dataverse?  
User record is not deleted, but its state in Dataverse will be updated to “disabled”.  

### Are all users in Azure AD being added to Dataverse? 
Users from Azure AD are added to Dataverse only if they meet the criteria. If already existing users do not meet the criteria, their state will be updated to “disabled”, 

### How can the admin increase the performance of adding users in Dataverse? 
Assigning an Azure AD security group to the environment is a best practice in general, that can also result in a performance increase as regard to adding users that are part of the security group to Dataverse. 



### See also
[Get started with security roles in Dataverse](/learn/modules/get-started-security-roles/) <br />
[Assign a security role to a user](assign-security-roles.md) <br />
[Opt-out of automatic license-based user roles management](opt-out-automatic-license.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
