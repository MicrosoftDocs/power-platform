---
title: Programmability and extensibility
description: Overview of available programmable tools for Microsoft Power Platform administrators
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: overview
ms.date: 07/30/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Programmability and extensibility overview

Power Platform admins often need to orchestrate and automate routine activities for their tenant. They can do this using various programmable tools, all developed with an API-first strategy. New features and properties are released first in the Power Platform API, then appear in SDKs, CLI, PowerShell cmdlets, and connectors. This approach enables faster innovation, more consistent experiences, and easier automation and integration for both admins and developers.

> [!NOTE]
> Microsoft shifted from a user experience-first to an API-first development model for Power Platform programmability. New capabilities are introduced in the API first, then quickly synchronized across all supported tools, reducing lag and ensuring consistency. For more background, go to [Power Platform API and SDKs: From UX-first to API-first](https://devblogs.microsoft.com/powerplatform/power-platform-api-and-sdks-from-ux-first-to-api-first/).

## Customer management plane vs customer data plane

Historically, Power Platform admins have used different APIs to manage their tenant and its resources within the platform. This includes an API for managing environments, another for managing Power Apps, and another for managing Power Automate flows. With Power Platform API, Microsoft collects, harmonizes, and provides a single API surface that customers can use to manage these resources.

The customer management plane surfaces tenant-level resources and environments. This includes operations like creating environments (with or without Dataverse), managing billing policies for [Pay-as-you-go](/power-platform/admin/pay-as-you-go-overview), querying and reporting on capacity consumption, and so on. These capabilities are available through Power Platform API, and Microsoft adds more features regularly.  

The customer data plane is for interacting with data and records stored in an environment database. This database is most commonly called Microsoft Dataverse, which includes its own [rich OData-based API](/powerapps/developer/data-platform/webapi/overview). Operations using Dataverse APIs include retrieving data from a table, using functions and actions, and executing batch operations.

Customers use two primary APIs: one for the management plane and one for the data plane. This documentation focuses on the management plane available as Power Platform API and tools that use it.

## Available tools

Several programmability tools are available for administrators. These tools gradually increase in complexity and capability. Over time, more libraries become available in different programming languages. To stay updated, review [What's New or Changed](./programmability-whats-new-changed.md).

### Power Platform API

Use the Power Platform API to access customer management plane capabilities in the Power Platform admin center.

Learn more about the REST API in the [REST API reference overview](/rest/api/power-platform).

### Power Platform for Admins V2 connector

The new [Power Platform for Admins V2 connector](/connectors/powerplatformadminv2) is available for use in Power Automate and Logic Apps. It's a strongly typed representation of the Microsoft Power Platform API.

### Power Platform Management SDK

The .NET SDK is distributed as a NuGet package named [Microsoft.PowerPlatform.Management](https://www.nuget.org/packages/Microsoft.PowerPlatform.Management/). The API reference is available through the .NET API browser. Learn more in [API: Power Platform management](/dotnet/api/?view=power-platform-latest&preserve-view=true).

### Power Platform CLI

[Microsoft Power Platform CLI](/powerapps/developer/data-platform/powerapps-cli) is a simple, one-stop developer CLI that lets developers and ISVs perform operations in Microsoft Power Platform related to environment lifecycle, authentication, environments, solution packages, portals, and code components.

### PowerShell cmdlets

PowerShell is a widely used automation tool in organizations worldwide. For more information, see [Get started with PowerShell for Power Platform administrators](powershell-getting-started.md).

## Next steps

Regardless of which tool you choose, review these articles to get started:

- [What's new or changed](./programmability-whats-new-changed.md)
- [Versioning and support](programmability-versioning-support.md)
- [Authentication](programmability-authentication-v2.md)
