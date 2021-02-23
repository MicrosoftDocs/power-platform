---
title: Programmability and Extensibility - Versioning and support | Microsoft Docs
description: Overview of versioning and support for Power Platform programmability tools.
author: laneswenka
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: reference
ms.date: 02/22/2021
ms.author: laswenka
search.audienceType: 
  - admin
search.app:
  - Powerplatform
---

# Versioning and support
This topic provides an overview of the versioning and breaking change policies for the various programmability tools.

## Support and deprecation information
The Power Platform API is the first tool to receive new versions.  As new versions of the REST APIs are released, earlier versions will be retired. Microsoft will declare a version deprecated at least six months before it retires an API endpoint.

By incrementing the version number of the API (for example, from 2021-02-01 to 2021-10-01), Microsoft announces that the lowest version (in this example, 2021-02-01) is immediately deprecated and will no longer be supported six months after the announcement. However, Microsoft might make exceptions to this policy for service health and security issues.

In the future, a new header will be introduced on all API responses that indicate a version is unrecognized (decomissioned) or deprecated.  

For PowerShell commandlets, incremental versions will be made available to resolve minor bug fixes.  Major versions will be incremented to match the new API versions that occur twice per calendar year.

## Compatible and breaking changes
Microsoft will provide details of programmability changes in the [Release Notes](linkhere.co). If the changes are non-breaking in nature, the API version will remain the same, and the PowerShell version will receive a minor version increment. If the changes are breaking in nature, Microsoft will increment the API version and PowerShell major version.

Here are some examples of breaking changes:

* The URL or fundamental request/response is changed.
* A declared property is removed or renamed, or its type is changed.
* The API or API parameters are removed or renamed.
* A required request parameter is added.

Here are some examples of non-breaking changes:

* Properties are added that are nullable or have a default value.
* A member is added to an enumeration.
* Paging is introduced to existing collections.
* Error codes are changed.
* The order of properties in requests or responses is changed.

