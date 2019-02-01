---
title: "Opt in to April 2019 updates | MicrosoftDocs"
description: Opt in to April 2019 updates for the Dynamics 365 for Customer Engagement platform.
ms.custom: ""
ms.date: 02/01/2019
ms.reviewer: ""
ms.service: "crm-online"
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
# Opt in to April 2019 updates

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

You can enable the features coming in the April 2019 update by opting in to the updates in the Power platform Admin center. Opting in will enable all relevant updates for Dynamics 365 for Customer Engagement, which will be enabled by default to everyone starting April 2019.

![Previewing April 2019 updates](media/preview-schedule.png "Previewing April 2019 updates")

## Which environment can be used for previewing April 2019 updates?

The environments (instances) that are eligible for enabling April 2019 release are Production, Trial, and Sandbox. This will allow you the flexibility to explore the preview features, and then adopt them across your environments at a rate that suits your business.

> [!IMPORTANT]
> We highly recommend that you create a copy of your Production environment as a Sandbox environment to try out the April 2019 updates. Once enabling the April 2019 update, it can’t be turned off. Hence, it’s necessary to first test out the updates in Sandbox environment, prior to enabling it in Production environment which could impact your users in the organization.
>
> Be sure to:
> - Understand [How do I prepare for the April 2019 update?](#how-do-i-prepare-for-the-april-2019-update)
> - Learn [what features are updated](#what-features-and-experiences-are-available-in-the-april-2019-update-) in the April 2019 update.
> - Test the updates before rolling out to production.

## How do I enable the April 2019 updates

Visit [Power platform Admin center](https://admin.powerplatform.microsoft.com/) and select the environment you want to enable the April 2019 updates.

> [!div class="mx-imgBorder"] 
> ![Select an environment](media/preview-select-environment.png "Select an environment")

On selecting, it will take you to the environment’s hub where you can select to manage the updates.

> [!div class="mx-imgBorder"] 
> ![Select an environment](media/preview-environment-manage.png "Select an environment")

Select **Activate now** to activate the April 2019 updates.

> [!div class="mx-imgBorder"] 
> ![Select Activate now](media/preview-activate.png "Select Activate now") 

The April 2019 update is activated for the Dynamics 365 platform and Dynamics 365 for Sales.

<!-- See what all is included in the April 2019 updates for platform and Sales app.--> 

For enabling the April 2019 updates for Marketing app, visit the [Dynamics 365 Admin center](https://port.crm.dynamics.com/G/manage/index.aspx) and upgrade the Marketing app.

<!-- See what all is included in the April 2019 updates for Marketing -->

See the following section for other update information.

## What features and experiences are available in the April 2019 update?  

### Updates in Dynamics 365 for Customer Engagement Platform
Updates are available now. See [Updates in sitemap and command bar](https://blogs.msdn.microsoft.com/crm/2018/10/01/announcing-ui-updates-in-october-for-sitemap-and-command-bar%E2%80%AF/).

### Updates in Dynamics 365 for Marketing app
Updates for the Marketing app are available now. See [Activate and use Marketing app preview features](https://go.microsoft.com/fwlink/p/?linkid=2065942).

### Updates in Dynamics 365 for Sales app
Updates will come later. Check back for information.

<!-- ### Updates in Dynamics 365 for Services(s) app
There are no relevant updates releasing with Service(s) for April 2019. -->

## How will the April 2019 features be enabled for customers who did not opt-in to the preview?
Starting on April 5, 2019, we will begin to use our gradual region-by-region deployment cadence to enable the April 2019 features across our global customer base. This update will be like the Minor Service Update experience we are delivering today and won’t require you to schedule downtime to perform the update. The updates will be applied over the entire month of April. If you want to enable the April 2019 features before the update reaches your region, you can enable the updates yourself by opting in to the preview between February 1, 2019, and the date your region will be scheduled to have the features turned on. In coming months, we will publish the specific schedule for when the April 2019 features will be enabled for each region.

## How do I prepare for the April 2019 update?
The flow chart below shows the steps needed to enable the April 2019 release to your Production environment prior to it being enabled by default in April 2019. The table below the flow chart provides information about the steps.

> [!div class="mx-imgBorder"] 
> ![Steps needed to enable the April 2019 release](media/previewapril2019-flow-90e.png "Steps needed to enable the April 2019 release")

|  |  |
|---------|---------|
|(1)    | **Have a Sandbox environment as a copy for the Production environment** <br/><br/>We strongly recommend enabling the April 2019 release first in a Sandbox environment which is a replica or copy of the existing Production environment. This is to make sure that a customer has validated the updates in another environment prior to impacting the current Production apps and environment.<br/> <br/> Also, once April 2019 updates are enabled for an environment, they cannot be turned off like any other setting. Learn more about it in (3) below.<br/><br/>**Create a copy of the Production environment into a Sandbox environment**<br/><br/>If you don’t have a Sandbox copy of your Production environment, you can create a [copy](https://docs.microsoft.com/dynamics365/customer-engagement/admin/copy-instance) in the Dynamics 365 admin center.<br/><br/>**Create a backup of the Production environment**<br/> <br/> For restoration, if needed.   |
|(2)     | **Enable the April 2019 opt-in from the Power platform Admin center**<br/><br/>Starting February 1, 2019,  you will be able to enable the April 2019 release for the environment. This option will be available in **Environment** > **Settings** > **Previews and updates**. Once enabled for an environment, you cannot turn this off for the environment. To remove the April 2019 updates for your environment, you will have to either reset the environment or restore the environment to a previously backed up version. We do not recommend doing any of those options unless necessary. It's important to try the April 2019 updates in your Sandbox environment first prior to enabling it in your Production environment.        |
|(3)     |**Any Dynamics 365 for Customer Engagement apps installed on the environment?**<br/><br/>If you have any Dynamics 365 for Customer Engagement apps on your environment like Sales, Service and Marketing, then they need to be explicitly upgraded to the April 2019 version.  |
|(4)     | **Update the applications from Dynamics 365 admin center**<br/><br/>Once you have enabled the April 2019 updates for your environment, you can update your apps from Dynamics 365 admin center > Applications. For example, if you have the Dynamics 365 for Sales application installed on your environment, then the option to Upgrade will be visible in the admin center. Please note that upgrading the app might take a few hours and you might see a downtime for your applications going through the update process.  |
|(5)     | **We recommend testing out all the scenarios exhaustively in this step** <br/><br/>If you have any Dynamics 365 for Customer Engagement apps in your environment like Sales, Service and Marketing, then they need to be explicitly upgraded to the April 2019 version.  |
|(6) and (7)     |**Report any issues found** <br/><br/>As you verify the experience in your preview environment, if you find any regressions, functional, or performance issues related to the April 2019 updates that could impact your business, report them to Microsoft by opening a [support ticket](https://dynamics.microsoft.com/support/) or through the [Dynamics 365 forum](https://community.dynamics.com/f). |
|(8)     | **Enable the April 2019 updates in your Sandbox environment**<br/><br/>You should:<br/><ol><li>Update customizations to leverage or respond to new capabilities.</li><li>Update internal readiness materials based on new features or user experiences.</li><li>Prepare internal change management to run in April (training, communications, etc.)</li></ol>   |
|(9)     | **Enable the April 2019 updates in your Production environment**<br/><br/>We recommend enabling these updates during business downtime after you have validated your key scenarios are working as expected. Please note, once the April 2019 update is enabled this cannot be reversed. However, you can restore to a prior backup version of the updated environment if needed.  |
