---
title: "Early opt in to 2019 release wave 2 | MicrosoftDocs"
description: Opt in to 2019 release wave 2  for the Dynamics 365 for Customer Engagement platform
ms.custom: ""
ms.date: 08/02/2019
ms.reviewer: ""
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Early opt in to 2019 release wave 2 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can enable the features coming in the 2019 release wave 2 update by opting in to the updates in the Power Platform Admin center. Opting in will enable all changed user experience updates for Dynamics 365 for Customer Engagement, which will be enabled by default to everyone starting 2019 release wave 2.

> [!div class="mx-imgBorder"] 
> ![2019 release wave 2 timeline](media/october-timeline.png "2019 release wave 2 timeline")

Check out the new features releasing from October 2019 through March 2020 for Dynamics 365. See [Dynamics 365 release schedule and early access](https://aka.ms/EarlyAccessFAQ).

> [!NOTE]
> Most of the early opt in features are end user impacting changes. Check out the "Enabled for" column in the [early access features](https://aka.ms/EarlyAccessFeatures) table to know the features that will roll out to the end users automaticaly in October 2019. 


## Which environment can be used for early opt in to 2019 release wave 2 updates?

You can enable Trial and Sandbox environments for the 2019 release wave 2 release. This will allow you the flexibility to explore features, and then adopt them across your environments at a rate that suits your business.

> [!IMPORTANT]
> While you can enable a Production environment, we highly recommend that you create a copy of your Production environment as a Sandbox environment to try out the 2019 release wave 2 updates. After enabling the 2019 release wave 2 update, it can’t be turned off. Therefore, it’s necessary to first test out the updates in Sandbox environment, prior to enabling it in Production environment which could impact your users in the organization.
>
> Be sure to:
> - Understand [Dynamics 365: 2019 release wave 2 plan](https://docs.microsoft.com/dynamics365-release-plan/2019wave2/).
> - Learn [what features are included in the 2019 release wave 2 plan](https://docs.microsoft.com/power-platform-release-plan/2019wave2/microsoft-powerapps/planned-features).
> - Review [How do I prepare for the 2019 release wave 2 update?](#how-do-i-prepare-for-the-2019-release-wave-2-update).
> - Test the updates before rolling out to production.
>
> By activating the 2019 release wave 2 updates opt-in, you will get features and updates that are end user impacting only. These and other changes will be enabled automatically for everyone in October 2019.

## How do I enable the 2019 release wave 2 updates

Visit [Power Platform Admin center](https://admin.powerplatform.microsoft.com/) and select the environment you want to enable the 2019 release wave 2 updates.

> [!IMPORTANT]
> We highly recommend that you create a copy of your Production environment as a Sandbox environment to try out the 2019 release wave 2 updates. After enabling the 2019 release wave 2 update, it can’t be turned off. Therefore, it’s necessary to first test out the updates in Sandbox environment, prior to enabling it in Production environment which could impact your users in the organization.

Select **Manage**.

> [!div class="mx-imgBorder"] 
> ![Select an environment](media/update-manage.png "Select an environment")

Select **Update now** to activate the 2019 release wave 2 updates and proceed through confirmation dialogs. 

> [!div class="mx-imgBorder"] 
> ![Select Activate now](media/new-update.png "Select Activate now") 

The 2019 release wave 2 update is activated for the Dynamics 365 platform, Dynamics 365 for Sales, Customer Service, Sales Hub, Customer Service Hub, and Marketing.

> [!NOTE]
> You will need to take additional steps to enable the 2019 release wave 2 updates for the Marketing app. See [Enable the 2019 release wave 2 updates for Dynamics 365 for Marketing](#enable-the-2019-release-wave-2-updates-for-dynamics-365-for-marketing).
>
> Current apps for which you have licenses are updated; new apps are not installed.

You can verify activation by going to **Settings** (![Settings button](media/settings-button-nav-bar.png))> **About** where you'll see a screen like the following:

|In Unified Interface  |In Web Client Interface  | 
|---------|-------|
|![Opt-in status](media/update-status.png "Opt-in status")        | ![Opt-in status](media/update-status-webclient.png "Opt-in status")        |

> [!NOTE]
> You need to select **About** from a Customer Engagement app page that's displayed in the [Unified Interface](https://docs.microsoft.com/dynamics365/customer-engagement/admin/about-unified-interface) such as Sales Hub or Customer Service Hub pages.
>
> The server version will not be updated to the next version after activation.

## What features and experiences are available in the 2019 release wave 2 update?  

The 2019 release wave 2 update has three kinds of functionalities (as with any other update):
- Updates to existing user experiences which are updated automatically
- Updates to existing user experiences which are updated by the admin and maker
- Updates to admin and maker functionality

By activating the 2019 release wave 2 updates opt-in, you will get updates **to existing user experience only**. The exact list of features which are updates to existing user experiences are listed [here](https://aka.ms/EarlyAccessFeatures). 
 
The Release Plan lists other features across Dynamics 365 – Sales, Service, Marketing, and PowerApps (and platform). Features which are not updates to the existing user experience will not be part of the 2019 release wave 2 updates opt in. They can either be new functionalities or additions to maker and admin functionality.

## Check the status of the update and troubleshoot

An update can take several hours. 

To check status during the update, select the environment in the Power Platform Admin center and review the **Updates** section.

> [!div class="mx-imgBorder"] 
> ![Check update status](media/check-update-status.png "Check update status") 

Use the following table to check the status of the 2019 release wave 2 update and see troubleshooting recommendations.

|App/Platform  |How to identify update success  |Troubleshoot  |
|---------|---------|---------|
|Common Data Service/Platform     | <sup>1</sup>**About** page<br />Look for *2019 release wave 2 enabled*        |Create a [support ticket](https://dynamics.microsoft.com/support/).         |
|Dynamics 365 for Sales     |<sup>2</sup>**Internal Solution History** page        |Updating the application might take few hours. Wait up to 24 hours before creating a [support ticket](https://dynamics.microsoft.com/support/).   |
|Dynamics 365 for Customer Service     | <sup>1</sup>**About** page <br />Look for *2019 release wave 2 enabled*            | Create a [support ticket](https://dynamics.microsoft.com/support/).   |
|Knowledge Management     | <sup>2</sup>**Internal Solution History** page / **Application** tab         | Updating the application might take few hours. Wait up to 24 hours before creating a [support ticket](https://dynamics.microsoft.com/support/).        |
|Field Service  | <sup>2</sup>**Internal Solution History** page / **Application** tab |  Updating the application might take few hours. Wait up to 24 hours before creating a [support ticket](https://dynamics.microsoft.com/support/). | 
|Marketing     | <sup>1</sup>**Internal Solution History** page / **Application** tab         | Updating the application might take few hours. Wait up to 24 hours before creating a [support ticket](https://dynamics.microsoft.com/support/).  |

<sup>1</sup>Select **Settings** (![Settings button](media/settings-button-nav-bar.png))> **About**. 

<sup>2</sup>Select an environment, select **Open environment** > **Settings** > **Solutions** > **All Solutions - Internal**. Find the app in the **Display Name** column and then check the version number with the following table.

|Display name  |Version number |
|---------|---------|
|Dynamics 365 Sales Application    | 9.0.1907.4Yxx, Y is greater than or equal to 5   |
|Knowledge Management Features    | 9.0.1.8Yx, Y is greater than or equal to 5 |
|Field Service  | 8.8.5.1Y, Y is greater than or equal to 0  
|Dynamics 365 for Marketing     | Check back for information        |

## Enable the 2019 release wave 2 updates for Dynamics 365 for Marketing

To enable 2019 release wave 2 early access features for Dynamics 365 for Marketing:

1.	Opt in for early access on the environment where your Marketing instance is running, as described in [How do I enable the 2019 release wave 2 updates](#how-do-i-enable-the-2019-release-wave-2-updates).
2.	Run the Marketing setup wizard to update your instance to the August 2019 release. This will install both the August 2019 production update and the early-access features when you run it on an environment where early access is enabled. For instructions, see [Re-run the Marketing setup wizard](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/re-run-setup).

For an overview of early access features being offered for Marketing, plus links to detailed documentation, see the August 2019 release announcement for Marketing.

## FAQ

### When will the 2019 release wave 2 features be enabled?

Starting October 5, 2019, we will enable the 2019 release wave 2 features (end user impacting only) across our global customer base. Your environment/org will be updated during one of the [maintenance windows](https://docs.microsoft.com/dynamics365/customer-engagement/admin/policies-communications#maintenance-timeline) over a weekend, starting on the dates listed below. The specific dates that the update will occur will be published in the [Message Center](https://docs.microsoft.com/dynamics365/customer-engagement/admin/policies-communications#maintenance-timeline), and each post will include the date, maintenance window, and a link to the Weekly Release Notes that contain the list of optimizations, fixes, and enhancements. Each environment/org should see the new features and build numbers by Monday morning, local time.

Here are the current schedules.

**Regions**

|Japan  |South <br/>America  |Canada  |India  |Asia  | 
|---------|---------|---------|---------|---------|
|Fri, Oct 11<br/>to<br/>Sun, Oct 13 | Fri, Oct 4<br/>to<br/>Sun, Oct 6  | Fri, Oct 4<br/>to<br/>Sun, Oct 6  |Fri, Oct 4<br/>to<br/>Sun, Oct 6  | Fri, Oct 11<br/>to<br/>Sun, Oct 13 | 

**Regions continued**

|Great <br/>Britain  |Australia  |Europe  |North <br/>America|  
|---------|---------|---------|---------|---------|
|Fri, Oct 11<br/>to<br/>Sun, Oct 13| Fri, Oct 11<br/>to<br/>Sun, Oct 13  | Fri, Oct 18<br/>to<br/>Sun, Oct 20| Fri, Oct 25<br/>to<br/>Sun, Oct 27 | 

**Other<sup>1</sup>**

|GCC  |GCC High  |DOD  |
|---------|---------|---------|
|Fri, Nov 1<br/>to<br/>Sun, Nov 3| Fri, Nov 1<br/>to<br/>Sun, Nov 3 | Fri, Nov 1<br/>to<br/>Sun, Nov 3 |

<sup>1</sup>See: [Dynamics 365 US Government](https://docs.microsoft.com/en-us/dynamics365/customer-engagement/admin/government/microsoft-dynamics-365-government).

On the above dates, your environments will have the 2019 release wave 2 updates automatically applied for the Dynamics 365 platform and apps. It will not require any action from you.

For Dynamics 365 for Marketing, you need to explicitly upgrade your app in the Dynamics 365 Admin Center.

If you want to enable the 2019 release wave 2 features (end user impacting only) before the update reaches your region, you can enable the updates yourself by opting in to the 2019 release wave 2 update between February 1, 2019, and the date your region will be scheduled to have the features turned on. 

To know the list of end user impacting features, check our [Dynamics 365 features for early access](https://aka.ms/October2019Opt-ins). Note: End user impacting features for 2019 release wave 2 release are targeting the Unified Interface only. Web client environments/orgs will not be impacted by these updates.

### Will the version number get updated with the 2019 release wave 2 update?
No, the version number will not get changed with the 2019 release wave 2 update.

### Will Microsoft provide a free Sandbox environment at no charge for testing updates? 
You will need to create a Sandbox environment (a copy of the Production environment) which is not provided for free.

### When will the updates be available for testing in the Sandbox environment?
The updates are available now. All you need to do is to activate the 2019 release wave 2 update as described above.

### Which updates will have an opt-in switch and which ones will be provided by default? 

Only the existing user experience changes are provided (and enabled by default) with the 2019 release wave 2 update opt-in; the rest will be available later. Existing user experiences will not get impacted with the update, unless the updates are not made to the existing solutions. Here are [all the features and updates provided](https://docs.microsoft.com/power-platform/admin/preview-October-2019-updates#what-features-and-experiences-are-available-in-the-october-2019-update-).

### What is the process for reporting issues with the update?
Create a [support ticket](get-help-support.md).

## How do I prepare for the 2019 release wave 2 update?
The flow chart below shows the steps needed to enable the 2019 release wave 2 release to your Production environment prior to it being enabled by default in 2019 release wave 2. The table below the flow chart provides information about the steps.

> [!div class="mx-imgBorder"] 
> ![Steps needed to enable the 2019 release wave 2 release](media/october-flowchart.png "Steps needed to enable the 2019 release wave 2 release")

|  |  |
|---------|---------|
|(1)    | **Have a Sandbox environment as a copy for the Production environment** <br/><br/>We strongly recommend enabling the 2019 release wave 2 release first in a Sandbox environment which is a replica or copy of the existing Production environment. This is to make sure that a customer has validated the updates in another environment prior to impacting the current Production apps and environment.<br/> <br/> Also, once 2019 release wave 2 updates are enabled for an environment, they cannot be turned off like any other setting. <br/><br/>**Create a copy of the Production environment into a Sandbox environment**<br/><br/>If you don’t have a Sandbox copy of your Production environment, you can create a [copy](https://docs.microsoft.com/dynamics365/customer-engagement/admin/copy-instance) in the Dynamics 365 admin center.<br/><br/>**Create a backup of the Production environment**<br/> <br/> Recommended before merging Sandbox with changes into Production.    |
|(2)     | **Enable the 2019 release wave 2 opt-in from the Power Platform Admin center**<br/><br/>Starting August 2, 2019,  you will be able to enable the 2019 release wave 2 release for the environment. Once enabled for an environment, you cannot turn this off for the environment. To remove the 2019 release wave 2 updates for your environment, you will have to either reset the environment or restore the environment to a previously backed up version. We do not recommend doing any of those options unless necessary. It's important to try the 2019 release wave 2 updates in your Sandbox environment first prior to enabling it in your Production environment.        |
|(3)     |**Do you have Dynamics 365 for Marketing?**<br/><br/>If you have the Marketing app, you will need to manually enable it according to the process listed above. Dynamics 365 for Customer Engagement apps on your environment like Sales, Service will be automatically updated to the 2019 release wave 2 version once you enable the update. |
|(4)     | **We recommend testing out all the scenarios thoroughly in this step** <br/><br/>If you have any Dynamics 365 for Customer Engagement apps in your environment like Sales, Service and Marketing, they need to be explicitly updated to the 2019 release wave 2 version.  |
|(5) and (6)     |Validate the app upgrade progress. See [Check status of the update and troubleshoot](#check-the-status-of-the-update-and-troubleshoot). |
|(7)     |Updating the Marketing app requires additional action. See [Enable the 2019 release wave 2 updates for Dynamics 365 for Marketing](#enable-the-2019-release-wave-2-updates-for-dynamics-365-for-marketing).    |
|(8) and (9)    | **Report any issues found**<br/><br/>As you verify the experience in your preview environment, if you find any regressions, functional, or performance issues related to the 2019 release wave 2 updates that could impact your business, report them to Microsoft by opening a [support ticket](https://dynamics.microsoft.com/support/) or through the [Dynamics 365 forum](https://community.dynamics.com/f).  |
|(10)     | **Enable the 2019 release wave 2 updates in your Sandbox environment**<br /><br />You should: <br />1. Update customizations to leverage or respond to new capabilities.<br />2.	Update internal readiness materials based on new features or user experiences.<br />3.	Prepare internal change management to run in October (training, communications, etc.). |
|(11)     |**Enable the 2019 release wave 2 updates in your Production environment**<br /><br />We recommend enabling these updates during business downtime after you have validated your key scenarios are working as expected. Please note, once the 2019 release wave 2 update is enabled this cannot be reversed. However, you can restore to a prior backup version of the updated environment if needed. |

