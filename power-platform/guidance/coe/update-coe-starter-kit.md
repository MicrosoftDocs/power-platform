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
- [Extending CoE components](power-platform/guidance/coe/extending-components)

## The update and release process

The team behind the CoE Starter Kit releases a new version during the first week of each month.  This release cadence is important for you to know for you to review, organize, plan and test the latest version.

The team announces updates (bug fixes, enhancements, new features, deprecations and removals) over different channels, listed below:

- GitHub
- Office hours community call

The following sections provide useful guidance and best practices for tracking release information for each channel.

### How often should you update the CoE Starter Kit?

Here are a few things to consider when deciding on your update frequency:

- Does the new release fix an issue that you currently have?
- Does the new release contain a new feature that you would like to try out?
- By **not** updating to the new release mean your current version is older than three months?

Before a release, the CoE Starter Kit team evaluates any bug fixes or new features against the previous three released versions to ensure that updates don't affect earlier versions of the Starter Kit.  Unfortunately, it means that leaving updates longer than three months could result in unexpected issues when updating.

>[!NOTE]
>Try to evaluate releases monthly. Maintain (if possible) parity between your testing/ production versions of the CoE Starter Kit and the current release, or within the past three versions.

### Review release notes in GitHub

With each release of the CoE Starter Kit, is an accompanying set of release notes. Release notes should be reviewed prior to installing the updated version in your organization.

#### Viewing release notes

You can view the details of each release by following the steps described below:

1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit) in GitHub.
1. On the right side of the screen, in the section labeled 'Releases' is a link to the latest release notes.
1. The release notes screen provides links to issues and new features along with links to set up instructions and the change log.

The change log lists all bugs, features and updates in the release. Selecting an issue takes you to the item where you're able to review all related comments and progress updates.

#### Notifications

You can use GitHub notifications to be proactively notified when updates and changes occur. The steps below describe how to create custom notification for new/ updates to issues and releases.

1. Sign-in to your GitHub account, or sign up.
1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit)
1. Select the button labeled 'Watch' (or possibly labeled 'Unwatch' if you have already set up notifications)
[Select 'Watch](media/coe-starter-kit-releases-link.png "Selecting Watch option")

1. Either select an existing notification option, or select the option labeled 'Custom'.
1. In the example below, a custom notification has been created to send alerts for new/ updated issues, releases and security alerts.

### Office hours

The CoE Starter Kit team runs a monthly 'Office hours' call that dives a little deeper into new features and bug fixes.  This call is useful to attend; you can [register for the Office hours call here](https://aka.ms/coeofficehours).

## Testing updates

As with any update; we would recommend testing a new version.  To test, you need a test version of the kit.

## Customizing the CoE Starter Kit

The CoE Starter Kit is a great starting point for many customers.  However, it's likely that you'll need to make customizations. The following article provides you with a set of best practices for extending/ creating customizations.