---
title: Opt in to early access updates 
description: Learn how to opt in to early access updates for Power Platform.
author: paulda64
ms.subservice: admin
ms.author: paulda
ms.reviewer: sericks
ms.topic: how-to
ms.date: 02/03/2026
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

The Microsoft Power Platform and customer engagement apps teams deliver two [major releases](policies-communications.md#major-release-events) per year (April and October) that offer new capabilities and functionality. Each major release includes features that might affect the user experience. The schedule is application-specific. Check the [Release Plans](/dynamics365/release-plans/) to view the feature release schedule for the applications you use.

| Wave release | Early access typical range |
|---|---|
| Wave 1 | February through April |
| Wave 2 | August through October |

> [!NOTE]
> The legacy opt-in options (**Manage** and **Update Now**) are removed. To opt in to early access features, use the monthly or semi-annual release channel.

## How to get early access updates

### Before you begin
- Have admin access to the Power Platform admin center.
- Check the [Release Plans](/dynamics365/release-plans/) to see when features for your applications are scheduled for release. 
- **Recommended**: Create a sandbox environment from production for testing.

> [!NOTE]
> If you don't have a sandbox copy of your production environment, you can [create a copy](copy-environment.md) in the Power Platform admin center.
>
> You might be able to create the copy as an [early release cycle environment](early-release.md), putting it first in line for new rollouts. This option is also known as _First Release_, _Station 1_, or _Station FRE_.

### Use a release channel
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select the environment you want to update.
1. Select **Settings**.
1. On the **Settings** page, select **Product** > **Behavior**.
1. Set the **Release channel** option to **Monthly channel** or **Semi-annual channel**.
1. Select **Save**. Changes are applied immediately.

### Validation steps
Check the following items:
- Key scenarios work as expected in the environment.
- Customizations in your applications, if any, are updated to respond to the new capabilities.
- Internal readiness materials, such as training and communications, for your organization are updated based on new features or user experiences.
- If you find any problems during validation, such as regressions or functional or performance problems, contact [Support](get-help-support.md) or get help from [Dynamics 365 forum](https://community.dynamics.com/f).

## Benefits of using release channels vs. legacy opt-in options
When you save the **Release channel** setting (as described in [Use a release channel](#use-a-release-channel)), your environment immediately starts to behave according to the setting you chose. You don't need to deploy the application to get the features. You can switch between the **Monthly channel** and **Semi-annual channel**. These settings persist for your environment and you don't need to update them every release wave.
 
> [!NOTE]
> Adjust your environment's release channel only for preview features. However, you can change release channels for applications, solutions, or users. For more information about advanced options, see [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).

## Release channels comparison
You can choose to receive features on a monthly basis or a semi-annual basis.

- **Monthly channel** features become visible every month. For more information, see [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).
- **Semi-annual channel** features become visible at [general availability deployment](general-availability-deployment.md#deployment-schedule) in April and October.

| Capability |  Monthly channel | Semi-annual channel|
|-|-|-|
|New feature delivery | Monthly | General availability in April or October |
|Preview feature update frequency | Weekly | No preview features |
|Best for| Dev/Test enviroments|Production environments|

For more information about release channels, see [Release channels for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview).

## Frequently asked questions (FAQ)

This section provides answers to frequently asked questions about early access updates and release channels.

### Release channel settings and configuration

#### Can I switch between release channels?

Yes. You can switch between the **Monthly channel** and **Semi-annual channel** at any time. The change takes effect when you save, and no deployments are needed.

#### Does an environment that previously opted in for early access updates automatically get the early access update of new releases?

Yes. The **Monthly channel** release channel setting persists for your environment until you change it.

#### What is the "Auto" channel option and why does it exist?

In October 2024, before cutting over to **Monthly channel**, Microsoft set **Auto** to **Semi-annual channel**. Auto might be used differently in the future as a placeholder. Check the comments on **Auto** for each channel in [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).

#### How does the org-level setting interact with app-level settings?

Lower-level values can override the organization setting. For documentation on the ordering and hierarchy, see [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).

### Deployment timing and schedules

#### When are updates available for testing in the sandbox environment?

Monthly channel releases occur every month. New features can start previewing as soon as the following month after April or October wave releases.

|Release wave |Typical early access starts|Full range | Build range |
|---|--|--|---|
|April wave|Mid February| November - April| 9.2.25094 - 9.2.26033|
|October wave|Mid August| May - October| 9.2.26034 - 9.2.26093|

#### How can customers know when monthly releases are deployed?

Release plans show approximate deployment schedules. Deployments happen every weekend. The monthly release is a feature flag that's switched on for a region (station), not an actual deployment. Customers should continue using the version history resources they've been using to track updates and timings.

#### When are features available for testing before general availability?

Applications ship approximately six weeks ahead of the **Monthly channel** or **Semi-annual channel** enablement date. Around mid-February and mid-August, all apps have features available in all stations. This timing allows for thorough testing:

- Customers in the North America station have about eight weeks of testing duration.
- Environments in Station 1 (early release cycle) can test monthly features for five weeks before reaching Station 2, and eight weeks before reaching Station 5.
- Testing within the same station provides a four week preview between feature availability to feature enablement.

For more information, see [monthly-release-schedule](/power-apps/maker/model-driven-apps/channel-overview#monthly-release-schedule).

#### What happens to environments after a release wave becomes generally available?

**Monthly channel** environments continue to receive updates and have monthly features enabled.

**Semi-annual channel** environments automatically enable new features based on the regional location of your environment. For more information, see [General availability deployment](general-availability-deployment.md).

Throughout a release wave, all environments are updated during one of the [maintenance windows](policies-communications.md#maintenance-timeline) over a weekend based on your environment's region. 

### Controlling production environment updates

#### How can customers minimize changes in production while still controlling when features are deployed?

April and October general availability features are no longer _deployed_. To control when features appear in production:

1. Switch from the **Semi-annual channel** to the **Monthly channel** at the environment level, which is equivalent to the early opt-in approach.
1. After confirming the build number is YY033 (April) or YY093 (October), switch back to the **Semi-annual channel**.

Previously, we recommended opting in production environments at least one week before the general availability date. Release channels provide the same control through channel switching.

#### Are customers locked into regional deployment dates?

No. Customers can control feature visibility by switching between the **Monthly channel** and the **Semi-annual channel**. However, platform deployments occur on the standard schedule. General availability dates follow the schedule: Wave 1 (April) uses build 9.2.26033.* and Wave 2 (October) uses build 9.2.26093.*.

### Version numbers and compatibility

#### Does the environment database version number change between the Monthly and Semi-Annual channels?

No, the version number doesn't change. The setting only determines application feature visibility. The platform and application versions are the same across channels. 

#### Do different channel settings cause issues with solution imports?

No. Environments in the same station should have very similar build numbers for the organization and installed applications. **Monthly channel** vs. **Semi-annual channel** doesn't change versions. It only controls feature visibility. This difference shouldn't cause problems when importing solutions between environments with different channel settings.

### Application lifecycle management (ALM) and environment strategies

#### Does the release channel impact ALM processes?

Choose the release channel that fits your requirements. Decide if you want small changes throughout the year or two larger changes. Some organizations use **Monthly channel** in dev/test environments and **Semi-annual channel** in production environments. For guidance on choosing the appropriate strategy, see [Release channel for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview).

#### Does Microsoft provide a free sandbox environment for testing updates?

No. You're responsible for creating a sandbox environment from a copy of the production environment for testing and validation, at your own cost.

### Channel behavior and feature visibility

#### Does the Semi-annual channel mean no preview features?

Yes, that's correct. Environments using **Semi-annual channel** don't see preview features until they become generally available in April or October.

#### If I switch from Monthly channel to Semi-annual channel, do features roll back?

Yes. Switching from **Semi-annual channel** reverts visibility of features that have general availability tied to the release wave. Many smaller features that are part of monthly releases go to general availability independently of release wave and remain visible.

#### How does the rollback feature work?

Rollback is controlled through Feature Control Bits (FCBs) in the Unified Client Interface (UCI) in combination with org, app, solution, user, and browser settings. For more information, see [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).  Application deployments are no longer needed to switch between preview or general availability features.

### Documentation and communication

#### Is there monthly documentation listing new and updated features?

Yes. Release plans are updated weekly as feature information becomes available: [Release plans for Dynamics 365, Power Platform, Cloud for Industry, and Copilot](/dynamics365/release-plans/).

#### Does release documentation specify when features are available in Monthly vs. Semi-Annual channels?

Yes. Each release plan has a "What's new and planned" section with preview and general availability dates. Each release manager enters these dates. 

#### Are release notes still published as a single block twice a year?

No. Release notes now use a new system with a weekly publish cadence. The initial Wave 1 2026 plan was published on March 18, 2026, with weekly updates after that.

### Product coverage and availability

#### Does the release channel apply to Contact Center and Copilot Studio?

The release channel (Monthly/Semi-Annual) primarily applies to model-driven apps.  There's no change for Contact Center or Copilot Studio.

#### When will release channels be available in GCC, GCC High, and DoD?

The rollout follows the [general availability deployment](general-availability-deployment.md) schedule for these stations.

### Support and problems

#### Can I skip or postpone an update?

No. Deployments happen every week. The release channel isn't for deployment, but a feature flag that turns on or off depending on your channel setting. To ensure you get the best quality of new features and capabilities, all customers must update to the latest release as scheduled.

#### How do I report problems with updates?

Create a [support ticket](https://dynamics.microsoft.com/support/). Include the name of the application to help route your problem.

## Related content

[Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule)<br />
[Dynamics 365 and Microsoft Power Platform Release Plans](/dynamics365/release-plans/)<br />
[Policies and communications](policies-communications.md)
  
[!INCLUDE[footer-include](../includes/footer-banner.md)]
