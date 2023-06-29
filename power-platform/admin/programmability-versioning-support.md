---
title: Programmability and Extensibility - Versioning and support | Microsoft Docs
description: Overview of versioning and support for Microsoft Power Platform programmability tools.
author: laneswenka
ms.reviewer: jimholtz
ms.component: pa-admin
ms.topic: reference
ms.date: 03/09/2022
ms.subservice: admin
ms.author: laswenka
search.audienceType: 
  - admin
---

# Versioning and support
This article provides an overview of the versioning and breaking change policies for the various programmability tools.

## Support and deprecation information
The Power Platform API is the first programmability tool to receive new versions and features before other SDKs like PowerShell, Management Connectors, and Power Platform CLI. As a new version of the REST API is released, earlier versions will be retired. Microsoft will declare a version deprecated at least 12 months before it retires an API endpoint. When a version is deprecated, it is still supported as-is.  If you face an issue with that version, we will request that you move to the currently generally available version.  When a version is retired, it is not supported and will soon be shut off.

By incrementing the version number of the API (for example, from 2021-10-01 to 2022-04-01), Microsoft announces that the prior generally available version (in this example, 2021-10-01) is immediately deprecated and will be retired 12 months after the announcement. The same treatment is had for public preview versions.  Microsoft might make exceptions to this policy for service health and security issues.  

For PowerShell cmdlets, incremental versions will be made available to resolve minor bug fixes.  Major versions will be incremented to match the new API versions that occur.

## Compatible and breaking changes
Microsoft will provide details of programmability changes in the [release plans](/dynamics365/release-plans/#microsoft-power-platform). If the changes are non-breaking in nature, the API version will remain the same, and the PowerShell version will receive a minor version increment. If the changes are breaking in nature, Microsoft will increment the API version and PowerShell major version. 

Here are examples of breaking changes:

- The URL or fundamental request/response is changed.
- A declared property is removed or renamed, or its type is changed.
- The API or API parameters are removed or renamed.
- A required request parameter is added.

Here are examples of non-breaking changes:

- Properties are added that are nullable or have a default value.
- A member is added to an enumeration.
- Paging is introduced to existing collections.
- Error codes are changed.
- The order of properties in requests or responses is changed.

## Available versions

| Version | Type | Reference | Deprecation date | Decommission date
| --- | --- | --- | --- |
| 2022-03-01-preview | Public preview | [2022-03-01-preview Ref](/rest/api/power-platform) | N/A | N/A |
| 2020-10-01 | Generally available | [2020-10-01 Ref](list-environments.md) | N/A | N/A |

> [!Note]
> The 2020-10-01 Generally available version of Power Platform API is specific to environment management and is also commonly referred to as Business Application Platform (BAP) API.  The functionality of this set of endpoints will be made available in the newer versions of Power Platform API along with many additional features after version 2022-03-01-preview.

## Next steps
Now that you understand the versioning and support strategy, let's walk through how to authenticate with Microsoft Power Platform API.

- [Authentication (preview) - for the Public preview release](programmability-authentication-v2.md)
- [Authentication (legacy) - for the Generally available release](programmability-authentication.md)
