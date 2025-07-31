---
title: View license consumption for finance and operations apps (Preview)
description: Learn how to view your organization's User license consumption for finance and operations apps. 
author: ceian
ms.date: 07/31/2025
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.subservice:
ms.author: ceian
search.audienceType: 
 - admin
ms.custom:
  - bap-template
  - sfi-image-nochange
---

# View license consumption for Dynamics 365 finance and operations apps

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

The User License Consumption experience in Power Platform admin center lets admins monitor and manage licensing needs for Microsoft Dynamics 365 finance and operations apps. It shows which users need licenses, which ones are properly assigned, and where gaps exist so you can take action before per-user license validation deadlines.

Key capabilities include:

- Role-based user license analysis  
- Environment-level license requirement breakdown  
- Security role-to-license mapping  
- Drill-down actions into access-level entitlements
- Filters for unmet or misaligned licenses  
- Export-ready reports for compliance and planning

## Access user license consumption reporting

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. Select **Licensing** in the left menu.
1. Select the **Finance and Operations** tab under **User License Consumption**.

> [!NOTE]
> The report is refreshed every 24 hours. Last updated timestamp appears at the top of the report.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-overview.png" alt-text="User License Consumption summary" lightbox="media/fno-user-licensing/user-license-consumption-overview.png":::

## Top-level metrics

- **Total users**: All users across connected finance and operations environments.
- **Users with unassigned licenses**: Users who are assigned roles that require a license but do not have a a license assigned in in [Microsoft 365 admin center](https://admin.microsoft.com).

You can select metrics to view user-level details.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-metrics.png" alt-text="User License Consumption metrics" lightbox="media/fno-user-licensing/user-license-consumption-metrics.png":::

## Product-level license summaries

Each Dynamics 365 finance and operations product has a card displaying:

- Total users requiring a license  
- By product, *base licenses* purchased and assigned  
- By product, *attach licenses* purchased and assigned  
- By product, *base licenses* purchased but unassigned (available to assign)  
- By product, *attach licenses* purchased but unassigned (available to assign)  

Supported products for User License Consumption reporting include:

- Commerce  
- Finance  
- Human Resources  
- Project Operations  
- Team Members  
- Operations – Activity  
- Operations (Legacy licenses)
- Supply Chain Management  

Select **View all** to drill into the license assignments for users of each product.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-card-view-all.png" alt-text="User Licensing Consumption Summary" lightbox="media/fno-user-licensing/user-license-consumption-card-view-all.png":::

## Users with unassigned licenses

This view filters the report to show users with missing license assignments in [Microsoft 365 admin center](https://admin.microsoft.com).

| Column | Description |
|--------|-------------|
| **Email/User ID** | Entra ID identity |
| **Required License** | Based on security role corresponding duties and privileges |
| **Assigned License in M365** | Finance and Operations app license(s) assigned to the user in  [Microsoft 365 admin center](https://admin.microsoft.com) |
| **Missing Licenses** | Required Finance and Operations app license(s) not assigned to the user in [Microsoft 365 admin center](https://admin.microsoft.com) |

> [!IMPORTANT]
> Users in the **Users with unassigned licenses** view will be unable to sign in to the system once license validation starts.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-unassigned-license-users.png" alt-text="Users with unassigned licenses" lightbox="media/fno-user-licensing/user-license-consumption-unassigned-license-users.png":::

## Filter and sort capabilities

You can filter and sort by assigned licenses or by missing licenses.

### Filter and sort by assigned license

Use the **Assigned Licenses in M365** column dropdown to find missing or incorrectly assigned licenses at scale:

- Sort results (ascending or descending).
- Filter by specific license types, like Commerce, Finance, Human Resources, Supply Chain Management, or Team Members.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-filtering.png" alt-text="User Licensing Consumption Filtering" lightbox="media/fno-user-licensing/user-license-consumption-filtering.png":::

### Filter by missing license

In the **Missing license** column, use the filter to show users missing a specific license, like Supply Chain Management. This lets you assign the right base licenses based on product.

## Drill into user license details

On a user, select a **Required license** link to open the **Required license details per environment** screen.

| Field | Description |
|-------|-------------|
| **Environment name** | Where the user is assigned the security role |
| **Environment type** | Production |
| **Security role** | Assigned role |
| **Required license** | License required triggered by role |

This helps you check why a license is needed and in which environment.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-environment-details.png" alt-text="User Licensing Consumption Environment details" lightbox="media/fno-user-licensing/user-license-consumption-environment-details.png":::

## Analyze role license entitlements

From the user's role, you can drill further into the security role-to-license mapping.

### Role license matrix

- View all compatible licenses for a security role, like Commerce, Finance, Human Resources, Supply Chain, Team members, or activity.  
- See how many users are correctly licensed vs. incorrectly licensed

### Securable object breakdown

View **menu items and access levels** (Read/Write) that contribute to license requirements to better understand license requirements for each role:

| Field | Description |
|-------|-------------|
| **Securable Type** | Example: `MenuItemDisplay` |
| **AOT Name** | Application Object Tree name |
| **Access Level** | Read or Write |
| **Entitled** | Included in the mapped license scope |
| **Not Entitled** | Not included in the mapped license scope |
| **Not Required** | Doesn't affect license scope |

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-role-duty-privilege.png" alt-text="User Licensing Consumption Role Duty Privilege" lightbox="media/fno-user-licensing/user-license-consumption-role-duty-privilege.png":::

## Export to CSV

Select **Export to CSV** in the top-right corner to export user data.

> 🧾 The exported file contains only the following columns:
>
> - `TenantId`  
> - `UserEmail`  
> - `UserId`  
> - `AssignedLicense(s)`  
> - `MissingLicense(s)`  
> - `RefreshedOn`  

For full entitlement or role mapping details, use the views in Power Platform admin center.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-export-csv.png" alt-text="User Licensing Consumption Export CSV" lightbox="media/fno-user-licensing/user-license-consumption-export-csv.png":::

## Best practices

- Assign licenses to users with PowerShell automation for [bulk user provisioning](microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell).
- Align license assignment with actual usage telemetry, not job titles.  
- Use version 10.0.44 or later to validate roles using the [User security governance](/dynamics365/fin-ops-core/fin-ops/sysadmin/security-gov-overview) feature.
- Review monthly and remove [dormant user security accounts in finance and operations](https://community.dynamics.com/blogs/post/?postid=164a42b4-fbf7-43ea-b4db-a07733b8bafb).
- Coordinate with procurement to align purchases with required licenses needed for users.

## Known limitations

- For finance and operations apps in Dynamics 365, a GUID uniquely ties a user record to an identity in Microsoft Entra ID. A GUID can appear instead of an email address if identity metadata is incomplete or users are deleted in Entra but user records aren't removed from finance and operations security role assignments.
- Custom security roles might need reanalysis to align with licensing.

## Related resources

- [Dynamics 365 licensing guide](https://go.microsoft.com/fwlink/?LinkId=866544)
- [User security governance overview](/dynamics365/fin-ops-core/fin-ops/sysadmin/security-gov-overview)
- [Security governance FAQ](https://go.microsoft.com/fwlink/?linkid=2319108)  
- [Assign Microsoft 365 licenses to user accounts with PowerShell](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell)
