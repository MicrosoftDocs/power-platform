---
title: General availability deployment 
description: Learn about general availability deployment.
author: paulda64
ms.subservice: admin
ms.author: paulda 
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/25/2025
search.audienceType: 
  - admin
ms.contributors:
- lekha27
- leicke
- matleon
- swatim
- alvaror
contributors:
- mLeonard-msft
---
# General availability deployment

Each release wave becomes _generally available_ twice a year. Your environments automatically receive these mandatory updates.

To test the upcoming updates, [opt in to early access updates](opt-in-early-access-updates.md).

> [!TIP]
> Check out [Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/) to learn more about new features to be released in the release waves.

Throughout a release cycle, your environments update over the scheduled weekend. These scheduled windows are based on your environments' region. The specific dates when the updates occur are published to the [Message Center](/office365/admin/manage/message-center). The specific time when the updates for an environment complete, within the scheduled weekend, can't be predetermined.

Each notification from the Message Center includes dates, the maintenance window, and the Release Plan reference. In addition, included is a list of optimizations, fixes, and enhancements. Each environment should see the new features and build numbers by Monday morning, local time. For more information, see [Policies and communications](policies-communications.md#scheduled-system-updates-and-maintenance).  

> [!NOTE]
> If you have enabled the early access updates in your environments, you'll continue getting updates throughout the release wave.
>
> If you didn't opt in for the early access updates in your environments, your environment automatically updates to receive the new release based on the general availability deployment schedule for your region.  

## Deployment cadence

A release wave is a mandatory update. Release wave updates can't be postponed. These updates are essential for maintaining system integrity and security.

You receive the release wave as part of your weekly Dataverse update during your scheduled dark hours. This ensures minimal disruption to your operations.

The exact duration and timing of each release wave can't be predetermined. The duration of updates may vary based on the Dataverse update and may occur at any point during your weekend dark hours.

## Deployment schedule  

You receive release wave updates as part of your Dataverse weekly updates. This depends on the region where your environment has been created.

The generally available platform version will be **9.2.25093.0** or higher.

For each region listed, deployment begins as early as the Friday dark hours before the listed date.

Environment database version may not be updated until a few days after the schedule below. 

|Region  | Deployment schedule for 2025 wave 2 general availability |
|---------|---------|
| First release                | September 22, 2025  |
| Canada                       | September 29, 2025  |
| South America                | September 29, 2025  |
| India                        | September 29, 2025  |
| France                       | September 29, 2025  |
| South Africa                 | September 29, 2025  |
| Germany                      | September 29, 2025  |
| Switzerland                  | September 29, 2025  |
| Norway                       | September 29, 2025  |
| Korea                        | September 29, 2025  |
| Singapore                    | September 29, 2025  |
| Sweden                       | September 29, 2025  |
| United Arab Emirates         | September 29, 2025  |
| Japan                        | October 6, 2025  |
| Asia Pacific                 | October 6, 2025  |
| Great Britain                | October 6, 2025  |
| Australia                    | October 6, 2025  |
| GCC High\*                   | October 6, 2025  |
| Europe                       | October 13, 2025  |
| North America                | October 20, 2025  |
| GCC\*                        | October 27, 2025  |
| DoD\*                        | October 27, 2025  |
| China\**                     | October 27, 2025  |

\*For more information about GCC, GCC High, and DoD, see [Dynamics 365 US Government](microsoft-dynamics-365-government.md).
\**For more information about environments in China, see [Power Platform and Dynamics 365 apps operated by 21Vianet in China](about-microsoft-cloud-china.md).

## Early access updates FAQ

For frequency asked questions about early access, see [Early access updates FAQ](opt-in-early-access-updates.md#early-access-updates-faq) 

### See also

[Dynamics 365 release schedule](/dynamics365/get-started/release-schedule) <br />
[Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/) <br />
[Policies and communications](policies-communications.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
