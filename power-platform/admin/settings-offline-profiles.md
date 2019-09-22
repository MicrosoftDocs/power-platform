---
title: "Enable offline synchronization | MicrosoftDocs"
description: Enable offline synchronization for Common Data Service.
ms.custom: ""
ms.date: 08/10/2018
ms.reviewer: ""
ms.service: power-platform
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Enable offline synchronization

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Provide an enhanced offline experience for mobile users using Dynamics 365 apps. Once offline synchronization is turned on, mobile users can seamlessly work in offline mode on their mobile device when they don't have an internet connection.

This offline experience uses Azure services to periodically synchronize entities with Dynamics 365 apps so synchronized records are available when users’ mobile devices are disconnected. To enable offline synchronization, follow the steps below.

## Step 1: Create a profile

Create one or more offline profiles to specify how much of an entity's data (and related entities' data) will be available to users while offline.

1. Sign in to [https://admin.powerplatform.microsoft.com/](https://admin.powerplatform.microsoft.com/) as an admin. 
2. Go to **Environments** > [select an environment] > **Settings** > **Offline access profiles**
3. Enter a profile name and description.

<insert image>

> [!NOTE]
> You can add more than one profile for an app module.

## Step 2: Select entity data to sync

Select entities that will be available to mobile users when they're using apps in offline mode. To find a list of entities that are available for offline use, select **See what's included** under each app module.

<insert image>

## Step 3: Choose records to include

Filter the number of records enabled for offline use by selecting a date range for updated records to include. By default records modified within the last 10 days are synchronized for offline use.

<insert image>

> [!NOTE]
> The amount of data you make available to users while they’re offline can affect the data usage rates for devices on cellular networks. The amount of data depends on:
> - The number of entities you enable for offline
> - The number of days you specify since records were last modified
> - The filters you set while creating offline profiles

## Step 4: Choose users to receive data

Add users to the profile so they receive selected records when offline. Users can only be listed in one offline profile.

<need info on difference between +New and Search>

## Tips

Here are a few things to keep in mind about offline synchronization:

- Offline synchronization with mobile devices occurs periodically. A synchronization cycle could last for several minutes, depending on Azure network latency, the volume of data that’s set for synchronization, and mobile network speed. Users can still use the mobile apps during synchronization.
- Changes to a user’s security privileges are updated during the next synchronization cycle. Until that time, users can still continue accessing data according to their previous security privileges, but any changes they make will be validated during the synchronization to the Customer Engagement server. If they no longer have privileges to make changes for a record, they will receive an error and the record won’t be created, updated, or deleted.
- Any changes to a user’s privilege to view a record won’t take effect on the mobile device until the next synchronization cycle.

> [!NOTE]
> Once you’ve enabled offline synchronization, metadata changes are pushed to the mobile apps when the changes are published, not just on app start-up. To keep offline synchronization up-to-date, users should always accept the prompt to download metadata changes.

### See also
