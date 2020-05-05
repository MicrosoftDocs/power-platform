---
title: "Create users and assign security roles | MicrosoftDocs"
description: Create users and assign security roles
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/29/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Create users and assign security roles

You use the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] to create user accounts for every user who needs access to model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service. The user account registers the user with [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)]. In addition to registration with the online service, the user account must be assigned a license in order for the user to have access to the service. Note that when you assign a user the global administrator or the service administrator role in the [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)], it automatically assigns the user the System Administrator security role. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Differences between the Microsoft Online services environment administrative roles and security roles](grant-users-access.md#BKMK_O365CRMroles)  

## Create a user account  
 When you create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], the system generates a user ID and temporary password for the user. You have the option to let the service send an email message to the user as clear text. Although the password is temporary, you may consider copying the information to send to the user through a more secure channel, such as from an email service that can digitally encrypt the contents. For step-by-step instructions for creating a [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] user account, see [Create or edit users in Office 365](https://go.microsoft.com/fwlink/p/?LinkId=255286).  
  
> [!NOTE]
>  When you create a user and assign a license in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], the user is also created in model-driven apps in Dynamics 365. The synchronization process between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and model-driven apps in Dynamics 365 can take a few minutes to complete.  
> 
>  By entering a user ID and password, a user can access the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] to view information about the service. However, the user will not have access to model-driven apps in Dynamics 365 until the user has a security role assigned either directly or indirectly as a member of a [group team](manage-teams.md#about-group-teams).  
> 
> [!TIP] 
>  To force an immediate synchronization between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and model-driven apps in Dynamics 365, do the following:  
> 
> - Sign out of model-driven apps in Dynamics 365 and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Close all open browsers used for model-driven apps in Dynamics 365 and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Sign back in to model-driven apps in Dynamics 365 and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
## User profile information

Some user profile information is maintained and managed in the [!INCLUDE [pn-office-365-admin-center](../includes/pn-office-365-admin-center.md)].  After you create or update a user, these user profile fields are automatically updated and synchronized in your Power Platform environments.

The following table shows the fields that are managed in the **Users** section of the [!INCLUDE [pn-office-365-admin-center](../includes/pn-office-365-admin-center.md)].

|Model-driven apps in Dynamics 365 user form  |Office 365 / Azure Active Directory user  |
|---------|---------|
|User Name     |Username         |
|Full Name     |First name + Last name         |
|Title     |Job title         |
|Primary Email*     |Email         |
|Main Phone     |Office phone         |
|Mobile Phone     |Mobile phone         |
|Fax     |Fax number         |
|Address     |Street address         |
|Address     |City         |
|Address     |State or province         |
|Address     |Country or region         |

*To prevent data loss, the Primary Email field does not automatically update and synchronize with model-driven apps in Dynamics 365.

The following are Office 365 user contact fields.

![Office 365 user contact info](media/office-365-contact-info.png "Office 365 user contact info")

## Add a license to a user account  
You can license the user when you create the user account, or you can license the user later. You must assign a license to every user account that you want to access the online service. 
  
For step-by-step instructions to use user licenses, see [Assign, reassign, or remove licenses](https://go.microsoft.com/fwlink/p/?LinkId=255449). 
 
For step-by-step instructions to use Power Apps per app plans, see [Power Apps per app plans](https://docs.microsoft.com/power-platform/admin/signup-for-powerapps-admin#power-apps-per-app-plan).
  
> [!IMPORTANT]
> Licensed users must be assigned at least one security role to access model-driven apps in Dynamics 365. Security roles can be assigned either directly or indirectly as a member of a [group team](manage-teams.md#about-group-teams).
  
 **About user licenses**  
  
- Use user licenses to provide access to your organization. You need one user license per person with an active user record who logs into your organization.  
  
- When you add a new person, the **New user account** form displays the number of user licenses available. If you reach your limit, the **On** button is no longer available. You can add additional licenses by choosing **Billing** > **Purchase Services** from the left-side menu in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
- An unaccepted invitation requires a user license until the invitation expires two weeks after it was issued.  
  
- If you have more user licenses than you are using, contact support to reduce the number of licenses. You cannot reduce the number of licenses to less than you are currently using or less than your offer allows. Any changes are reflected in your next billing cycle.  
  
- Each user license requires a unique Microsoft account, and every user who logs on needs a license. Most subscriptions include a specific number of user licenses.  

> [!NOTE]
> There is a set of default security roles that are assigned to users based on the license and/or solution installed. These security roles only give users Read access to apps that are installed in the environment. For example, when a user is assigned the Dynamics 365 Plan license and is synced to an environment that has the Customer Service Hub app, the user is automatically assigned the Customer Service app access security role. There is no data access permission granted to this role. The administrator is still required to assign the appropriate security role to the user (either directly or indirectly as a member of a [group team](manage-teams.md#about-group-teams) in order for the user to view and interact with the data. 

## Assign a security role to a user  
 Security roles control a user's access to data through a set of access levels and permissions. The combination of access levels and permissions that are included in a specific security role sets limits on the user's view of data and on the user's interactions with that data.  
  
 Model-driven apps in Dynamics 365 provide a default set of security roles. If necessary for your organization, you can create new security roles by editing one of the default security roles and then saving it under a new name.  
  
 You can assign more than one security role to a user. The effect of multiple security roles is cumulative, which means that the user has the permissions associated with all security roles assigned to the user.  
  
 Security roles are associated with business units. If you have created business units, only those security roles associated with the business unit are available for the users in the business unit. You can use this feature to limit data access to only data owned by the business unit.  
  
 For more information about the difference between [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] administrator roles and security roles, see [Grant users access](grant-users-access.md).  
  
> [!IMPORTANT] 
> You must assign at least one security role to every user either directly or indirectly as a member of a [group team](manage-teams.md#about-group-teams). The service does not allow access to users who do not have at least one security role.   

To assign security role to users in an environment that has zero or one Common Data Service database, please refer to [Configure user security to resources in an environment](database-security.md). 

## (Optional) Assign an administrator role  
 You can share [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)] administration tasks among several people by assigning [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)] administrator roles to users you select to fill each role. You might decide to assign the global administrator role to a second person in your organization for times when you are not available.  
  
 There are five [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)] administrator roles with varying levels of permissions. For example, the password reset administrator role can reset user passwords only; the user management administrator role can reset user passwords as well as add, edit, or delete user accounts; and the global administrator role can add online service subscriptions for the organization and can manage all aspects of subscriptions. For detailed information about [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] administrator roles, see [Assigning Admin Roles](https://go.microsoft.com/fwlink/p/?LinkId=255444).  
  
> [!NOTE]
> [!INCLUDE[pn_ms_online_services_environment](../includes/pn-ms-online-services-environment.md)] administrator roles are valid only for managing aspects of the online service subscription. These roles don't affect permissions within the service.  

## Enable or disable users  
User enablement and disablement only applies to environments that have a Common Data Service database. To enable a user in an environment that has a Common Data Service database, ensure they are allowed to sign in, assign a license to the user, and add the user to the security group that is associated with the environment. These are the same criteria to [add users to an environment](add-users-to-environment.md). 

 To enable a user, assign a license to the user and add a user to the security group that is associated with an environment. If you enable a user that was disabled, you must send a new invitation for the user to access the system.  
  
 To disable a user, remove a license from the user or remove the user from the security group that is associated with an environment. Removing a user from the security group doesn't remove the user's license. If you want to make the license available to another user, you have to remove the license from the disabled user.  

> [!NOTE]
> Removing all security roles from the user prevents the user from signing into and accessing model-driven apps in Dynamics 365. However, it doesn't remove the license from the user and the user remains in the list of the enabled users. Removing security roles from a user isn't a recommended method of removing access.  
>
> When using a security group to manage enabling or disabling users or provisioning access to an org, nested security groups within a selected security group are not supported and ignored.
>
> You can [assign records](https://docs.microsoft.com/powerapps/user/assign-or-share-records) to a disabled user and also [share reports](https://docs.microsoft.com/dynamics365/customer-engagement/basics/share-report-users-teams) and accounts with them. This can be useful when migrating on-premises versions to online. If you need to assign a security role to users who have a Disabled status, you can do so by enabling the allowRoleAssignmentOnDisabledUsers in [OrgDBOrgSettings](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm).

 You must be a member of an appropriate administrator role to do these tasks. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Assigning Admin Roles](https://go.microsoft.com/fwlink/p/?LinkId=255444)  
  

### Enable a user in an environment  
User enablement only applies to environments that have a Common Data Service database. To enable a user in an environment that has a Common Data Service database, ensure they are allowed to sign in, assign a license to the user, and add the user to the security group that is associated with the environment. These are the same criteria to [add users to an environment](add-users-to-environment.md). 

#### Enable sign-in
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Users**> **Active users** and select the user. 
3. Ensure under the user’s display name you see **Sign in allowed**. If not, select **Block this user** and unblock sign in. 


#### Assign a license 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Users**> **Active users** and select the user. 
3. Select the **Licenses and Apps** tab, and then select the licenses to assign. 
4. Select **Save changes**. 

#### Add to a security group 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. **Select Groups** > **Groups**. 
3. Choose the security group that is associated with your environment. 
4. Select the **Members** tab. 
5. Under **Members**, select **View all and manage members** >**Add members**.
6. Choose users from the list or search for users, and then select **Save**.

### Disable a user in an environment 
User enablement and disablement only applies to environments that have a Common Data Service database. A user can be disabled by removing them from the security group that is associated with an environment. Removing a user from the security group doesn't remove the user's license. If you want to make the license available to another user, you have to remove the license from the disabled user. Removing a license from the user frees up the license for assigning to another user, but may not always result in disabling the user. 

#### Remove from a security group 
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. **Select Groups** > **Groups**. 
3. Choose the security group that is associated with your environment. 
4. Select the **Members** tab. 
5. Under **Members**, select **View all and manage members**
6. Choose users from the list to remove them, and then select **Save**.

#### Remove a license
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Users**> **Active users** and select the user. 
3. Select the **Licenses and Apps** tab, and then select the licenses to remove. 
4. Select **Save changes**. 

License removal may not always result in disabling a user, though the license will be freed up for assigning to another user. The recommended approach to disable a user in an environment is to remove them from the security group that is associated with the environment. 
 
> [!NOTE]
> You can also delete users in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. When you remove a user from your subscription, the license assigned to that user automatically becomes available to be assigned to a different user. If you want the user to still have access to other applications you manage through [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)], for example [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] or [!INCLUDE[pn_ms_SharePoint_long](../includes/pn-ms-sharepoint-long.md)], don't delete them as a user. Instead, simply remove the license you've assigned to them.  
> 
> When you sign out of the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], you aren't signing out of model-driven apps in Dynamics 365. You have to do that separately.  

> [!TIP]
> To force an immediate synchronization between the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and model-driven apps in Dynamics 365, do the following:  
> 
> - Sign out of model-driven apps in Dynamics 365 and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Close all open browsers used for model-driven apps in Dynamics 365 and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
> - Sign back in to model-driven apps in Dynamics 365 and the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  

## Create a Read-Write user account
By default all licensed users are created with an access mode of **Read-Write**.  This access mode provides full access rights to the user based on the security privileges that are assigned. To update the access mode of a user:

1. Select an environment and go to **Settings** > **User's + permissions** > **Users**.
  
2. Choose **Enabled Users**, and then select a user's full name.  
  
3. In the user form, scroll down under **Administration**  to the **Client Access License (CAL) Information** section. In the **Access Mode** list, select **Read-Write**.  

4. Select the **Save** icon

## Create an Administrative user account
An Administrative user is a user who has access to the Settings and Administration features but has no access to any of the  functionality.  It is used to allow customers to assign administrative users to perform day-to-day maintenance functions (create user accounts, manage security roles, etc).  Since the administrative user does not have access to customer data and any of the functionalities, it does not require a license (after setup).

You need to have the System Administrator security role or equivalent permissions to create an administrative user. First, you'll create a user account in Office 365 and then in model-driven apps in Dynamics 365, select the **Administrative** access mode for the account.

> [!NOTE]
> See [Create an administrative user and prevent elevation of security role privilege](prevent-elevation-security-role-privilege.md) for an example of how an Administrative user account can be used.

1. Create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
    Be sure to assign a license to the account. You'll remove the license (step 6) once you've assigned the **Administrative** access mode.
  
2. In the Optional settings form, expand on the Roles.

3. Uncheck the User (no administrator access) box.

4. Scroll down the form and select on Show all link.

5. Check the service administrator box.
   **Note:** if you have selected Global Administrator box, you don't need select this option.
  
   Wait for user to sync to the environments.

6. In the Power Platform admin center, select an environment and go to **Settings** > **User's + permissions** > **Users**.
  
7. Choose **Enabled Users**, and then select a user's full name.  
  
8. In the user form, scroll down under **Administration**  to the **Client Access License (CAL) Information** section. In the **Access Mode** list, select **Administrative**.  

    You then need to remove the license from the account.  
  
9. Go to the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
10. Select **Users** > **Active Users**.  
  
11. Choose the Administrative user account and select the **Licenses and Apps** tab.  
  
12. Uncheck the license box(es),  and then select **Save changes**.

## Create a non-interactive user account  
 The non-interactive user is not a 'user' in the typical sense – it is not a person but an access mode that is created with a user account. It is used for programmatic access to and from model-driven apps in Dynamics 365 between applications. A non-interactive user account lets these applications or tools, such as a model-driven apps in Dynamics 365 to ERP connector, authenticate and access model-driven apps in Dynamics 365, without requiring a license. For each environment, you can create up to seven non-interactive user accounts.  
  
 You need to have the System Administrator security role or equivalent permissions to create a non-interactive user. First, you'll create a user account in Office 365 and then in model-driven apps in Dynamics 365, select the non-interactive access mode for the account.  
  
1. Create a user account in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
    Be sure to assign a license to the account.  
  
2. In the Power Platform admin center, select an environment and go to **Settings** > **User's + permissions** > **Users**.
  
3. Choose **Enabled Users**, and then select a user's full name.  
  
4. In the user form, scroll down under **Administration**  to the **Client Access License (CAL) Information** section. In the **Access Mode** list, select **Non-interactive**.  
  
    You then need to remove the license from the account.  
  
5. Go to the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
6. Select **Users** > **Active Users**.  
  
7. Choose the non-interactive user account and under **Licenses and Apps** tab.  
  
8. Uncheck the license box(es),  and then select **Save changes**.  
  
9. Go back to model-driven apps in Dynamics 365 and confirm that the non-interactive user account **Access Mode** is still set for **Non-interactive**.  

## Create an application user  
You can use server-to-server (S2S) authentication to securely and seamlessly communicate with Common Data Service with your web applications and services. S2S authentication is the common way that apps registered on [!INCLUDE[pn_microsoft_appsource](../includes/pn-microsoft-appsource.md)] use to access the Common Data Service data of their subscribers. All operations performed by your application or service using S2S will be performed as the application user you provide rather than as the user who is accessing your application.  

All application users are created with a non-interactive user account, however they are not counted towards the seven non-interactive user accounts limit. In addition, there is no limit on how many application users you can create in an environment.
  
![Application user](../admin/media/application-user.png "Application user") 

For step-by-step information on creating an application user, see [Application User Creation](/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#application-user-creation).

### Enable or disable application users

When application users are created, they are automatically enabled. The default Application User form shows the status in the form footer; the **Status** field can't be updated.

You can customize the default Application User form to allow updates to the **Status** field so that you can enable or disable the applications users, if required. For step-by-step information on customizing the default Application User form, see [Enable or disable application users](/powerapps/developer/common-data-service/use-single-tenant-server-server-authentication#enable-or-disable-application-users).

> [!CAUTION]
> Disabling an application user will break all the integration scenarios that use the application user.

## How stub users are created
A stub user is a user record that has been created as a placeholder. For example, records have been imported that refer to this user but the user does not exist in model-driven apps in Dynamics 365. This user cannot log in, cannot be enabled, and cannot be synchronized to Office 365. This type of user can only be created through data import. 

A default security role is automatically assigned to these imported users. The **Salesperson** security role is assigned in an environment and the **Common Data Service User** security role is assigned in a Power Apps environment.

> [!NOTE]
> By default, a security role can only be assigned to users with an Enabled status. If you need to assign a security role to users who have a Disabled status, you can do so by enabling the allowRoleAssignmentOnDisabledUsers [OrgDBOrgSettings](https://support.microsoft.com/help/2691237/orgdborgsettings-tool-for-microsoft-dynamics-crm). 

### Update a user record to reflect changes in Active Directory

When you create a new user or update an existing user in Microsoft Customer Engagement (on-premises), some fields in the user records, such as the name and phone number, are populated with the information obtained from Active Directory Domain Services (AD DS). After the user record is created, there is no further synchronization between Active Directory user accounts and model-driven apps in Dynamics 365 user records. If you make changes to the Active Directory user account, you must manually edit the user record to reflect the changes.

1.  In the Power Platform admin center, select an environment and go to **Settings** > **User's + permissions** > **Users**.

2.  In the list, select the user you want to update, and then choose **Edit**.

The following table shows the fields that are populated on the user form (user record) from the Active Directory user account:

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
<td><p>*Address</p></td>
<td><p>City</p></td>
<td><p>Address</p></td>
</tr>
<tr class="odd">
<td><p>*Address</p></td>
<td><p>State/province</p></td>
<td><p>Address</p></td>
</tr>
<tr class="even">
<td><p>Home phone</p></td>
<td><p>Home</p></td>
<td><p>Telephones</p></td>
</tr>
</tbody>
</table>

* The Address field is comprised of the values from the City and State/province fields in Active Directory.

### See also
[Get started with security roles in Common Data Service](https://docs.microsoft.com/learn/modules/get-started-security-roles/)
