---
title: Invite users with Microsoft Entra B2B collaboration
description: Invite users with Microsoft Entra B2B collaboration.
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/14/2024
author: sericks007
ms.subservice: admin
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - alaug
  - tapanm-msft
  - sericks
ms.custom:
  - "admin-security"
  - sfi-image-nochange
---
# Invite users with Microsoft Entra B2B collaboration

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can invite other users to access your environment. A user with the [User Administrator](/entra/identity/role-based-access-control/permissions-reference#user-administrator) role can do this through the [Azure portal](https://portal.azure.com). Learn more at [Add guest users to the directory](/entra/external-id/add-users-administrator#add-guest-users-to-the-directory). Invited users can access your environment using their own login credentials once a license and a security role are assigned to them. The use of the apps created using Power Apps, customer engagement apps (such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Customer Insights - Journeys, and Dynamics 365 Project Operations), and finance and operations apps are granted. You don’t need to create a new user account and temporary password for these invited users in your own [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] tenant.  
  
## Requirements  
  
- To send  business-to-business (B2B) user invitations, you  must have at least the User Administrator role.  
  
- To bulk- invite users, get the latest [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)][!INCLUDE[pn_PowerShell_short](../includes/pn-powershell-short.md)] which can be downloaded from the [PowerShell module's release page](https://www.powershellgallery.com/packages/AzureADPreview/2.0.0.98).  
  
## Incompatibilities  
 The following features aren't supported for B2B invited users.  
  
1. [!INCLUDE[pn_unified_service_desk](../includes/pn-unified-service-desk.md)] client  
  
     Invited users won't be able to use the [!INCLUDE[pn_unified_service_desk](../includes/pn-unified-service-desk.md)] client to log into the host tenant’s environment.  
  
2. [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)]  
  
     Invited users won't be able to use their own tenant email addresses when performing email related transactions in the host environment. 
  
3. [!INCLUDE[pn_office_365_groups](../includes/pn-office-365-groups.md)]  
  
   [!INCLUDE[pn_office_365_groups](../includes/pn-office-365-groups.md)] connects a group to customer engagement apps. Data (including new conversations and documents) are stored in the [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] and/or [!INCLUDE[pn_SharePoint_short](../includes/pn-sharepoint-short.md)] system. Since invited users belong to a different [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] tenant, the invited users don't have permission to create [!INCLUDE[pn_office_365_groups](../includes/pn-office-365-groups.md)] in the invited-to [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] tenant. However, they can participate in the [!INCLUDE[pn_office_365_groups](../includes/pn-office-365-groups.md)] conversations as a guest in their [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] Inbox, but not within customer engagement apps.  
  
4. Dynamics 365 Customer Voice
   
   Invited users won't be able to use Dynamics 365 Customer Voice. You must create a new user in your tenant and then provide access to the new user.
   
## Invite a user  
 You can add users to through [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] B2B user collaboration. Users with sufficient access such as user admins can use the [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] portal to invite B2B collaboration users to the directory, to any security group, or to any application.  
  
 Admins can use one of the following methods to invite B2B users to their environment:  
  
1. Invite users to your environment that has a security group.  
  
   - See [Admins adding guest users to a group](/azure/active-directory/active-directory-b2b-admin-add-users).  
  
   - See [Control user access to environments: security groups and licenses](control-user-access.md) on how to use security groups for your environments.  

2. Invite users to your environment that don't have a security group.  
  
   - See [Admins adding guest users to the directory](/azure/active-directory/active-directory-b2b-admin-add-users).  
  
3. Bulk-invite guest users using a .csv file.  
  
   - See [PowerShell example](/azure/active-directory/b2b/code-samples).  
  
   Your invited user receives an email invitation to get started with B2B user collaboration.  
  
   ![Email invitation sent to new user.](../admin/media/email-invitation-sent-new-user.png "Email invitation sent to new user")  
  
   When your user accepts the invitation by clicking on the **Get Started** link on the invitation email, they're prompted to accept the invitation.  
  
   ![Accept the invitation.](../admin/media/accept-invitation-dynamics-365.png "Accept the invitation")  
  
> [!NOTE]
> Until you add a license to the user account, the user doesn't have access to customer engagement apps. Follow the steps below to add a license through the [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] portal.  
  
## Update user’s name and usage location  
 To assign a license, the invited user’s **Usage location** must be specified. Admins can update the invited user’s profile on the [!INCLUDE[pn_azure_shortest](../includes/pn-azure-shortest.md)] portal.  
  
1. Go  to **Microsoft Entra** > **Users and groups** > **All users**. If you don't see the newly created user, refresh the page.  
  
2. Click on the invited user, and then click **Profile**.  
  
   ![User Profile button in Microsoft Entra ID.](../admin/media/user-profile-button-azure-active-directory.png "User Profile button in Microsoft Entra ID")  
  
3. Update **First name**, **Last name**, and **Usage location**.  
  
4. Click **Save**, and then close the Profile blade.  
  
## Assign invited users a license and security role  
 Assign your invited users a license and security role so the user can use customer engagement apps.  
  
1. Go  to **Microsoft Entra** > **Users and groups** > **All users**. If you don't see the newly created user, refresh the page.  
  
2. Click on the invited user, and then click **Licenses**.  
  
   ![Assign a license with the Azure portal.](../admin/media/assign-license-azure-portal.png "Assign a license with the Azure portal")  
  
3. Click ![New or Add button.](../admin/media/plus-2.png "New or Add button")**Assign**.  
  
4. Click **Configure required settings**.  
  
5. Select the product to license.  
  
   ![Click Assign to see the list of licenses.](../admin/media/click-assign-list-licenses.png "Click Assign to see the list of licenses")  
  
6. Click **Select**, and then click **Assign**.  
  
   Next, assign the invited users with appropriate security roles for the environment so they can access it. See [Create users](create-users.md).  
  
## Notify your invited users  
 To complete the user invitation, notify your invited users and provide them with the URL for the environment they're invited to (for example, https://contoso.crm.dynamics.com).  
 
## Power Apps support for B2B guest maker

B2B guest users can [run Power Apps](/powerapps/maker/canvas-apps/share-app-guests). 

Follow these steps to allow B2B collaboration users to create Power Apps.

> [!NOTE]
> Ensure that you perform below steps on the **resource tenant**, and not on the **home tenant**.
> - A **resource tenant** is where the app is expected to exist, and where the user is expected to create the app using Power Apps as a guest.
> - A **home tenant** is where the user's account resides and authenticates against.

1. In Microsoft Entra ID, [in external collaboration settings set guest user access to "(most inclusive)"](/azure/active-directory/b2b/delegate-invitations). For more info about Microsoft Entra B2B checkout: [What is guest user access in Microsoft Entra B2B?](/azure/active-directory/b2b/what-is-b2b)

2. Use the following PowerShell cmdlet to enable guests to make Power Apps.

    ```PowerShell
    $requestBody = Get-TenantSettings 
    $requestBody.powerPlatform.powerApps.enableGuestsToMake = $True 
    Set-TenantSettings $requestBody 
    ```

3. Assign the [Environment Maker](database-security.md) security role to the B2B guest users that you want to be able to create apps and Microsoft list custom forms using Power Apps.

    > [!TIP]
    > In addition, you can also review all other guests of this security role (especially in the default environment), and remove users that aren't expected to have this privilege.

After the B2B guest users are given the required permissions to create and edit apps, they can now create Power Apps and Microsoft List [custom forms](/powerapps/maker/canvas-apps/customize-list-form#open-the-form) using Power Apps.

4. B2B guests can [follow these steps](/power-apps/maker/canvas-apps/intro-maker-portal) to sign in the preferred Microsoft Entra tenant to build apps.
   
5. **Optional**: Assign a security role that allows B2B guest users to perform solution import and export.  

### Known limitations
1. To sign in to make.powerapps.com via Azure B2B, a user is required to sign in to a Microsoft Entra tenant. Microsoft Accounts (for example user@outlook.com, user@live.com, user@hotmail.com) can't directly sign in to https://make.powerapps.com.
2. If the Azure B2B maker is expected to build an app that uses Dataverse or build apps in a solution, they need a license with Dataverse use rights assigned to them in the resource tenant.
3. B2B makers are currently not supported across sovereign cloud boundaries. For example, a B2B guest from a commercial tenant can't make apps in a GCC tenant. The same is applicable for GCC to GCC High, commercial to China cloud, and so on.

### Related content
[Microsoft Entra B2B Collaboration is Generally Available!](https://blogs.technet.microsoft.com/enterprisemobility/2017/04/12/azure-ad-b2b-collaboration-is-generally-available/)  
[Microsoft Entra B2B collaboration code and PowerShell samples](/azure/active-directory/b2b/code-samples)   <br /> 
[Microsoft Entra B2B collaboration frequently-asked questions (FAQ)](/azure/active-directory/active-directory-b2b-faq)   <br /> 
[Microsoft Entra B2B Collaboration](/azure/active-directory/active-directory-b2b-what-is-azure-ad-b2b)   <br /> 
[Microsoft Entra B2B: New updates make cross-business collab easy](https://blogs.technet.microsoft.com/enterprisemobility/2017/02/01/azure-ad-b2b-new-updates-make-cross-business-collab-easy/) <br /> 
[Microsoft Entra cross-tenant access overview](/azure/active-directory/external-identities/cross-tenant-access-overview) <br /> 
[Restrict cross-tenant inbound and outbound access](cross-tenant-restrictions.md) <br /> 
[Share a canvas app with guest users](/powerapps/maker/canvas-apps/share-app-guests)




[!INCLUDE[footer-include](../includes/footer-banner.md)]
