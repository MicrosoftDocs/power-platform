---
title: "Preview: Administer Power platform | MicrosoftDocs"
description: The Power platform Admin center is the new site to manage Common Data Service for Apps and other apps.
ms.custom: ""
ms.date: 08/08/2018
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
ms.assetid: 83200632-a36b-4401-ba41-952e5b43f939
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Preview: Introducing the Power platform Admin center

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

> [!IMPORTANT]
> - This feature currently has limited availability.
> - [!INCLUDE[cc_preview_features_definition](../includes/cc-preview-features-definition.md)]  
> - [!INCLUDE[cc_preview_features_expect_changes](../includes/cc-preview-features-expect-changes.md)]  
> - [!INCLUDE[cc_preview_features_no_MS_support](../includes/cc-preview-features-no-ms-support.md)]  

If you've managed Dynamics 365 (online) tenants and instances, you've used the Dynamics 365 admin center.

![Dynamics 365 admin center](./media/old-admin-center50.png)

With the merge of Common Data Service and the Dynamics 365 platform, we're launching a new admin center experience bringing PowerApps, Flow, and Dynamics 365 administration management together in a single site - the [Power platform Admin center](https://admin.dynamics.com).

![Power platform Admin center](./media/new-admin-center-environments.png)

<!--
Benefits of the Power platform Admin center include:

> - **Accessible admin settings**: Configure all environment settings from the admin center through a single experience designed with accessibility in mind. 
> - **Unified environment management**: Admins no longer need to switch between the Dynamics 365 Admin Center and the Admin Settings experience to properly setup their environment. Admins now have a single view of all environments deployed on the Common Data Service for apps across their organization.
> - **PowerApps and Flow usage reports**: Admins now have more visibility over the PowerApps and Microsoft Flow activity and usage within their organization. From the admin center, admins can review tenant-wide and environment-level reports detailing active users, app usage, and flow usage across their organization.
> - **Unified gateway management**: Have full visibility over all the gateways that have been setup by makers within their organization that could be providing access to sensitive company data. Global admins can view and manage all gateways in their organization from the admin center. 
> - **Migrate Flow and DLP management**: Admins and partners can create data-loss prevention (DLP) policies and manage flows within their organization from the admin center.
> - **Migrate Dynamics 365 Customer Engagement App Management**: Install, configure, and uninstall Dynamics 365 Customer Engagement apps (now called Common Data Service apps) from the admin center.
> - **Migrate PowerApps management**: Manage custom canvas and model-drive PowerApps within their organization from the admin center.
> - **Dynamics 365 Trial sign-up**: Users can sign up for a Dynamics 365 trial.
> - **AppSource installation**: Acquire and install first and third-party applications from AppSource via the admin center.
> - **Organization Insights reports**: Admins no longer need to install the Organization Insights solution into their environment as all the reports are available by default from the admin center as Common Data Service Analytics.

> [!NOTE]
> We're rolling out the Power platform Admin center in phases to ensure a stable and high performance environment. Not all of the above benefits are in the Admin center at this time. Check back here for updates on new features as they become available.
-->

## Admin center interface
<!--
![Walkthrough of the new admin center](./media/new-admin-center-menu75.png)
-->
|Element  |Description  |
|---------|---------|
|Help + support     | Get a list of self-help solutions or create a support ticket for technical support.         |
|Environments | A list of your environments. Select an environment to see details.|
|Analytics     | Get a detailed view of key metrics for Power platform apps.       |
|Data policies     | Create and manage [data loss prevention policies](https://docs.microsoft.com/powerapps/administrator/create-dlp-policy).       |
|Admin portals    |Links to other admin centers.        |

## Using the various admin centers

For now, there are multiple admin centers you use to manage and monitor your environments. Here's some guidance on the basic role of each.

|Admin Center  |Common Tasks  |
|---------|---------|
|Power platform Admin center <br/>[https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com)     |The new unified administrative portal for Power platform admins.  Currently this portal can be used for CDS environment management, to submit CDS for Apps and Flow support tickets, and to view PowerApps and Flow admin analytics.   |
|PowerApps Admin center <br/>[https://admin.powerapps.com](https://admin.powerapps.com)    |Creating and managing environments including security starts here. Within each environment you can manage the apps and flows.  Monitor who is licensed and building things. Create and manage Data Loss Prevention policies. Manage CDS Data Integration projects.    |
|PowerApps Maker Portal<br/>[https://web.powerapps.com](https://web.powerapps.com)      |This portal is focused on building PowerApps but can also view and manage CDS components, manage connectors and gateways.  You can also see application statistics from details on apps here.         |
|Microsoft Flow Admin Portal<br/>[https://admin.flow.microsoft.com](https://admin.flow.microsoft.com)   | This points to the same site as admin.powerapps.com.    |
|Business platform admin center<br/>[https://admin.businessplatform.microsoft.com](https://admin.businessplatform.microsoft.com)      |This points to the same site as admin.powerapps.com.  **Over time, this will migrated to and replaced by the Power platform Admin center.**        |
|Dynamics 365 Admin center<br/>[https://port.crm.dynamics.com/G/manage/index.aspx](https://port.crm.dynamics.com/G/manage/index.aspx)     |The Dynamics 365 Admin Center, that can be leveraged to perform certain CDS environment management like renaming, deleting, and resetting.    |
|Dynamics 365 Instance Management<br/>[https://port.crm<N>.dynamics.com/G/Instances/InstancePicker.aspx](https://port.crm<N>.dynamics.com/G/Instances/InstancePicker.aspx) | This instance management portal is reached from admin.powerapps.com when managing the CDS database or from the Dynamics 365 Admin center. Here you will see a list of all the CDS databases and can perform actions such as backup, as well as other actions on a per instance basis.   |
|Office 365 Admin center<br/>[https://portal.office.com/adminportal](https://portal.office.com/adminportal)      |Here you manage users and their license assignment as well as launch into many of the individual admin centers.         |
|Microsoft Azure<br/>[https://portal.azure.com](https://portal.azure.com)      |Advanced Azure AD management tasks like conditional access and support for developer application registration is done here. This is also where you start setup of your on-premises gateways.         |
|Security and Compliance Center<br/>[https://protection.office.com](https://protection.office.com)     |In addition to the general compliance tasks, administrators can come here to search the Audit log to see Flow audit events.         |

<!--
## What about the Office 365 admin center?

You'll continue to use the Office 365 admin center to manage settings like:

> - users, licenses, roles, passwords
> - subscriptions, billing, purchase services
> - service health
> - usage and security reports

![Office 365 admin center](./media/o365-admin-center.png)
-->