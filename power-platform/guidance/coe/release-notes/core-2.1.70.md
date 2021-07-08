---
title: "Release notes and latest version of the CoE starter kit Core components 2.1.70 | MicrosoftDocs"
description: "Release notes and latest version of the CoE Starter Kit 2.1.70"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2021
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

# Released version Core Components 2.1.70

Version 2.1.70 for the CoE Starter Kit Core Components is now available. This article describes the updates, including the new features and the fixes to existing functionality, included in this release. This version was first made available on June 1, 2021.

## Table: PowerApps Apps and Flow

Two new columns have been added to the PowerApps Apps and Flow table, called App Connections and Flow Connections. These columns store a comma-separated list of connectors used in the app or flow. These columns are used in the DLP Editor v2 to avoid delegation issues.

## Connection References

Connection References used by all cloud flows have been renamed and now use *CoE Core - Connector Name* as a naming convention. Dependencies on connection references between solutions have been removed, and all connection references are now only used by the solution they are shipped with.

## Power BI Dashboard

There are two different ways to connect to Dataverse from Power BI:

- **Dataverse**: This connector is the most recent version and uses the tabular data stream (TDS) protocol.
- **Common Data Service (Legacy)**: This is the earlier version of the connector.

Due to some limitations and pre-requisites of the Dataverse connector, two version of the Power BI dashboard are now available - one using Dataverse, the other using Common Data Service (Legacy) connectors.

## DLP Editor

Delegation issues have been resolved for the DLP Editor. The DLP Editor now also works for HTTP and HTTP Webhook connectors.

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]