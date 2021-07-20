---
title: "View policies and scope  | MicrosoftDocs"
description: View policies and policy scope.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/19/2021
author: jimholtz
ms.subservice: admin
ms.author: jimholtz
ms.reviewer: jimholtz
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# View policy

Using the view policy feature, environment admins can view tenant-level policies and policies within environments that the admin has access to, at an individual policy level. Non-admins can also view tenant-level policies using this feature.

Jim - add steps.

:::image type="content" source="media/dlp-view-policies2.png" alt-text="View DLP policies list.":::

## Policy scope

DLP policies can be created at both the tenant and environment level. Tenant admins have the permissions to create tenant-level policies; environment admins have the permissions to create environment-level policies.

### Tenant-level policies

Tenant admins can define three types of scopes for tenant-level data policies: 

Option 1: Apply to all environments.<br>
Option 2: Apply to multiple environments (but not all).<br>
Option 3: Apply to all environments except certain specifically excluded ones.

It's typical for tenant admins to define DLP policies for their entire tenant but exclude certain environments, as described in option 3. For the excluded environments, tenant admins can define alternate DLP policies and apply them to multiple environments, as described in option 2. Option 1 is for DLP policy rules that must apply across the entire tenant, without exception.

Tenant admins can define more than one multiple-tenant&ndash;level policy for the environments in their tenant. These policies can be set for mutually exclusive or overlapping environment scopes.

### Environment-level policies

Environment admins can define environment-level data policies for one environment at a time. Environment admins can't exclude their environments from tenant-level policies. Therefore, all the restrictions defined by the tenant admins scoped for their environment still apply, in addition to any environment-level policy that they have individually defined for their environment. 

As is true of tenant admins with tenant-level policies, environment admins can define more than one environment-level policy for their environment.

Even though environment admins might manage more than one environment, they can't include more than one environment in the environment-level policy. They must define individual environment-level policies for each environment that they manage. 




[!INCLUDE[footer-include](../includes/footer-banner.md)]
