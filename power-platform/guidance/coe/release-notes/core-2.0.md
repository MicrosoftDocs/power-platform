---
title: "Release notes and latest version of the CoE starter kit Core components 2.0 | MicrosoftDocs"
description: "Release notes and latest version of the CoE Starter Kit 1.99."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/08/2021
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Released version Core Components 2.0

Version 2.0 for the CoE Starter Kit Core Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on April 8, 2021.

## Capacity and Add Ons

Environment capacity and add-ons are now stored and can be reported on. New tables (Environment Capacity, Environment Add Ons) have been added to store this information. The Power Platform Admin View model-driven app has been updated to view this information. The Admin | Sync Template v3 flow has been updated to retrieve and save this information. The Admin | Capacity Alert flow has been added to alert the admin of capacities over or close to their approved capacity.

## Power BI - Direct Query

The Power BI dashboard has been updated to use Direct Query to connect to Microsoft Dataverse, therefore TDS Endpoint has to be enabled for the environment: [Manage feature settings](https://docs.microsoft.com/power-platform/admin/settings-features).

Viewers of the Power BI Dashboard will need read access to the Dataverse tables to view data.

You will no longer need a scheduled refresh to refresh the Power BI dataset, as the data in the dashboard will always be as up to date as the data in the Dataverse tables.

## Moving components from Nurture and Governance

Admin | Welcome email (flow) and App catalog (canvas app) have been moved from Nurture components to Core components in an effort to allow Nurture components to be used standalone.

Admin | Compliance detail request has been moved from Governance components to Core components to accommodate changes to make this flow compatible with Dataverse for Teams environments.

## Bug fixes

Bug fixes have been made to the Sync Flows.

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]