---
title: "Install the Social Selling Assistant  | MicrosoftDocs"
description: Install the Social Selling Assistant
author: m-hartmann
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2017
ms.author: mhart
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Install the Social Selling Assistant

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

Set up the Social Selling Assistant  and onboard your users in just a few minutes. First, a [!INCLUDE[pn_ms_dyn_365](../includes/pn-ms-dyn-365.md)] admin needs to install the Social Selling Assistant and connect it with [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)]. Then, a [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)] admin refines the configuration in [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)] to enable the best possible experience when users are working with the Social Selling Assistant.  
  
<a name="prerequisites"></a>   
## Prerequisites  
 To install and set up the app, make sure you meet the following prerequisites.  
  
- Your organization updated to December 2016 Update for [!INCLUDE[pn_ms_dyn_365](../includes/pn-ms-dyn-365.md)] (online) or a later version.  
  
- You have a license assigned for both [!INCLUDE[pn_ms_dyn_365](../includes/pn-ms-dyn-365.md)] (online) and Social Engagement  
  
- You have a system admin or a customizer role in [!INCLUDE[pn_ms_dyn_365](../includes/pn-ms-dyn-365.md)] (online).  
  
- To update the additional configuration in [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)], you need at least the following permissions.  
  
  -   An administrator configuration role to configure custom tags in order to promote posts.  
  
  -   At least a power analyst configuration role to create search topics or edit topics you own.  
  
  -   At least a responder interaction role to share social profiles you own.  
  
[!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Understand user roles](https://go.microsoft.com/fwlink/?linkid=526596)  
  
<a name="installFromAppSource"></a>   

## Install the Social Selling Assistant app from AppSource  
 Before users can start working with the app, you need to install it from [AppSource](https://appsource.microsoft.com/marketplace?product=dynamics-365-for-sales%3Bdynamics-365-for-field-services%3Bdynamics-365-for-project-services-automation%3Bdynamics-365-for-customer-services).  
  
### Get it from Microsoft AppSource  
  
1. As a system administrator, go to **Settings** > **Dynamics Marketplace**.  
  
2. In the [AppSource](https://appsource.microsoft.com/marketplace?product=dynamics-365-for-sales%3Bdynamics-365-for-field-services%3Bdynamics-365-for-project-services-automation%3Bdynamics-365-for-customer-services) dialog, search for **Social Selling Assistant**.  
  
3. Click **Get** to start the installation, accept the disclaimer and follow the dialog guiding you through the installation.  
  
<a name="accessSocialSellingAssistant"></a>   
## Access the Social Selling Assistant  
 When you install the app, the system configures a new mobile-friendly dashboard.  
  
### Get to the Social Selling Assistant dashboard  
  
1. As a system administrator, go to **Sales** > **Dashboards**.  
  
2. In the drop-down list under **System Dashboards**, select **Social Selling assistant dashboard**.  
  
3. Configure the dashboard according to your user's needs.   
  
   Alternatively, you can access the Social Selling Assistant using the app module or using the main navigation in [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)].  
  
<a name="establishConnection"></a>   
## Establish the connection between model-driven apps in Dynamics 365 and [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)]  
 The data in the Social Selling Assistant comes from [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)]. To access this data from within model-driven apps in Dynamics 365, you need to connect the two services. You can skip this step if you already connected model-driven apps in Dynamics 365 and [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)] from another integration scenario.  
  
> [!NOTE]
>  You must ensure that your domain is added to the list of allowed domains in [!INCLUDE[pn_netbreeze_long](../includes/pn-social-engagement-long.md)].  
> 
> [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Connect Social Engagement to other domains](https://go.microsoft.com/fwlink/p/?linkid=403288)  
  
 For instructions how to set up the connection, see: [Connect to Social Engagement](../admin/connect-microsoft-social-engagement.md), [Integrate Social Engagement](https://go.microsoft.com/fwlink/?linkid=521682)  
  
### See also  
 [Connect to Microsoft Social Engagement](../admin/connect-microsoft-social-engagement.md)   
 [Install or remove a preferred solution](../admin/install-remove-preferred-solution.md)
