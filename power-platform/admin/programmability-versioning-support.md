---
title: Programmability and Extensibility - Versioning and support
description: Overview of versioning and support for Microsoft Power Platform programmability tools.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/07/2025
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Versioning and support
This article provides an overview of the versioning and breaking change policies for the various programmability tools.

## Support and deprecation information
As a new version of the REST API is released, earlier versions are retired. Microsoft declares a version deprecated at least 12 months before it retires an API endpoint. When a version is deprecated, it's supported as-is. If you face an issue with that version, we request that you move to the currently stable version. When a version is retired, it's not supported and will soon be shut off.

By incrementing the version number of the API (for example, from 2021-10-01 to 2022-04-01), Microsoft announces that the prior generally available version (in this example, 2021-10-01) is immediately deprecated and will be retired 12 months after the announcement. The same treatment is had for public preview versions. Microsoft might make exceptions to this policy for service health and security issues.  

The various tools and SDKs that are generated on top of Power Platform API like Power Platform CLI, the Admin V2 connector, and PowerShell, are updated to newer API versions on a per action basis and are transparent to end users.

## Compatible and breaking changes
Microsoft provides details of programmability changes in the [release plans](/dynamics365/release-plans/#microsoft-power-platform). If the changes are nonbreaking in nature, the API version remains the same, and the PowerShell version receives a minor version increment. If the changes are breaking in nature, Microsoft increments the API version and PowerShell major version. 

Here are examples of breaking changes:

- The URL or fundamental request/response is changed.
- A declared property is removed or renamed, or its type is changed.
- The API or API parameters are removed or renamed.
- A required request parameter is added.

Here are examples of nonbreaking changes:

- Properties are added that are nullable or have a default value.
- A member is added to an enumeration.
- Paging is introduced to existing collections.
- Error codes are changed.
- The order of properties in requests or responses is changed.

## Available versions

| Version | Type | Reference | Deprecation date | Decommission date
| --- | --- | --- | --- |
| 2024-10-01 | Stable | [Reference](/rest/api/power-platform) | N/A | N/A |
| 2022-03-01-preview | Public preview | [2022-03-01-preview Ref](/rest/api/power-platform) | 2025-03-01 | 2026-03-01 |
| 2020-10-01 | Generally available | [2020-10-01 Ref](list-environments.md) | N/A | N/A |

> [!Note]
> The 2020-10-01 Generally available version of Power Platform API is specific to environment management and is also commonly referred to as Business Application Platform (BAP) API. The functionality of this set of endpoints are made available in the newer versions of Power Platform API along with many additional features after version 2022-03-01-preview.

## Next steps
Now that you understand the versioning and support strategy, let's walk through how to authenticate with Microsoft Power Platform API.

- [Authentication](programmability-authentication-v2.md)
- [Authentication (legacy)](programmability-authentication.md)
