---
title: "Environment capacity management & alerting | MicrosoftDocs"
description: "This article describes a sample process for managing environment capacity and receiving alerts for overages."
author: manuelap-msft
manager: devkeydet
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/18/2020
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
# Environment capacity management & alerting

As a Power Platform admin, you want to ensure capacity is used effectively in your tenant, monitor which environments and business units are consuming the capacity available and cross-charge consumption according to actual usage.

## Process description

**Problem statement:** Central IT wants to monitor capacity consumption in the tenant to see which environments consume the most capacity. Central IT wants to cross-charge capacity consumption to business units.

**Solution:** Central IT configures approved capacity per environment and adds additional meta-data to store business unit and cost code for cross-charging purposes. Central IT receives notifications when environments are close to or over their approved capacity.

## Add approved capacity and business unit information to an environment

1. Navigate to the Power Platform Admin View
1. Select an environment
1. See their current consumption
1. Add approved consumption
1. NOTE: do not add new fields there, edit by selecting the row and saving in line

## Monitor capacity

1. View in the Power BI dashboard how environments are consuming capacity

## Receive capacity alerts

Receive alerts send daily for capacities over their threshold or close to their threshold. Currently at 80%.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]