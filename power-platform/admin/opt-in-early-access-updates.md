---
title: Get early access to upcoming updates
description: Learn how to prepare for, turn on, and validate early access updates for Power Platform.
ms.subservice: admin
author: jasongre
ms.author: jasongre
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/20/2026
search.audienceType: 
  - admin
contributors:
  - lavanyapg
ms.contributors:
  - lekha27
  - swatim
  - matleon
  - lsuresh
ms.custom: sfi-image-nochange
---
# Get early access to upcoming updates

Early access gives you more time to validate upcoming features in your applications before the features are generally available through your configured release channel.

The previous Early Access switch was removed before the April 2026 release. Microsoft plans to reintroduce the switch later in 2026, in advance of the next Semi-annual channel release.

## How early access works

Early access is an overlay on the configured release channel. It doesn't change an environment from **Monthly channel** to **Semi-annual channel**, or from **Semi-annual channel** to **Monthly channel**. A release channel controls how often generally available, user-impacting features are enabled for model-driven apps. Early access provides a longer validation period for features targeted to that channel.

When early access is enabled, features are generally available for validation according to the following schedule:

| Configured release channel | Early access validation period |
| --- | --- |
| Monthly channel | Approximately two weeks before channel enablement |
| Semi-annual channel | Approximately seven weeks before channel enablement |

Availability can vary by application, feature, and region.

Keep development, test, and production environments on the same release channel so that validation follows the same feature cadence as production. Don't use the Monthly channel as a substitute for early access validation when production uses the Semi-annual channel.

For more information about release channels, schedules, and configuration, see [Release channel for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview).

## Find upcoming features and timing

Features are added to the [AI at Work Roadmap](https://aka.ms/roadmap) on a rolling basis. Roadmap items should be available two to three months or more before a feature is released and should identify the targeted release channel and planned availability.

Use the roadmap to follow features relevant to your applications and plan your validation. The roadmap provides feature information; it doesn't enroll an environment in early access.

For the Monthly channel's regional rollout sequence and timing, see [Monthly release schedule](/power-apps/maker/model-driven-apps/channel-overview#monthly-release-schedule). For Semi-annual channel deployment dates, see [General availability deployment](general-availability-deployment.md).

## Prepare for early access validation

Before you turn on early access:

- Make sure you have admin access to the Power Platform admin center.
- Review the [AI at Work Roadmap](https://aka.ms/roadmap) and identify the features you need to validate.
- Create a representative nonproduction environment from production for testing.
- Confirm that your development, test, and production environments use the same release channel.
- Plan time to validate key scenarios, customizations, integrations, and internal readiness materials.

If you don't have a sandbox copy of your production environment, you can [copy an environment](copy-environment.md) in the Power Platform admin center.

Creating a sandbox environment requires the appropriate license and available database capacity. For requirements and options, see [Create and manage environments in the Power Platform admin center](create-environment.md).

You might be able to create the copy as an [early release cycle environment](early-release.md), putting it first in line for platform updates. This option is also known as *First Release*, *Station 1*, or *Station FRE*. An early release cycle environment and Early Access serve different purposes: the early release cycle controls when platform updates are deployed, while Early Access provides advance access to features targeted to the environment's configured release channel.

## Turn on early access updates

The Early Access switch in the Power Platform admin center is being reintroduced. This article will be updated with the opt-in steps when the switch is available.

When the switch is available, turn on early access in a representative nonproduction environment. Don't change the environment's release channel solely to validate upcoming features.

## Validate the updates

After you turn on early access, verify that:

- Key scenarios work as expected.
- Customizations and integrations continue to work with the upcoming features.
- Internal readiness materials, such as training and communications, reflect new features or user experiences.
- You investigate and report any issues found during validation.

If you find a regression or a functional or performance problem, contact [Support](get-help-support.md) or get help from the [Dynamics 365 community forums](https://community.dynamics.com/forums/).

## Related content

- [Release channel for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview)
- [Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule)
- [AI at Work Roadmap](https://aka.ms/roadmap)
- [Policies and communications](policies-communications.md)
