---
title: Programmability and Extensibility | Microsoft Docs
description: Overview of available programmable tools for Power Platform administrators
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 03/15/2021
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Programmability and extensibility overview
Power Platform administrators often have the need to orchestrate and automate routine activities for their tenant.  This can be accomplished in a variety of ways using the tools outlined below.  

> [!NOTE]
> Programmability tools are currently developed API-first, meaning new properties and functionality will first be exposed in the latest API versions made available.  They will later be uptaken in to updates to our PowerShell cmdlets and connectors.  In the future, this will become synchronized across all available tools.  

## Available tools
Today, there are three programmability tools available for administrators to use.  These increase in complexity and flexibility.  Over time, more first-party libraries will become available in various programming languages.  To keep up with the latest updates, review the [Release Notes](/dynamics365/release-plans/#microsoft-power-platform).

### Power Platform for admins management connectors
Connectors are the easiest to get started if you are new to automation.  With a graphical workflow editor based on Power Automate, these allow admins to quickly get a routine task implemented.  For more information, see the [Power Platform for admins management connectors - Getting started](connectors-getting-started.md).

### PowerShell cmdlets
PowerShell is a common automation tool at organizations worldwide.  For more information, see [Power Platform PowerShell module for administrators - Getting started](powershell-getting-started.md).

### Power Platform API
The most advanced tool available, it has full parity with what is possible in the Power Platform admin center.  For more information, see  [Power Platform API - Getting started](powerplatform-api-getting-started.md).

## Next steps
Regardless of which tool you choose, you will want to review the following articles to get started:

- [Versioning and support](programmability-versioning-support.md)
- [Authentication](programmability-authentication.md)

