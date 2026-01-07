---
title: General availability deployment 
description: Learn about general availability deployment.
author: paulda64
ms.subservice: admin
ms.author: paulda 
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: concept-article
ms.date: 01/07/2026
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

The generally available platform version is based on your environment's database version.  These are the versions associated for each release:

| Release | Database version |
|---------|---------|
| April wave 1  | 9.2.26033.0 |
| October wave 2 | 9.2.26093.0 |

## Deployment schedule  

> [!Important]
> A release wave is a mandatory update and can't be postponed. These updates are essential for maintaining system integrity and security.

For each region listed, deployment begins as early as the Friday dark hours before the listed date.

Environment database version may not be updated until a few days after the schedule below.

|Region  | 2026 wave 1 general availability | 2026 wave 2 general availability |
|---------|---------|---------|
| First release                | March 23, 2026 | September 21, 2026  |
| Canada                       | March 30, 2026 | September 28, 2026  |
| France                       | March 30, 2026 | September 28, 2026  |
| Germany                      | March 30, 2026 | September 28, 2026  |
| India                        | March 30, 2026 | September 28, 2026  |
| Italy                        | March 30, 2026 | September 28, 2026  |
| Korea                        | March 30, 2026 | September 28, 2026  |
| Norway                       | March 30, 2026 | September 28, 2026  |
| Poland                       | March 30, 2026 | September 28, 2026  |
| South Africa                 | March 30, 2026 | September 28, 2026  |
| South America                | March 30, 2026 | September 28, 2026  |
| Sweden                       | March 30, 2026 | September 28, 2026  |
| Switzerland                  | March 30, 2026 | September 28, 2026  |
| United Arab Emirates         | March 30, 2026 | September 28, 2026  |
| Asia Pacific                 | April 6, 2026 | October 5, 2026  |
| Australia                    | April 6, 2026 | October 5, 2026  |
| GCC High\*                   | April 6, 2026 | October 5, 2026  |
| United Kingdom               | April 6, 2026 | October 5, 2026  |
| Japan                        | April 6, 2026 | October 5, 2026  |
| Singapore                    | April 6, 2026 | October 5, 2026  |
| Europe                       | April 13, 2026 | October 12, 2026  |
| North America                | April 20, 2026 | October 19, 2026  |
| China\**                     | April 27, 2026 | October 26, 2026  |
| DoD\*                        | April 27, 2026 | October 26, 2026  |
| GCC\*                        | April 27, 2026 | October 26, 2026  |

\*For more information about GCC, GCC High, and DoD, go to [Dynamics 365 US Government](microsoft-dynamics-365-government.md).
\**For more information about environments in China, go to [Power Platform and Dynamics 365 apps operated by 21Vianet in China](about-microsoft-cloud-china.md).

## Early access updates FAQ

For frequency asked questions about early access, see [Early access updates FAQ](opt-in-early-access-updates.md#early-access-updates-faq) 

### Related content
[Dynamics 365 release schedule](/dynamics365/get-started/release-schedule) <br />
[Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/) <br />
[Policies and communications](policies-communications.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
