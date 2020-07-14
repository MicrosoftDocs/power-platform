---
title: "Use the Microsoft 365 admin center to manage your subscription  | MicrosoftDocs"
description: Use the Microsoft 365 admin center to manage your subscription
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/19/2018
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Use the Microsoft 365 admin center to manage your subscription 

[The Microsoft 365 admin center](https://support.office.com/article/About-the-Office-365-admin-center-758befc4-0888-4009-9f14-0d147402fd23) is a portal site rich in features for the administrator. Model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, take advantage of the features on this site to simplify and consolidate management of user accounts, billing, licensing, and more.  
  
 ![Microsoft 365 admin center](../admin/media/o365-admin-center.png "Microsoft 365 admin center")  
  
 Review the information in this topic to learn how to do common administrative tasks in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
> [!NOTE]
>  You must have the Global admin role to fully access the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
<a name="BKMK_AppLauncher"></a>   
## Open model-driven apps in Dynamics 365 and other services with the app launcher  

 You can open model-driven apps in Dynamics 365 and other services such as [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)] from the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] app launcher. Choose **Admin** to open the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] and **Dynamics 365** to open model-driven apps in Dynamics 365. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Find help for the latest changes in Office 365](https://support.office.com/client/Find-help-for-the-latest-changes-in-Office-365-22E9A8BF-EF08-4B95-B10F-6E839440339C?NS=O365ENTADMIN&Version=15&HelpId=O365E_NewAppLauncher)  
  
 ![Microsoft 365 app launcher](../admin/media/admin-center-app-launcher.png "Microsoft 365 app launcher")  
  
<a name="BKMK_CRMAdminCenter"></a>   
## Manage environments and updates in the Dynamics 365 Administration Center  
 The [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)] is your portal site to manage environments and updates.  
  
 You access the portal by choosing model-driven apps in Dynamics 365 from the left-side menu in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)].  
  
 ![Dynamics 365 option on the Microsoft 365 admin center menu](../admin/media/o365-admin-center-crm.png "Dynamics 365 option on the Microsoft 365 admin center menu")  
  
 Choose the **environments** tab to edit, copy, and reset, existing environments, configure new environments, manage preferred solutions, and more. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Environments overview](environments-overview.md)
  
 ![Dynamics 365 Administration Center environments tab](../admin/media/crm-admin-center-instances.png "Dynamics 365 Administration Center environments tab")  
  
 Choose the **Updates** tab to approve and schedule updates, change the update target version, and open model-driven apps in Dynamics 365 apps.  
  
 ![Dynamics 365 Administration Center - Updates tab](../admin/media/crm-admin-center-updates.png "Dynamics 365 Administration Center - Updates tab")  
  
<a name="BKMK_ServiceHealth"></a>   

## Check your service health  
 You can quickly get real-time status of your model-driven apps in Dynamics 365 and [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] services. The Service health page on the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] provides a comprehensive view of the service health of your online services. If users are having trouble signing in to model-driven apps in Dynamics 365, check this page to see if there is a service outage.  
  
For more information, see [Check your service health](check-online-service-health.md).
  
<a name="BKMK_ServiceMessages"></a>   

## Review your messages  
 Check out the Message center to see how to fix or prevent issues, plan for service changes, or just to stay informed of new or updated features.  
  
 Click **Health** > **Message center**, and select messages to get more information.  
  
 ![Microsoft 365 admin center Message Center](../admin/media/office-365-admin-center-message-center.png "Microsoft 365 admin center Message Center")  
  
<a name="BKMK_ServiceRequest"></a>   

## Request support  
 Having a problem with your service? You can create a support request to get the issue resolved.  
  
More information: [Contact Technical Support](get-help-support.md)

<a name="BKMK_ManageUsers"></a>   

## Manage users  
 Each user signs in to model-driven apps in Dynamics 365 with an [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] user ID (more precisely, an [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] user ID, see the following Note). Access to model-driven apps in Dynamics 365 is controlled through the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] user ID.  
  
 You use the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)] to add, edit, and delete users and to reset passwords.  
  
 ![Microsoft 365 admin center active users](../admin/media/o365-admin-center-manage-users.png "Microsoft 365 admin center active users")  
  
> [!NOTE]
> Model-driven apps in Dynamics 365 use [Azure Active Directory](https://docs.microsoft.com/azure/active-directory/active-directory-whatis) as its identity provider. You access model-driven apps in Dynamics 365 through an [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] user ID that is created and managed in the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. For simplicity, we'll refer to the [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] user ID as the [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] user ID in this documentation.  
  
 If your company uses on-premises [!INCLUDE[pn_Active_Directory](../includes/pn-active-directory.md)] for user identity, you have options that can simplify user management such as providing a single sign-on experience for your users. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Manage user account synchronization](../admin/manage-user-account-synchronization.md)  
  
<a name="BKMK_ManageLicensing"></a>   
## Manage subscriptions  
 Use the Subscriptions page to adjust licenses, view your bill, add a partner of record, and lots more.  
  
 ![Microsoft 365 admin center subscriptions](../admin/media/o365-admin-center-manage-subscriptions.png "Microsoft 365 admin center subscriptions")  
  
<a name="BKMK_SetPassword"></a>   
## Set the password expiration  
 Use the Security & privacy page to set how frequently a user's password expires and the number of days before a user is notified of an upcoming expiration.  
  
 ![Microsoft 365 admin center manage password expiration](../admin/media/o365-admin-center-password-expiration.png "Microsoft 365 admin center manage password expiration")  
  
> [!TIP]
>  Note the information on this page about users doing their own password reset. To enable your users to be able to reset their passwords themselves, you'll need to purchase an [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] subscription and configure it for password self-service. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Self-service password reset in Azure AD: how to enable, configure, and test self-service password reset](https://docs.microsoft.com/azure/active-directory/authentication/quickstart-sspr#enable-self-service-password-reset)  
  
<a name="BKMK_PasswordSelfSet"></a>   
## Configure self-service password reset and other settings in Azure  
 If you have an [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] Basic or Premium subscription, you can set it up so users can do their own password reset. You can access [!INCLUDE[pn_azure_active_directory](../includes/pn-azure-active-directory.md)] configuration from the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)]. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Enable users to reset their Azure AD passwords](https://azure.microsoft.com/documentation/articles/active-directory-passwords-getting-started/#enable-users-to-reset-their-azure-ad-passwords)  
  
 On the left-side menu of the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], choose **Admin centers** > **Azure AD**. Select your subscription in [!INCLUDE[pn_Windows_Azure](../includes/pn-windows-azure.md)] and then choose **Configure**.  
  
 ![Azure Active Directory password policy](../admin/media/o365-admin-center-azure-ad.png "Azure Active Directory password policy")  
  
<a name="BKMK_AddDomain"></a>   
## Add your domain  
 Use the Manage domains page to add your domain to your subscription. When you add your own domain, user sign-ins can match your company's URL. For example, instead of user@contoso.onmicrosoft.com, it could be user@contoso.com. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Verify your domain in Office 365](https://support.office.com/article/Verify-your-domain-in-Office-365-6383f56d-3d09-4dcb-9b41-b5f5a5efd611)  
  
 ![Microsoft 365 admin center add your domain](../admin/media/o365-admin-center-add0domain.png "Microsoft 365 admin center add your domain")  
  
<a name="BKMK_PurchaseServices"></a>   
## Purchase services  
 On the left-side menu of the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], click **Billing** > **Purchase services** to add licenses or purchase new online services.  
  
 ![Microsoft 365 admin center purchase services](../admin/media/o365-admin-center-purchase-services.png "Microsoft 365 admin center purchase services")  
  
### See also  
 [About the Microsoft 365 admin center](https://support.office.com/article/About-the-Office-365-admin-center-758befc4-0888-4009-9f14-0d147402fd23)  
 [Set an individual user's password to never expire](https://support.office.com/article/Set-an-individual-user-s-password-to-never-expire-f493e3af-e1d8-4668-9211-230c245a0466)
