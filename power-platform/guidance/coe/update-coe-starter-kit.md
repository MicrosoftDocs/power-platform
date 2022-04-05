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

<!--- Add in links to CoE documentation --->

## Update and release cadence

The team behind the CoE Starter Kit releases a new version during the first week of each month.  This release cadence is important for you to know for you to review, organize, plan and test the latest version.

The team announces updates (bug fixes, enhancements, new features, deprecations and removals) over different channels, listed below:

- GitHub
- Office Hours

The following sections provide useful guidance and best practices for tracking release information for each channel.

## Review release notes in GitHub

With each release of the CoE Starter Kit, is an accompanying set of release notes. Release notes should be reviewed prior to installing the updated version in your organization.

### Viewing release notes

You can view the details of each release by following the steps described below:

1. Navigate to the [CoE Starter Kit repository](https://github.com/microsoft/coe-starter-kit) in GitHub.
1. On the right side of the screen, in the section labeled 'Releases' is a link to the latest release notes.
1. The release notes screen provides links to issues and new features along with links to set up instructions and the change log.

The change log lists all bugs, features and updates in the release. Selecting an issue takes you to the item where you're able to review all related comments and progress updates.

#### Notifications

You can use GitHub notifications to be proactively notified when updates and changes occur. The steps below describe how to create custom notification for new/ updates to issues and releases.

1. Sign-in to your GitHub account, or sign up.
1. Navigate to the CoE Starter Kit repository
1. Select the button labeled 'Watch'
1. Either select an existing notification option, or select the option labeled 'Custom'.
1. In the example below, a custom notification has been created to send alerts for new/ updated issues, releases and security alerts.

## Office hours

The CoE Starter Kit team runs a monthly 'Office hours' call where they dive a little deeper into new features and bug fixes.  This call is useful to attend; you can [register for the Office hours call here](https://aka.ms/coeofficehours).

## Deciding how often to update the CoE Starter Kit

Here are a few things to consider when deciding on your update frequency:

- Does the new release fix an issue that you currently have?
- Does the new release contain a new feature that you would like to try out?

An **equally important** factor here is supportability.  Before each release, the CoE Starter Kit team evaluate any bug fixes or new features against the previous three released versions to ensure that updates don't affect earlier versions of the Starter Kit.  Unfortunately, it means that leaving updates longer than three months could result in unexpected issues when updating.

The recommendation is to evaluate releases monthly. 

Your Power Platform administrators should review release notes. Set up notifications and/ or attend the Office hours call every month. 

After evaluating, proceed to update your CoE Starter Kit implementations.