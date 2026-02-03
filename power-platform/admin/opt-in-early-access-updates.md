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
> The legacy opt-in options (**Manage** and **Update Now**) are removed. To opt-in to early access features, you now have to use the monthly or semi-annual release channel.

## How to get early access updates

### Before you begin
- Have admin access to the Power Platform admin center.
- Check the [Release Plans](/dynamics365/release-plans/) to see when features for your applications are scheduled for release. 
- **Recommended**: Create a sandbox environment from production for testing.

> [!NOTE]
> If you don't have a sandbox copy of your production environment, you can [create a copy](copy-environment.md) in the Power Platform admin center.
>
> You might be able to create the copy as an [early release cycle environment](early-release.md), putting it first in line for new rollouts. This option is also known as _First Release_, _Station 1_, or _Station FRE_.

### Use the monthy release channel
1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Manage**.
3. In the **Manage** pane, select **Environments**.
4. On the **Environments** page, select the environment you want to update.
5. Select **Settings**.
6. On the **Settings** page, select **Product** > **Behavior**.
7. Set the **Release channel** option to **Monthly channel**.
8. Select **Save**. Changes are applied immediately.

### Validation steps
We recommend that you check:
- Key scenarios work as expected in the environment.
- Update the customizations in your applications, if any, to respond to the new capabilities, as needed.
- Update internal readiness materials, such as training and communications, for your organization based on new features or user experiences.
- If you find any problems during validation, such as regressions or functional or performance problems, contact [Support](get-help-support.md) or get help from [Dynamics 365 forum](https://community.dynamics.com/f).

## Benefits of using release channels vs. legacy opt-in options
Once the **Release channel** setting is saved (as you did in #use-the-monthy-release-channel), your environment immediately behaves according to the setting chosen. Application deployment is no longer required to get the features. You can switch between the **Monthly channel** and **Semi-annual channel**. These settings persist for your environment and you no longer need to update them every release wave.
 
> [!NOTE]
> We recommend only adjusting your environment's release channel for preview features. However, you may change release channels for applications, solutions, or users. For more information about advanced options, see [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).

## Release channels comparison
You can choose to receive features on a monthly basis or a semi-annual basis.
- **Monthly channel** features become visible every month. Learn more in [How to set channel](/power-apps/maker/model-driven-apps/channel-change).
- **Semi-annual channel** features become visible at [general availability deployment](general-availability-deployment.md#deployment-schedule) in April and October.

| Capability |  Monthly channel | Semi-annual channel|
|-|-|-|
|New feature delivery | Monthly | General availability in April or October |
|Preview feature update frequency | Weekly | No preview features |
|Risk level | Higher  | Lower |
|Best for| Dev/Test enviroments|Production environments|

Learn more about release channels in [Release channels for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview).

## Frequently asked questions (FAQ)

This section provides answers to frequently asked questions about early access updates and release channels.

### Release channel settings and configuration

#### Can I switch between release channels?

Yes. You can switch between the **Monthly channel** and **Semi-annual channel** at any time. Changes are applied when you save, with no deployments needed.

#### Does an environment that previously opted in for early access updates automatically get the early access update of new releases?

Yes. The **Monthly channel** release channel setting persists for your environment until you change it.

#### What is the "Auto" channel option and why does it exist?

**Auto** was set to **Semi-annual channel** in October 2024, before cutting over to **Monthly channel**. Auto may be used differently in the future as a placeholder. Check the comments on **Auto** for each channel in [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).

#### How does the org-level setting interact with app-level settings?

The organization setting can be overridden by lower-level values. For official documentation on the ordering and hierarchy, see [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change).

#### Is there a plan to simplify the granular channel controls?

There are no current plans to simplify the controls. While granular controls are helpful, they can introduce inconsistencies. 

### Deployment timing and schedules

#### When are updates available for testing in the sandbox environment?

Monthly channel releases occur every month. New features can start preview as soon as the following month after April/October wave releases.

|Release wave |Typical early access starts|Full range | Build range |
|---|--|--|---|
|April Wave|Mid February| November - April| 9.2.25093 - 9.2.26033|
|October Wave|Mid August| May - October| 9.2.26033 - 9.2.26093|

#### How can customers know when monthly releases are deployed?

Release plans show approximate deployment schedules. Deployments happen every weekend. The monthly release is a feature flag being switched on for a region (station), not an actual deployment. Customers should continue using the version history resources they've been using to track updates and timings.

#### When are features available for testing before general availability?

Applications are shipped approximately 6 weeks ahead of the Monthly/Semi-Annual enablement date. Around mid-February and mid-August, all apps should have features available in all stations. This timing allows for thorough testing:
- Customers in NAM station have about 8 weeks of testing duration.
- Environments in Station 1 (early release cycle) can test monthly features for 5 weeks before reaching Station 2, and 8 weeks before reaching Station 5.
- Testing within the same station provides a 4-week preview between feature availability to feature enablement.

For more information, check [monthly-release-schedule](/power-apps/maker/model-driven-apps/channel-overview#monthly-release-schedule).

#### What happens to environments after a release wave becomes generally available?

**Monthly channel** environments continue to receive updates and have monthly features enabled.

**Semi-annual channel** environments are automatically enabled to view new features based on the regional location of your environment. See [General availability deployment](general-availability-deployment.md) for more information.

Throughout a release wave, all environments are updated during one of the [maintenance windows](policies-communications.md#maintenance-timeline) over a weekend based on your environment's region. 

### Controlling production environment updates

#### How can customers minimize changes in production while still controlling when features are deployed?

Features are no longer 'deployed' for April and October GA. To control when features appear in production:
1. Switch from "Semi-Annual" to "Monthly" at the environment level (equivalent to the early opt-in approach)
2. After confirming the build number is YY033 (April) or YY093 (October), switch back to "Semi-Annual"

Previously, we recommended opting in production environments at least 1 week before the GA date. Release channels provide the same control through channel switching.

#### Are customers locked into regional deployment dates?

No. Customers can control feature visibility by switching between Monthly and Semi-Annual channels. However, platform deployments occur on the standard schedule. General availability dates follow the schedule: Wave 1 (April) uses build 9.2.26033.* and Wave 2 (October) uses build 9.2.26093.*.

### Version numbers and compatibility

#### Does the environment database version number change between Monthly and Semi-Annual channels?

No, the version number doesn't change. The setting only determines application feature visibility. The platform and application versions are the same across channels. 

#### Will different channel settings cause issues with solution imports?

No. Environments in the same station should have very similar build numbers for the organization and installed applications. Monthly vs. Semi-Annual doesn't change versions.  It only controls feature visibility. This shouldn't cause issues when importing solutions between environments with different channel settings.

### ALM and environment strategies

#### Does the release channel impact ALM processes?

The choice is left to the customer depending on their requirements—whether they want small changes throughout the year or two larger changes. Some organizations use Monthly channel in dev/test and Semi-Annual in production. Review [Release channel for your model-driven app](/power-apps/maker/model-driven-apps/channel-overview) for guidance on choosing the appropriate strategy.

#### Does Microsoft provide a free sandbox environment for testing updates?

No. You're responsible for creating a sandbox environment from a copy of the production environment for testing and validation, at your own cost.

### Channel behavior and feature visibility

#### Does Semi-Annual channel mean no preview features?

Yes, that's correct. Semi-Annual channel environments don't see preview features until they become generally available in April or October.

#### If I switch from Monthly to Semi-Annual, will features roll back?

Yes. Switching to Semi-Annual will revert visibility of features that have a GA tied to the release wave. Many smaller features that are part of monthly releases go GA independently of release wave GA and remain visible.

#### How does the rollback feature work?

Rollback is controlled through Feature Control Bits (FCBs) in the Unified Client Interface (UCI) in combination with org, app, solution, user, and browser settings. See [Changing release channels for model-driven apps](/power-apps/maker/model-driven-apps/channel-change) for more information.  Application deployments are no longer needed to switch between Preview or General Availability features.

### Documentation and communication

#### Will there be monthly documentation listing new and updated features?

Yes. Release plans are updated weekly as feature information becomes available: [Release plans for Dynamics 365, Power Platform, Cloud for Industry, and Copilot](/dynamics365/release-plans/).

#### Will release documentation specify when features are available in Monthly vs. Semi-Annual channels?

Yes. Each release plan under Sales, Service, ERP, Cloud for Industry, and Customer Engagement has a "What's new and planned" section with preview and GA dates. These dates are entered by each release manager. 

#### Are release notes still published as a single block twice a year?

No. Release notes have moved to a new system with a weekly publish cadence. The initial Wave 1 2026 plan was published on March 18, 2026, with weekly updates after that.

### Product coverage and availability

#### Does the release channel apply to Contact Center and Copilot Studio?

The release channel (Monthly/Semi-Annual) primarily applies to model-driven apps.  There's no change for Contact Center or Copilot Studio.

#### When will release channels be available in GCC/GCC High/DoD?

The rollout follows the [general availability deployment](https://learn.microsoft.com/power-platform/admin/general-availability-deployment) schedule for these stations.

### Support and issues

#### Can I skip or postpone an update?

No. Deployments happen every week. The release channel isn't a deployment but a feature flag that turns on or off depending on your channel setting. To ensure you get the best quality of new features and capabilities, all customers are required to update to the latest release as scheduled.

#### How do I report issues with updates?

Create a [support ticket](https://dynamics.microsoft.com/support/). Include the name of the application to help route your issue.

## Related content

[Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule)<br />
[Dynamics 365 and Microsoft Power Platform Release Plans ](/dynamics365/release-plans/)<br />
[Policies and communications](policies-communications.md)
  
[!INCLUDE[footer-include](../includes/footer-banner.md)]
