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

This document provides a set of best practices and recommendations for updating the CoE Starter Kit.

The CoE Starter Kit provides inspiration and a starting point for Power Platform governance. If you're new to the CoE Starter Kit, below are some useful links to help you get started:

- [The CoE Starter Kit](power-platform/guidance/coe/starter-kit)
- [Setting up the CoE Starter Kit](/power-platform/guidance/coe/setup)
- [Installing CoE upgrades](power-platform/guidance/coe/after-setup)
- [Extending CoE components](power-platform/guidance/coe/extending-components)

## The update and release process

The team behind the CoE Starter Kit releases a new version during the first full week of each month.  This release cadence is important to know for you to review, organize, plan and test the latest version.

The team announces updates (bug fixes, enhancements, new features and deprecations) through:

- GitHub release notes
- Office hours community call

The following sections provide useful guidance and best practices for tracking release information for each channel.

### GitHub release notes

With each release of the CoE Starter Kit, is an accompanying set of release notes. Release notes should be reviewed prior to installing the updated version in your organization.

#### Viewing release notes

View the details of each release by following the steps described below:

1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit) in GitHub.
1. On the right side of the screen, is [a link to the latest release](https://github.com/microsoft/coe-starter-kit/releases) notes.

Release notes contain links to bug fixes, new features, upgrade instructions and the change log.

Upgrade instructions will notify you of any changes that you need to make (turning on flows, setting variables, etc.) for the release.
The change log lists all bugs, features and updates in the release. Selecting an issue takes you to the item to review comments and all related progress updates.

#### Notifications

Create GitHub notifications for updates. 

The steps below describe how to create custom notification for new/ updates to issues and releases.

1. Sign-in to your GitHub account, or sign up.
1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit)
1. Select the button labeled 'Watch' (or possibly labeled 'Unwatch' if you've already set up notifications)
1. Either select an existing notification option, or select the option labeled 'Custom'.
1. In the example below, a custom notification has been created to send alerts for new/ updated issues, releases and security alerts.

![Screenshot of GitHub notification creation](media/coe-starter-kit-notifications.png)

### Office hours community call

The CoE Starter Kit team runs a monthly community call that dives deeper into new features and bug fixes. You can [register for the Office hours call here](https://aka.ms/coeofficehours).

### How often should you update the CoE Starter Kit?

Here are a few things to consider when deciding on your own update frequency:

- Does the new release **fix an issue** that you currently have?
- Does the new release **contain a new feature** that you would like to try out?
- By **not** updating to the new release mean your current version is three months older than the new version?

Before a release, the CoE Starter Kit team tests any bug fixes or new features against the previous three released versions to ensure that updates don't affect earlier versions of the Starter Kit.  Unfortunately, it means that leaving updates longer than three months could result in unexpected issues when updating.  Useful guidance for installing updates to the CoE Starter Kit [can be found here](power-platform/guidance/coe/after-setup).

>[!NOTE]
>Review releases monthly by attending the office hours calls and reading release notes. Create notifications to alert you when updates that interest you are made. Try to maintain parity between your testing/ production versions of the CoE Starter Kit and the current release, or within the past three versions.

## Installing updates

As with any update, testing increases the likelihood of success when installing an update to your production version of the CoE.
Ideally, create a non-production version of the CoE Starter Kit for testing.  The sections below advise how to install and test updates for two possible scenarios:

- If you've made customizations to the CoE Starter Kit
- If you haven't made customizations to the CoE Starter Kit

### Step-by-step instructions for installing updates

The steps below describe how to install updates to the CoE Starter Kit.

### If you've made customizations

The CoE Starter Kit is a set of useful apps and other features that are available for you to utilize. Often, you'll need to make changes to an app or flow.  Making changes can introduce complexity to the upgrade process by introducing unmanaged layers.  If you're installing an update and you've customized the CoE Starter Kit; refer to the following documents for best practices and advice:

- [Installing CoE upgrades](power-platform/guidance/coe/after-setup)

To learn more about extending the kit in the best way, refer to the following document:

- [Extending CoE components](power-platform/guidance/coe/extending-components)

#### Making customizations and unmanaged solutions

When you need to make changes to any component of the CoE Starter Kit, you should do so in your own unmanaged solution. Learn more about solutions and solution layering by familiarizing yourself with the following documentation:

- [Introducing solutions](powerapps/developer/common-data-service/introduction-solutions)
- [Solution layering](power-platform/alm/solution-layers-alm)

### If you haven't made customizations

If you haven't made customizations to the CoE Starter Kit, follow the steps in [this document](power-platform/guidance/coe/after-setup).

### If you have an issue

If you find a bug or an issue when testing you can [raise a bug here](https://github.com/microsoft/coe-starter-kit/issues/new?assignees=Jenefer-Monroe&labels=coe-starter-kit%2Cbug&template=1-coe-starter-kit-bug.yml&title=%5BCoE+Starter+Kit+-+BUG%5D+ISSUE+TITLE) ensuring to provide the [solution operation error](powerapps/maker/data-platform/solution-history#view-solution-operation-error-details) details.

## Summary

Here's a summary of the information provided, and links in this document.

### How often and when is an update released?

The team behind the CoE Starter Kit aim to release updates during the first full week of every month.

### Where can I review the changes?

The [release notes](https://github.com/microsoft/coe-starter-kit/releases) are available in the GitHub repository. Alternatively, [you can register](https://aka.ms/coeofficehours) for the monthly office hours call.

### How often should I update the CoE Starter Kit?

At least every three months to avoid unplanned/ unexpected issues, or if a release contains a bug fix or new feature that you would like to review. The team behind the CoE Starter Kit test the previous three releases, so leaving updates for longer than this period increases the risks of unplanned/ unexpected issues.

### I want to customize the CoE Starter Kit, what are the best practices?

Updates to the CoE Starter Kit should be completed following the best practices outlined in [this document](power-platform/guidance/coe/extending-components).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]