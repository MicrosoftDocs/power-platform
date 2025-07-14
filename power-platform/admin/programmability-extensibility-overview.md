---
title: Programmability and extensibility
description: Overview of available programmable tools for Microsoft Power Platform administrators
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: overview
ms.date: 07/01/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Programmability and extensibility overview

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Microsoft Power Platform administrators often have the need to orchestrate and automate routine activities for their tenant.  This can be accomplished in a variety of ways using the tools outlined below.  

> [!NOTE]
> Programmability tools are currently developed API-first, meaning new properties and functionality is first exposed in the latest API versions made available. They're later taken into updates to our Power Platform CLI, PowerShell cmdlets, and connectors. In the future, this becomes synchronized across all available tools automatically.  

## Customer management plane vs customer data plane

Historically, Power Platform administrators have had disparate APIs from which to manage their tenant and its resources within the platform. This included an API for managing environments, another API for managing Power Apps, and yet another for managing Power Automate flows. With Power Platform API, Microsoft is collecting, harmonizing, and ultimately providing a single API surface from which customers can manage these resources.

The customer management plane is where tenant-level resources and environments are surfaced. This includes operations like creating environments (with or without Dataverse), managing billing policies for [Pay-as-you-go](/power-platform/admin/pay-as-you-go-overview), querying and reporting on capacity consumption, and so on. These capabilities are surfaced under Power Platform API and more features will be added regularly.  

The customer data plane is for interacting with data and records stored inside of an environment database. This database is most commonly referred to as Microsoft Dataverse of which includes its own [rich OData-based API](/powerapps/developer/data-platform/webapi/overview). Operations using Dataverse APIs include retrieving data from a table, using functions and actions, and executing batch operations.

Ultimately, customers have two primary APIs: one for the management plane and one for the data plane. This documentation is strictly for the management plane available as Power Platform API and tools that make use of it.

## Available tools

Several programmability tools are available for administrators. These gradually increase in complexity and also capability. Over time, more libraries will become available in various programming languages. To keep up with the latest updates, review the [release plans](/dynamics365/release-plans/#microsoft-power-platform).

### Power Platform API

Use the Power Platform API to access the customer management plane capabilities of Power Platform admin center. There are two implementations of the Power Platform API available today: a REST API, and a .NET API.

Learn more about the REST API in the [REST API reference overview](/rest/api/power-platform).

The .NET API is distributed as a NuGet package named [Microsoft.PowerPlatform.Management](https://www.nuget.org/packages/Microsoft.PowerPlatform.Management/). The API reference is available through the .NET API browser - [API: Power Platform management](/dotnet/api/?view=power-platform-latest).

### Power Platform for Admins V2 connector

The new [Power Platform for Admins V2 connector](/connectors/powerplatformadminv2) is generally available for use in both Power Automate and Logic Apps. It's a strongly-typed representation of the Microsoft Power Platform API.

### Power Platform CLI

[Microsoft Power Platform CLI](/powerapps/developer/data-platform/powerapps-cli) is a simple, one-stop developer CLI that empowers developers and ISVs to perform various operations in Microsoft Power Platform related to environment lifecycle, authentication, and work with environments, solution packages, portals, code components, and so on.

### PowerShell cmdlets

PowerShell is a common automation tool at organizations worldwide. For more information, see [Get started with PowerShell for Power Platform administrators](powershell-getting-started.md).

## Next steps

Regardless of which tool you choose, review the following articles to get started:

- [What's new or changed](./programmability-whats-new-changed.md)
- [Versioning and support](programmability-versioning-support.md)
- [Authentication](programmability-authentication-v2.md)
