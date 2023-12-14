---
title: "General availability deployment  | MicrosoftDocs"
description: About general availability deployment
author: samathur
ms.subservice: admin
ms.author: samathur 
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/14/2023
search.audienceType: 
  - admin
ms.contributors:
- matleon
- swatim
- alvaror
---
# General availability deployment

Each release wave will become _generally available_ twice a year. Your environments will automatically receive these mandatory updates.
- You may test the upcoming updates during [Early Access optional enrollment](/power-platform/admin/opt-in-early-access-updates)

> [!TIP]
> Check out [Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/) to learn more about new features to be released in the release waves.

Throughout a release cycle, your environments are updated over the scheduled weekend. These scheduled windows are based on your environments' region. The specific dates when the updates occur are published to the [Message Center](/office365/admin/manage/message-center). The specific time when the updates for an environment complete, within the scheduled weekend, can't be predetermined.

Each notification from the Message Center includes dates, the maintenance window, and the Release Plan reference. In addition, included is a list of optimizations, fixes, and enhancements. Each environment should see the new features and build numbers by Monday morning, local time. For more information, see [Policies and communications](policies-communications.md#scheduled-system-updates-and-maintenance).  

> [!NOTE]
> If you have enabled the early access updates in your environments, you'll continue getting updates throughout the release wave.
>
> If you didn't opt in for the early access updates in your environments, your environment will be automatically updated to receive the new release based on the general availability deployment schedule for your region.  

## Deployment Cadence

A release wave is a mandatory update. Release wave updates cannot be postponed. These updates are essential for maintaining system integrity and security.

You will receive the release wave as part of your weekly Dataverse update during your scheduled dark hours. This ensures minimal disruption to your operations.

The exact duration and timing of each release wave cannot be predetermined. The duration of updates may vary based on the Dataverse update and may occur at any point during your weekend dark hours. This process has been optimized to minimize any inconvenience.

## Deployment schedule  

You will receive release wave updates as part of your Dataverse weekly updates. This depends on the region where your environment has been created.

The general availability deployment is based on the regions where environments are created.
- For each region listed below, deployment will begin as early as the Friday dark hours before the listed date

|Region  | Schedule for 2024 wave 1 general availability |
|---------|---------|
| First Release | March 25, 2024 |
| Canada        | April 1, 2024 |
| South America | April 1, 2024  |
| India         | April 1, 2024  |
| France        | April 1, 2024  |
| South Africa  | April 1, 2024  |
| Germany       | April 1, 2024  |
| Switzerland   | April 1, 2024  |
| Norway        | April 1, 2024  |
| Korea         | April 1, 2024  |
| Singapore     | April 1, 2024  |
| United Arab Emirates | April 8, 2024 |
| Japan                | April 8, 2024 |
| Asia Pacific         | April 8, 2024 |
| Great Britain        | April 8, 2024 |
| Australia            | April 8, 2024 |
| GCC High\*           | April 8, 2024 |
| Europe | April 15, 2024 |
| North America | April 22, 2024 |
| Dedicated Scale Groups (SPL)| April 29, 2024 |
| GCC\* | April 29, 2024 |
| DoD\* | April 29, 2024 |
| China\* | April 29, 2024 |
| GCC\* | April 29, 2024 |

\*For more information about GCC, GCC High, and DoD, see [Dynamics 365 US Government](microsoft-dynamics-365-government.md).

## Release wave FAQ

For frequency asked questions, please refer to [Release wave FAQ](/power-platform/admin/opt-in-early-access-updates#early-access-updates-faq) 

### See also

[Dynamics 365 release schedule](/dynamics365/get-started/release-schedule) <br />
[Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/) <br />
[Policies and communications](policies-communications.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
