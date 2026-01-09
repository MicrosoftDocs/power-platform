---
title: Opt in to early access updates 
description: Leaern how to opt in to early access updates for Power Platform.
author: paulda64
ms.subservice: admin
ms.author: paulda
ms.reviewer: sericks
ms.topic: how-to
ms.date: 01/09/2026
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
# Opt in to early access updates

Microsoft Power Platform and customer engagement apps teams deliver two [major releases](policies-communications.md#major-release-events) per year (April and October) that offer new capabilities and functionality. Each major release includes features that may affect the user experience. The schedule is application-specific. Check the [Release Plans](/dynamics365/release-plans/) to view the feature release schedule for the applications you use.

| Wave release | Early access typical range |
|---|---|
| Wave 1 | February through May |
| Wave 2 | July through September |

## Changes to early access for 2026

Early access opt-in moved to [Release channels for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview).

You have the choice to receive features on a monthly basis, or a semi-annual basis.
- **Monthly** is the equivalent of opt-in.
- **Semi-Annual** is the equivalent of receiving app changes in April and October.

These settings are persisted for your environment and no longer have to be updated every release wave. The legacy opt-in (**Manage** and **Update Now**) options are removed.
 
For more information, see [Release Channel overview](/power-apps/maker/model-driven-apps/channel-overview) and [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).

## How to get early access updates

1. Set your environment's channel to **Monthly**.  see the [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change) article.
2. Check the [Release Plans](/dynamics365/release-plans/) to see when features for your applications are scheduled for release. 

## Schedule  

- **Deployments** occur every week to update all environments platforms and applications.
- **Feature visibility** occurs on Monthly or Semi-Annually.
  - **Monthly** release channel means your environment gets new features as soon as they're made available by the application teams.
  - **Semi-Annual** channel dates are listed in [General availability deployment](general-availability-deployment.md#deployment-schedule).

> [!NOTE]
> To learn more about release schedule, see [release schedule and early access](/dynamics365/get-started/release-schedule).

## Prepare for a release wave

The following checklist provides the general guidelines to help you prepare for a release wave.  These steps are not required, only optional.

1. Review the [release plans](/dynamics365/release-plans/).

2. Create a sandbox environment from the production environment.

> [!NOTE]
> If you don't have a sandbox copy of your production environment, you can [create a copy](copy-environment.md) in the Power Platform admin center.
> You may be able to create the copy as an [Early Release environment](early-release.md), putting it first in line for new rollouts.
> This is also known as _First Release_, _Station 1_ or _Station FRE_.

3. Set the Release Channel to **Monthly**. [How to set channel](/power-apps/maker/model-driven-apps/channel-change)

4. Validate that key scenarios work as expected in the sandbox environment after the update is completed.
   - Update the customizations in your applications, if any, to respond to the new capabilities as needed.
   - You might also need to update internal readiness materials (training and communications) for your organization based on new features or user experiences.
   - If you find any issues during the validation&mdash;such as regressions, or functional or performance issues&mdash;contact [Support](https://dynamics.microsoft.com/support/) or get help from [Dynamics 365 forum](https://community.dynamics.com/f).

## Early access updates FAQ

### Does an environment, that previously opted in for the early access updates, automatically get the early access update of the new releases?

Yes.  "Monthly" release channel setting is persisted for your environment until you change it.

### Does the environment database version number get updated if I choose "Monthly" vs. "Semi-Annual"?

No, the version number isn't going to change. The setting only determines application feature visibility. The platform and application versions are the same between across channels.

### Does Microsoft provide a free sandbox environment at no charge for testing updates?

No. You're responsible for creating a sandbox environment from a copy of the production environment for testing and validation, at your own cost.

### When are the updates available for testing in the sandbox environment?

See [Early access availability](#early-access-availability).

### How do I report issues with updates?

Create a [support ticket](https://dynamics.microsoft.com/support/). Include the name of the application to help route your issue.

### Can I skip or postpone an update?

No. Deployments happen every week. The release channel isn't a deployment, but a feature flag that turns on/off depending on your channel setting. To ensure you get the best quality of the new features and capabilities, all customers are required to update to the latest release as scheduled.

### What happens to the environments after a release wave becomes generally available?

**Monthly** channel environments continue to receive updates and have monthly features enabled.
  
**Semi-Annual** channel environments automatically are enabled to view the new features. It's based on regional location of your environment. See [General availability deployment](./general-availability-deployment.md) for more information.
  
Throughout a release wave, *ALL* environments are updated during one of the [maintenance windows](policies-communications.md#maintenance-timeline) over a weekend based on your environments' region. The specific dates when the updates occur are published to the [Message Center](/office365/admin/manage/message-center?view=o365-worldwide&preserve-view=true).
  
See [Policies and communications](policies-communications.md#scheduled-system-updates-and-maintenance).

### Related content

[Dynamics 365 release schedule and early access ](/dynamics365/get-started/release-schedule)<br />
[Dynamics 365 and Microsoft Power Platform Release Plans ](/dynamics365/release-plans/)<br />
[Policies and communications](policies-communications.md)
  
[!INCLUDE[footer-include](../includes/footer-banner.md)]
