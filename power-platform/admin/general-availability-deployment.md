---
title: "General availability deployment  | MicrosoftDocs"
description: About general availability deployment
author: samathur
ms.subservice: admin
ms.author: samathur 
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/09/2023
search.audienceType: 
  - admin
ms.contributors:
- matleon
---
# General availability deployment

After a release cycle has been made "generally available" to users, environments are typically automatically turned on. This is so users can receive ongoing mandatory updates. These updates enable early access features, and the current available features that are included in a release.  

> [!TIP]
> Check out [Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/) to learn more about new features to be released in the release waves.

Throughout a release cycle, your environments are updated during one of the weekend [maintenance windows](policies-communications.md#maintenance-timeline). These windows are based on your environments' region. The specific dates when the updates occur are published to the [Message Center](/office365/admin/manage/message-center).

Each notification from the Message Center includes dates, the maintenance window, and the Release Plan reference. In addition, included is a list of optimizations, fixes, and enhancements. Each environment should see the new features and build numbers by Monday morning, local time. See [Policies and communications](policies-communications.md#scheduled-system-updates-and-maintenance).  

> [!NOTE]
> If you have enabled the early access updates in your environments, you'll continue getting updates throughout the release wave.
>
>If you did not opt in for the early access updates in your environments, your environment will be automatically updated to receive the new release based on the general availability deployment schedule for your region.  

## Deployment schedule  

The general availability deployment is based on the regions where environments are created.

|Regions  |Schedule for 2023 wave 1 general availability deployment|
|---------|---------|
| Canada<br />South America<br />India<br />France<br />South Africa <br />Germany<br />Switzerland<br />Norway<br />Korea<br>Singapore  | Friday, September 29, 2023 to Monday, October 2, 2023 |
|United Arab Emirates<br /> Japan <br /> Great Britain<br />Japan<br />Asia Pacific<br />Great Britain<br>Australia<br>GCC High     | Friday, October 6, 2023 to Monday, October 9, 2023   |
|Europe    | Friday, October 13, 2023 to Monday, October 16, 2023      |
|North America     |  Friday, October 20, 2023 to Monday, October 23, 2023            |
|GCC<br>DoD | Friday, October 27, 2023 to Monday, October 30, 2023  |
|Mooncake | Friday, October 27, 2023 to Monday, October 30, 2023  <br />See [Dynamics 365 US Government](microsoft-dynamics-365-government.md). |

### See also

[Dynamics 365 release schedule](/dynamics365/get-started/release-schedule) <br />
[Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/) <br />
[Policies and communications](policies-communications.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
