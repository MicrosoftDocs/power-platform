---
title: "Programmability and extensibility (preview) | Microsoft Docs"
description: Overview of available programmable tools for Microsoft Power Platform administrators
author: laneswenka
ms.reviewer: jimholtz
ms.component: pa-admin
ms.topic: overview
ms.date: 03/19/2021
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Programmability and extensibility overview (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Microsoft Power Platform administrators often have the need to orchestrate and automate routine activities for their tenant.  This can be accomplished in a variety of ways using the tools outlined below.  

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

> [!NOTE]
> Programmability tools are currently developed API-first, meaning new properties and functionality will first be exposed in the latest API versions made available.  They will later be uptaken into updates to our Power Platform CLI, PowerShell cmdlets and connectors.  In the future, this will become synchronized across all available tools automatically.  

## Customer management plane vs customer data plane
Historically, Power Platform administrators have had disparate APIs from which to manage their tenant and its resources within the platform.  This included an API for managing environments, another API for managing Power Apps, and yet another for managing Power Automate flows.  With Power Platform API, Microsoft is collecting, harmonizing, and ultimately providing a single API surface from which customers can manage these resources.

The customer management plane is where tenant level resources and environments are surfaced.  This includes operations like creating environments (with or without Dataverse), managing Billing policies for [Pay-as-you-go](/power-platform/admin/pay-as-you-go-overview), querying and reporting on capacity consumption, and so on.  These capabilities will all be surfaced under Power Platform API and more features will be added regularly.  

The customer data plane is for interacting with data and records stored inside of an environment database.  This database is most commonly referred to as Microsoft Dataverse of which includes its own [rich OData-based API](/powerapps/developer/data-platform/webapi/overview).  Operations using Dataverse APIs include retrieving data from a table, using functions and actions, and executing batch operations.

Ultimately, customers will have two primary APIs: one for the management plane and one for the data plane.  This documentation is strictly for the management plane available as Power Platform API and tools that make use of it.

## Available tools
Several programmability tools are available for administrators.  These gradually increase in complexity and also capability.  Over time, more libraries will become available in various programming languages.  To keep up with the latest updates, review the [release plans](/dynamics365/release-plans/#microsoft-power-platform).

### Power Platform for admins management connectors
Connectors are the easiest to get started if you are new to automation.  With a graphical workflow editor based on Power Automate, these allow admins to quickly get a routine task implemented.  For more information, see [Get started with Power Platform for admins management connectors](connectors-getting-started.md).

### Power Platform CLI
[Microsoft Power Platform CLI](/powerapps/developer/data-platform/powerapps-cli) is a simple, one-stop developer CLI that empowers developers and ISVs to perform various operations in Microsoft Power Platform related to environment lifecycle, authentication, and work with environments, solution packages, portals, code components, and so on.

### PowerShell cmdlets
PowerShell is a common automation tool at organizations worldwide.  For more information, see [Get started with PowerShell for Power Platform administrators](powershell-getting-started.md).

### Power Platform API
The most advanced tool available, it has full parity with what is possible in the Power Platform admin center.  For more information, see [Get started with Power Platform API](/rest/api/power-platform).

## Next steps
Regardless of which tool you choose, you'll want to review the following articles to get started:

- [Versioning and support](programmability-versioning-support.md)
- [Authentication (preview)](programmability-authentication-v2.md)

