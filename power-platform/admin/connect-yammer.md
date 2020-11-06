---
title: "Connect to Yammer  | MicrosoftDocs"
description: Connect to Yammer
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Connect to Yammer 

<!-- legacy procedure -->

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

[!INCLUDE[pn_yammer](../includes/pn-yammer.md)] gives colleagues at your organization a central place to have conversations, create and edit documents, and share information without sending a single email or attending any meetings.  
  
 After you set up your organization to work with [!INCLUDE[pn_yammer](../includes/pn-yammer.md)], employees will see posts in a newsfeed on their customer engagement apps dashboard whenever people update customer info, and they'll be able to join in the conversation with their own posts.  
  
## Connect your organization to Yammer  
  
### Prerequisites  
  
- Before your organization can use [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), your organization needs to buy [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] enterprise licenses.  

- [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] integration is only available for customer engagement apps.
  
- [!INCLUDE[proc_permissions_system_admin](../includes/proc-permissions-system-admin.md)]  
  
- You'll also need to have verified system administrator privileges for your organization's [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] account.  
  
- Install the most recent product updates for customer engagement apps.  
  
- Meet [browser and system requirements](https://support.office.com/article/Yammer-admin-guide-a9c206d4-fb18-4250-bec6-e783b926e4f6).  
  
### Connect to Yammer  
  
1. Sign up for a [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] Enterprise account, and note the name of the network you receive. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Visit the Yammer website](https://go.microsoft.com/fwlink/p/?LinkID=272440)  
  
2. [!INCLUDE[proc_settings_system](../includes/proc-settings-system.md)]  
  
3. In the Power Platform admin center, select an environment. 

4. Select **Settings** > **Integration** > **Yammer**.  
  
5. Read the disclaimer, and then choose **Continue**.  
  
6. Choose **Authorize Microsoft Dynamics 365 Online to connect to [!INCLUDE[pn_yammer](../includes/pn-yammer.md)]**.  
  
7. Sign in to your enterprise [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] account using your administrator credentials.  
  
8. Follow the on-screen instructions to accept the [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] terms of service, note which [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] network has been set up for you, and connect your organization to it. After your organization is connected, you'll see a confirmation message at the bottom of the screen.  
  
   > [!NOTE]
   > Customer engagement apps only support connecting to the primary [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] network. Connecting to External Networks in [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] is not supported.  
  
9. If desired, stay signed in to your [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] account and set your organization's preferences for [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] posts.  
  
### Set your organization's preferences for Yammer posts (optional)  
  
1. Make sure you're signed in to your enterprise [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] account using your administrator credentials.  
  
2. If desired, select whether [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] posts are **public** (everyone sees customer engagement apps posts in the newsfeed, or **private** (people must "follow" a record to see posts about that record in the newsfeed).  
  
3. If desired, select the default group where you would like posts to appear.  
  
4. If desired, select which record types trigger automatic posts to the [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] newsfeed.  
  
## Enable entities for Yammer  
 Once you've connected customer engagement apps to [!INCLUDE[pn_yammer](../includes/pn-yammer.md)], you need to specify which entities are enabled for use with [!INCLUDE[pn_yammer](../includes/pn-yammer.md)]. Enabled entities can be followed by users  
  
1. [!INCLUDE[proc_settings_system](../includes/proc-settings-system.md)]  
  
2. Choose **Activity Feeds Configuration** > **Post Configurations**  
  
3. Choose the entity, and then choose **Activate**.  
  
4. Confirm the activation, and then choose **More Commands (…)** > **Publish All Customizations**  
  
## What triggers automatic posts to the Yammer newsfeed?  

> [!IMPORTANT]
> As of June 26, 2018, Yammer deprecated the Activity stream and its related APIs so auto-posts can no longer be enabled. For more information, see [Open Graph Actions & Activity stories](https://developer.yammer.com/blog/open-graph-actions-activity-stories).

## Additional considerations  
  
### When connecting with a federated Yammer  
 If you have configured [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] to use single sign-on, you'll need to generate and use a temporary password to connect to [!INCLUDE[pn_yammer](../includes/pn-yammer.md)].  
  
1. Sign in to [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] with the single sign-on credentials.  
  
2. Choose **More commands (…)** > **Apps**  
  
3. Scroll to the bottom of the page to the **All Apps** section.  
  
4. Choose the **[!INCLUDE[pn_yammer](../includes/pn-yammer.md)]** tab, and then choose an app like [!INCLUDE[pn_windows_phone](../includes/pn-windows-phone.md)]. The app must support generating a temporary password.  
  
5. Complete the process to obtain a temporary user name and password.  
  
6. Use the temporary user name and password to complete the customer engagement apps to [!INCLUDE[pn_yammer](../includes/pn-yammer.md)] connection configuration.  
  
### Add Yammer sites to the browser as trusted  
 Add your Yammer sites to your browser as trusted. For example, for customer engagement apps, add the following:  
  
- https://*.crm.dynamics.com  
  
- https://*.yammer.com  
  
- https://*.assets-yammer.com  
  
## Privacy notice  
[!INCLUDE[cc_privacy_crm_gcc_yammer_configuration](../includes/cc-privacy-crm-gcc-yammer-configuration.md)]
  
### See also  
 [Visit the Yammer website](https://go.microsoft.com/fwlink/p/?LinkID=272440)
