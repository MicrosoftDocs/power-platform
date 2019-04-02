---
title: Provision an environment | Microsoft Docs
description: Add an environment to your tenant.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/01/2019
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Provision an environment

How you provision an environment depends on the platform you're working in.

## Provision an environment for PowerApps

See [Create an environment](create-environment.md).

## Provision an environment for Microsoft Flow

See [Create an environment](https://docs.microsoft.com/flow/environments-overview-admin#create-an-environment).

## Provision an environment for Dynamics 365 for Customer Engagement

You can add Production and non-Production (Sandbox) environments to a [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps subscription. Each new environment creates a separate organization that can be used by different departments, locations, or for non-production purposes such as development. For more information on the environment types available to you, see [Microsoft Dynamics 365 for Customer Engagement apps pricing and licensing](http://go.microsoft.com/fwlink/p/?LinkID=615167).   
  
You must have the [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)] Global administrator (however, see **Note** below) to do these tasks. For more information, see [Assigning administrator roles](https://support.office.com/article/Assign-admin-roles-in-Office-365-eac4d046-1afd-4f1a-85fc-8219c79e1504).  

> [!IMPORTANT]
> This topic applies to customers who buy a new subscription based on the licenses described in: [Resource capacity is included with each license](pricing-billing-skus.md).

> [!NOTE]
> Consider using the less privileged service admin role instead of the global admin role. See [Use the service admin role to manage your tenant](/dynamics365/customer-engagement/admin/use-service-admin-role-manage-tenant). 

## What information do I need to create an environment?  
 When you add an environment, you can accept the default values, or enter different values to create a Customer Engagement environment.  
  
- **Select which scenario fits you best**. The apps you can choose depend on the licenses you've purchased. If you haven't purchased any [!INCLUDE[pn_dyn_365](../includes/pn-crm-shortest.md)] licenses, you'll only see **None of these (don't preinstall any apps)**.  
  
  ![Select an app to configure your environment](../admin/media/select-app-configure-instance.png "Select an app to configure your environment")  
  
- **Name**. This is typically the name of your organization and is displayed in the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.  
  
- **URL**. The URL is used to construct the URL for users to sign-in to the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps. Therefore, we recommend that you limit the length of URL name to reduce the overall length of the URL.  
  
- **Purpose**. This value is used to associate the environment with a specific intent and is only displayed in the environment picker, which is accessed through the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)]. For example, if this environment is for exclusive use by your sales and marketing departments you can enter *Contoso Sales and Marketing* or if the environment is for development and for testing purposes enter a relevant name such as *Contoso Development*.  
  
- **Security Group**. This value is used to determine the [!INCLUDE[pn_MS_Online_Services](../includes/pn-ms-online-services.md)] security group that includes the users who will have access to this environment of Customer Engagement apps. For more information, see [Control user access to instances: security groups and licenses](/dynamics365/customer-engagement/admin/add-instance-subscription.md#BKMK_man_sec_group).  
  
  > [!IMPORTANT]
  >  If you do not specify a security group, all users associated with the subscription who have a Customer Engagement apps license will be added to the new environment.  
  
- **Country/Region**. You can specify a region for the environment.  
  
  > [!NOTE]
  >  To request the ability to create [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] environments (Production and non-Production) in more than one geographical region, please contact your account manager or [Technical Support](/dynamics365/customer-engagement/admin/contact-technical-support).  
  
- **Currency**. When you add an environment, you must select a base currency before the environment is provisioned. Although you can add currencies in the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps, only the base currency will be used for reporting.  
  
    > [!WARNING]
    >  Once set, the base currency cannot be changed.  
  
## Add an additional environment  
 The following steps apply to customers who do not purchase using volume licensing. Volume license customers should see: [Microsoft Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/default.aspx).  

### Step 1: Contact support

For now, you should [contact support](get-help-support.md) to provision a new environment.

### Step 2: Configure the additional environment  
  
1. [!INCLUDE[proc_office365_signin](../includes/proc-office365-signin.md)]  
  
2. [!INCLUDE[proc_office365_choose_admin_crm](../includes/proc-office365-choose-admin-crm.md)]  
  
3. Choose the **Instances** tab.  
  
4. Select the environment that you want to configure, and then click **Configure**.  
  
   > [!TIP]
   >  If the environment does not appear in the list or is in a state other than **ready to configure**, wait a few minutes and then try again. Or, close your Customer Engagement apps browser session and open a new session to force an update to the **Manage your Dynamics 365 environments** page.  
   > 
   >  You cannot start a new Customer Engagement environment until you click **Configure** and complete the configuration process.  
   > 
   > Customer Engagement environments will not come prepared with sample data when configured by an [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] Global administrator who does not have a Customer Engagement apps license. Sample data may be added later, after the environment is configured and ready to use, by a [!INCLUDE[pn_crm_online_subsequent](../includes/pn-crm-online-subsequent.md)] apps licensed user who has the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps System administrator security role. For more information, see [Add or remove sample data](/dynamics365/customer-engagement/admin/add-remove-sample-data).  
  
5. On the **configure new environment** page, enter your settings, and then click **Next**.  
  
6. On the **Confirm some details** page, verify that the country/region and currency displayed are correct. Although you can add currencies in the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps, only the base currency will be used for reporting.  
  
   > [!WARNING]
   >  After a base currency is selected it cannot be changed.  
  
    After you have verified that the base currency is correct, click **Finish**.  
  
7. Once your environment is set up, make note of the URL and click or tap it to launch Customer Engagement apps. Prepare the environment for users by assigning security roles, creating teams, customizing, and importing data. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Getting Started](/dynamics365/customer-engagement/admin/getting-started).  
  
## What is the effect of an additional environment on storage?  
 When you add a new Customer Engagement environment, the new environment and any existing environments will consume the existing storage that is available to the account. Warnings will be communicated when storage is near capacity.  
  
## Control user access to environments: security groups and licenses  
 If your company has multiple Customer Engagement environments, you can use security groups to control which licensed users can be a member of a particular environment.  
  
 Consider the following example scenario:  
  
|environment|Security Group|Purpose|  
|--------------|--------------------|-------------|  
|Coho Winery Sales|Sales_SG|Provide access to the organization that creates sales opportunities, handles quotes, and closes deals.|  
|Coho Winery Marketing|Marketing_SG|Provide access to the organization that drives marketing efforts through marketing campaigns and advertising.|  
|Coho Winery Service|Marketing_SG|Provide access to the organization that processes customer cases.|  
|Coho Winery Dev|Developer_SG|Provide access to the Sandbox environment used for development and testing.|  
  
 In this example, four security groups provide controlled access to a specific organization.  
  
 Note the following about security groups:  
  
- When users are added to the security group, they are added to the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] environment.  
  
- When users are removed from the group, they are disabled in the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] environment.  
  
- When a security group is associated with an existing environment with users, all users in the environment that are not members of the group will be disabled.  
  
- If a [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] environment does not have an associated security group, all users with a [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps license will be created as users and enabled in the environment.  
  
- If a security group is associated with an environment, only users with [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] apps licenses that are members of the environment security group will be created as users in the [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] environment.  
  
- When you remove a security group that is associated with a Customer Engagement environment, either by editing the environment and removing the security group or by deleting the security group, Customer Engagement apps licensed users who were members of the security group will have the same access to Customer Engagement apps.  
  
- When you assign a security group to an environment, that environment will not show up in the **environments** tab (environment picker) in the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)] for users not in the group.  
  
- If you do not assign a security group to an environment, the environment will show up in the **environments** tab (environment picker) in the [!INCLUDE[pn_dyn_365_admin_center](../includes/pn-dyn-365-admin-center.md)] even for those who have not been assigned a security role in that [!INCLUDE [pn-crm-shortest](../includes/pn-crm-shortest.md)] environment.  
  
- You cannot make security groups members of other security groups.

> [!NOTE]
>  All licensed users, whether or not they are members of the security groups, must be assigned [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps security roles to access Customer Engagement apps. You assign the [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps security roles in the Customer Engagement apps web application. Users can’t access environments of Customer Engagement apps until they are assigned at least one security role for that environment. More information: [Grant users access to Microsoft Dynamics 365 for Customer Engagement apps (online)](/dynamics365/customer-engagement/admin/grant-users-access).  
  
### Create a security group and add members to the security group  
  
1.  Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).  
  
2.  Click **Groups** > **Groups**.  
  
3.  Click **+ Add a group**.  
  
4.  Change the type to **Security group**, add the group **Name** and **Description**. Click **Add** > **Close**.  
  
5.  Click the group you created, and then next to **Members**, click **Edit**.  
  
6.  Click **+ Add members**. Select the users to add to the security group, and then click **Save** > **Close** several times to return to the **Groups** list.  
  
7.  To remove a user from the security group, select the security group, next to **Members**, click **Edit**. Click **- Remove members**, and then click **X** for each member you want to remove.  
  
> [!NOTE]
>  If the users you want to add to the security group are not created, create the users and assign to them the Customer Engagement apps licenses.  
> 
>  To add multiple users, see: [bulk add users to Office365 groups](http://go.microsoft.com/fwlink/p/?LinkID=615203).  
  
### Create a user and assign license  
  
1. In the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], click **Users** > **Active users** > **+ Add a user**. Enter the user information, select licenses, and then click **Add**.  
  
   [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Add users individually to Office 365 - Admin Help](http://go.microsoft.com/fwlink/p/?LinkID=615205)  
  
### Associate a security group with a Dynamics 365 for Customer Engagement environment  
  
1. In the [!INCLUDE[pn_office_365_admin_center](../includes/pn-office-365-admin-center.md)], click **Admin centers** > **Dynamics 365**.  
  
2. Click the **environments** tab, select an environment, and then click **Edit**.  
  
3. In **security settings**, search for a specific security group, and then click **Next** > **Save**.  
  
> [!TIP]
> To force an immediate synchronization between the [!INCLUDE[pn_MS_Online_Services_Portal](../includes/pn-ms-online-services-portal.md)] and [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps, do the following:  
> 
> - Sign out of [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps and the [!INCLUDE[pn_MS_Online_Services_Portal](../includes/pn-ms-online-services-portal.md)].  
> - Close all open browsers used for [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps and the [!INCLUDE[pn_MS_Online_Services_Portal](../includes/pn-ms-online-services-portal.md)].  
> - Sign back in to [!INCLUDE[pn_CRM_Online](../includes/pn-crm-online.md)] apps and the [!INCLUDE[pn_MS_Online_Services_Portal](../includes/pn-ms-online-services-portal.md)].  
  
### See also  
 [Edit properties of an instance](/dynamics365/customer-engagement/admin/edit-properties-instance.md)   
 [Manage Dynamics 365 for Customer Engagement apps (online) Sandbox instances](/dynamics365/customer-engagement/admin/manage-sandbox-instances)   
 [Grant users access to Microsoft Dynamics 365 for Customer Engagement apps (online)](/dynamics365/customer-engagement/admin/grant-users-access.md)   
 [Manage subscriptions, licenses, and user accounts](/dynamics365/customer-engagement/admin/manage-subscriptions-licenses-user-accounts)
