---
title: Programmability and Extensibility - Permission reference (preview) | Microsoft Docs
description: Overview of granular permissions available in Power Platform programmability tools
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

# Permission reference (preview)
This article provides an overview of the Power Platform API (preview) granular permissions.  These permissions will be initially available for registering client applications in Microsoft Entra and may become available in security role form in the future.

> [!IMPORTANT]
> The Power Platform API is in preview. The permission names are subject to change by the time the endpoints become generally available.  At that time, this article will be updated with the final permission details.

## Naming convention

Permissions in Power Platform API are  named in the following manner: `{namespace}.{resourceType}.{action}`, where:
* `namespace` is the logical grouping of resources and functionality
* `resourceType` is the specific resource type on which the permission is defined and must be unique across the resource type's namespace and
* `action` is named per the table below

  HTTP Method | Path Structure | Action Name(s)
  ----------- | -------------- | --------------
  GET or HEAD | Any            | Read
  DELETE      | Any            | Delete
  PATCH       | Any            | Update
  PUT         | Any            | Create and Update
  POST        | `/{namespace}/.../{resourceType}` | Create
  POST        | `/{namespace}/.../{resourceType}/{resourceId}/{action}` | `{action}`

## Defined permissions

The following table is a list of the currently defined permissions in Power Platform API:

Name | Display Name | Description | 
---- | ------------ | ----------- |
`AppManagement.ApplicationPackages.Read` | Read Application Packages | Allows reading application packages | 
`AppManagement.ApplicationPackages.Install` | Install Application Packages | Allows installing application packages | 
`Governance.LockboxPolicies.Create` | Create Lockbox Policies | Allows creating lockbox policies | 
`Governance.LockboxPolicies.Update` | Update Lockbox Policies | Allows updating lockbox policies | 
`Governance.LockboxPolicies.Read` | Read Lockbox Policies | Allows reading lockbox policies | 
`Governance.LockboxRequests.Read` | Read Lockbox Requests | Allows reading lockbox requests | 
`Governance.LockboxRequests.Approve` | Approve Lockbox Requests | Allows approving lockbox requests | 
`Governance.LockboxRequests.Deny` | Deny Lockbox Requests | Allows denying lockbox requests |