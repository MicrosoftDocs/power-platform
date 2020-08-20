---
title: "General availability deployment  | MicrosoftDocs"
description: About general availability deployment
author: angelmarshall
ms.author: angelmarshall
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/07/2020

search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# General availability deployment 

After a release wave is generally available, all environments will be automatically turned on to receive mandatory updates which will enable the early access features and the general available features of a release.  

> [!TIP]
> Check out [Dynamics 365 and Power Platform Release Plans](https://docs.microsoft.com/dynamics365/release-plans/) to learn more about new features to be released in the release waves.   

Throughout a release wave, your environments will be updated during one of the weekend [maintenance windows](policies-communications.md#maintenance-timeline) based on your environments' region. The specific dates when the updates will occur will be published to the [Message Center](https://docs.microsoft.com/office365/admin/manage/message-center?view=o365-worldwide). Each notification will include the dates, the maintenance window, and the Release Plan reference for the list of optimizations, fixes, and enhancements. Each environment should see the new features and build numbers by Monday morning, local time. See [Policies and communications](policies-communications.md#scheduled-system-updates). 

> [!NOTE]
> If you have enabled the early access updates in your environments, you'll continue getting updates throughout the release wave.
>
>If you did not opt in for the early access updates in your environments, your environment will be automatically updated to receive the new release based on the general availability deployment schedule for your region.  

## Deployment schedule  

The deployment schedule will be updated soon.

<!--
The following is the current schedule for when the 2020 release wave 1 features will be enabled by regions. 
 
> [!IMPORTANT]
> As announced in the [blog post](https://aka.ms/covid19Blog), Microsoft is making some changes to the update schedules in April in response to COVID-19. The 2020 release wave 1, April updates will be generally available as mentioned in the [Dynamics 365](https://aka.ms/Dynamics365ReleasePlan) and [Power Platform](https://aka.ms/PowerPlatformReleasePlan) release plans. However, we are making some changes to the release schedule as explained later in [this article](https://docs.microsoft.com/dynamics365/get-started/release-schedule). Microsoft will continue to release critical updates for Dynamics 365 applications and Power Platform. Microsoft is also extending the deprecation timelines for some capabilities to provide customers and partners additional time to make the transition. Microsoft is committed to providing support to our customers and partners during this period.


|Regions  |Automatic update window  |
|---------|---------|
|South America<br />Canada<br />India<br />France<br />Emirates<br />South Africa<br />Germany  |  Friday, May 1st – Sunday, May 3rd     |
|Japan<br />Asia Pacific<br />Great Britain<br />Australia   | Friday, May 8th – Sunday, May 10th        |
|Europe     | Friday, May 15th – Sunday, May 17th         |
|North America     |  Friday, May 22nd – Sunday, May 24th       |
|China | Friday, May 29th – Sunday, May 31st   |
|GCC<br />GCC High<br />DOD  |Friday, May 29th – Sunday, May 31st <br />See [Dynamics 365 US Government](microsoft-dynamics-365-government.md). |

During the general availability deployment, your environments will be updated with the latest features and functionality automatically applied to Dynamics 365 applications and Power Platform. It will not require any action from you.

## Additional requirements   

Some of the apps require additional manual steps to enable the new features of a release. If you use of any of following apps, you will need to take additional manual steps after a release wave is automatically deployed to your region. 


|Apps  |Description of manual steps |
|---------|---------|
|Dynamics 365 Marketing      | Run the Marketing setup wizard to update your environment. This will install both the new release for production updates and the early access features when you run it on an environment where early access is enabled. For instructions, see [Rerun the Dynamics 365 Marketing setup wizard](https://docs.microsoft.com/dynamics365/customer-engagement/marketing/re-run-setup).         |
|Dynamics 365 Field Service      | If you have Dynamics 365 Field Service version 8.8.6.0 or newer, you'll automatically receive the updates. If you're running on an older version of the Field Service app, you'll need to perform an upgrade. See [Upgrade Dynamics 365 Field Service](https://docs.microsoft.com/dynamics365/field-service/upgrade-field-service).         |
|Dynamics 365 Project Service Automation      | If you have Dynamics 365 Project Service Automation version 3.10.2.0 or newer, you'll automatically receive the updates. If you're running on an older version of the Project Service app, you'll need to perform an upgrade. See [Upgrade home page](https://docs.microsoft.com/dynamics365/project-service/upgrade-psa-home-page).         |
|Dynamics 365 Resource Scheduling Optimization      | If you have Dynamics 365 Resource Scheduling Optimization, you will need to update or deploy Resource Scheduling Optimization in the Dynamics 365 admin center. For instructions, see [Update RSO](https://docs.microsoft.com/dynamics365/field-service/upgrade-field-service#resource-scheduling-optimization) and [Deploy RSO](https://docs.microsoft.com/dynamics365/field-service/rso-deployment).         |
|Dynamics 365 Customer Service Team Member      | Customer Service Team Member is a new app module. Users with a Dynamics 365 Team Member license need to manually install this app to enable this feature. For instructions, see [Customer Service Team Member](https://docs.microsoft.com/dynamics365/customer-service/customer-service-team-member).         |
-->

### See also
[Dynamics 365 release schedule](https://docs.microsoft.com/dynamics365/get-started/release-schedule) <br />
[Dynamics 365 and Power Platform Release Plans ](https://docs.microsoft.com/dynamics365/release-plans/) <br />
[Policies and communications ](policies-communications.md)

