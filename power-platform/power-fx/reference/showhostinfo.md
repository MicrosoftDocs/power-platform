---
title: ShowHostInfo object in Power Apps
description: Reference information including syntax and examples for the ShowHostInfo object in Power Apps.
author: gregli
ms.topic: reference
ms.custom: canvas
ms.reviewer: 
ms.date: 3/22/2024
ms.author: trdehove
search.audienceType: 
  - maker
contributors:
  - gregli
---
# ShowHostInfo function
[!INCLUDE[showhostinfo-applies-to](includes/showhostinfo-applies-to.md)]



Show [Host object](object-host.md) information to a user.

## Description

The **ShowHostInfo** function is used to display information to the user in the app. The user will see a pop-up with the appropriate details related to the selected type of information.     

## Syntax

**ShowHostInfo(HostInfo)**

HostInfo – Required. The type of information to display.

## Examples

1. Enable a [canvas app for offline](/power-apps/mobile/canvas-mobile-offline-overview).
1. Set the [OnSelect](/power-apps/maker/canvas-apps/controls/properties-core) property of the [Sync icon](/power-apps/maker/canvas-apps/controls/control-shapes-icons) to `ShowHostInfo(HostInfo.OfflineSync)`
1. Save and publish the app.

When the users selects the Sync icon on their mobile device, a pop-up with the offline sync details such as sync status, last sync date, and downloaded tables are displayed. 

## Known issue
- The table column in the available table section shows the table name instead of the display name.
- The popup on Windows is loaded in full screen.







































































































































