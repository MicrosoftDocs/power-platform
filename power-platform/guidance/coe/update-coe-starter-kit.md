---
title: "Updating the Center of Excellence (CoE) Starter Kit"
description: "The CoE Starter Kit is updated each month. Learn best practices for managing the update process in your organization"
author: stjeffer
manager: phtopnes

ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/05/2022
ms.subservice: guidance
ms.author: stjeffer
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Updating the Center of Excellence (CoE) Starter Kit

This document provides you with a set of best practices and recommendations for updating the CoE Starter Kit.

The CoE Starter Kit provides inspiration and a starting point for Power Platform governance. If you're new to the CoE Starter Kit, below are some useful links to help you get started:

- [The CoE Starter Kit](power-platform/guidance/coe/starter-kit)
- [Setting up the CoE Starter Kit](/power-platform/guidance/coe/setup)
- [Installing CoE upgrades](power-platform/guidance/coe/after-setup)
- [Extending CoE components](power-platform/guidance/coe/extending-components)

## The update and release process

The team behind the CoE Starter Kit releases a new version during the first week of each month.  This release cadence is important for you to know for you to review, organize, plan and test the latest version.

The team announces updates (bug fixes, enhancements, new features, deprecations and removals) over different channels, listed below:

- GitHub release notes
- Office hours community call

The following sections provide useful guidance and best practices for tracking release information for each channel.

### GitHub release notes

With each release of the CoE Starter Kit, is an accompanying set of release notes. Release notes should be reviewed prior to installing the updated version in your organization.

#### Viewing release notes

You can view the details of each release by following the steps described below:

1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit) in GitHub.
1. On the right side of the screen, is [a link to the latest release](https://github.com/microsoft/coe-starter-kit/releases) notes.
1. The release notes screen provides links to issues and new features along with links to set up instructions and the change log.

The change log lists all bugs, features and updates in the release. Selecting an issue takes you to the item to review comments and progress updates relating to the item.

#### Notifications

You can create GitHub notifications to be proactively notified when updates and changes occur. The steps below describe how to create custom notification for new/ updates to issues and releases.

1. Sign-in to your GitHub account, or sign up.
1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit)
1. Select the button labeled 'Watch' (or possibly labeled 'Unwatch' if you have already set up notifications)
[Select 'Watch](media/coe-starter-kit-releases-link.png "Selecting Watch option")

1. Either select an existing notification option, or select the option labeled 'Custom'.
1. In the example below, a custom notification has been created to send alerts for new/ updated issues, releases and security alerts.

![Screenshot of GitHub notification creation](media/coe-starter-kit-notifications.png)

### Office hours community call

The CoE Starter Kit team runs a monthly community call that dives a little deeper into new features and bug fixes.  This call is useful to attend; you can [register for the Office hours call here](https://aka.ms/coeofficehours).

### How often should you update the CoE Starter Kit?

Here are a few things to consider when deciding on your update frequency:

- Does the new release **fix an issue** that you currently have?
- Does the new release **contain a new feature** that you would like to try out?
- By **not** updating to the new release mean your current version is older than three months?

Before a release, the CoE Starter Kit team evaluates any bug fixes or new features against the previous three released versions to ensure that updates don't affect earlier versions of the Starter Kit.  Unfortunately, it means that leaving updates longer than three months could result in unexpected issues when updating.  Useful guidance for installing updates to the CoE Starter Kit [can be found here](power-platform/guidance/coe/after-setup).

>[!NOTE]
>Try to evaluate releases monthly. Try to maintain parity between your testing/ production versions of the CoE Starter Kit and the current release, or within the past three versions.

## Testing updates

As with any update: testing increases the likelihood of success when installing an update to your production version of the CoE.
Ideally, you have a test version of the CoE Starter Kit to deploy to.

### If you have made customizations

If you're installing an update and you have made customizations to the CoE Starter Kit; refer to the following articles for best practices and advice:

- [Extending CoE components](power-platform/guidance/coe/extending-components)
- [Installing CoE upgrades](power-platform/guidance/coe/after-setup)

### If you have not made customizations

If you have not made customizations to the CoE Starter

### If you have an issue

If you find a bug or an issue when testing you can [raise a bug here](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cbug&template=1-coe-starter-kit-bug.yml&title=%5BCoE+Starter+Kit+-+BUG%5D+ISSUE+TITLE) ensuring to provide the [solution operation error](powerapps/maker/data-platform/solution-history#view-solution-operation-error-details) details.

## Customizing the CoE Starter Kit

The CoE Starter Kit is a great starting point for many customers.  However, it's likely that you'll need to make customizations. The following article provides you with a set of best practices for extending/ creating customizations.

## Summary and useful links

Below is a table containing summary links for this document:

| Guidance | Link or advice |
|-----------------|------|
| How often and when is an update released? | The team behind the CoE Starter Kit aim to release during the first full week of every month. |
| Where can I review the changes? | The [release notes](https://github.com/microsoft/coe-starter-kit/releases) are available in the GitHub repository. Alternatively, [you can register](https://aka.ms/coeofficehours) for the monthly Office hours call. |
| How often should I update the CoE Starter Kit? | At least every three months, or if a release contains a fix, or new feature that you would like to evaluate. |
| We want to extend our CoE Starter Kit, what are the best practices? | Awesome! You should [follow the guidance here](power-platform/guidance/coe/extending-components).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]