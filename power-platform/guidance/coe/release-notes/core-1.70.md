---
title: "Release notes and latest version of the CoE starter kit Core components 1.70 | MicrosoftDocs"
description: "Release notes and latest version of the CoE Starter Kit 1.70."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# Released version Core Components 1.70

## Introduction

Version 1.70 for the CoE Starter Kit Core Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on September 21, 2020.

## Modern Solution Import Experience

Connection References have been added to the solution to support the new modern import solution experience. All flows have been updated to use connection references, rather than connections. The [setup instructions](../setup-core-components.md) have been updated to describe the new setup experience.

## Table changes

Tables **RPA** and **RPA Session** have been added to support inventory and analytics for Ui Flows.

## Power BI Dashboard

The [Power BI Dashboard](../power-bi-monitor.md#ui-flows) has been updated to show UI flow inventory and run details.

## Custom Connector

To help with the setup, the custom connector used in the [Audit Log components](../setup-auditlog.md) has been removed from the Audit Log solution and added to this solution.

## Deprecation

The DLP Editor and DLP Customizer canvas apps have been deprecated, due to limitations with the DLP actions in the Power Platform for Admins connector.
