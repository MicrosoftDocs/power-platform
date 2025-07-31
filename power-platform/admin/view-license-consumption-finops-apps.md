---
title: (Preview) View license consumption for finance and operations apps 
description: Learn how to view your organization's User license consumption for finance and operations apps. 
author: ceian
ms.date: 09/25/2024
ms.reviewer: sericks
ms.topic: how-to
ms.subservice:
ms.author: ceian
search.audienceType: 
 - admin
ms.custom:
  - bap-template
  - sfi-image-nochange
---

# View License Consumption for Dynamics 365 finance and operations apps

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

The **User License Consumption (Preview)** experience in Power Platform admin center helps admins monitor and manage licensing needs for Dynamics 365 finance and operations apps. It offers transparency into which users need licenses, which ones are properly assigned, and where gaps exist—so you can take action before per user license validation deadlines.

Key capabilities include:

- Role-based user license analysis  
- Environment-level license requirement breakdown  
- Security role-to-license mapping  
- Drill-down into access-level entitlements  
- Powerful filters for unmet or misaligned licenses  
- Export-ready reports for compliance and planning  

## Access User License Consumption reporting

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Licensing** in the left menu.
3. Choose the **Finance and Operations** tab under **User License Consumption**.

> [!Note]
> The report is refreshed every 24 hours. Last updated timestamp appears at the top of the report.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-overview.png" alt-text="User License Consumption summary" lightbox="media/fno-user-licensing/user-license-consumption-overview.png":::

## Top-Level Metrics

- **Total users**: All users across connected finance and operations environments.
- **Users with unassigned licenses**: Users who are assigned roles that require a license but don’t have one provisioned.

These metrics are clickable and provide access to user-level views.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-metrics.png" alt-text="User License Consumption metrics" lightbox="media/fno-user-licensing/user-license-consumption-metrics.png":::

## Product-Level License Summaries

Each Dynamics 365 finance and operations product has a card displaying:

- Total users requiring a license  
- By Product, Base licenses purchased and assigned  
- By Product, Attach licenses purchased and assigned  
- By Product, Base Licenses purchased but unassigned (available to assign)  
- By Product, Attach Licenses purchased but unassigned (available to assign)  

Supported products for User License Consumption reporting include:

- Commerce  
- Finance  
- Human Resources  
- Project Operations  
- Team Members  
- Operations – Activity  
- Operations (Legacy licenses) 
- Supply Chain Management  

Click **View all** to drill into the license assignments for users of each product.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-card-view-all.png" alt-text="User Licensing Consumption Summary" lightbox="media/fno-user-licensing/user-license-consumption-card-view-all.png":::

## Users with Unassigned Licenses

This view filters the report to highlight users with missing license assignments in Microsoft 365 admin center.

| Column | Description |
|--------|-------------|
| **Email/User ID** | Entra ID identity |
| **Required License** | Based on role telemetry |
| **Assigned License in M365** | Whether license is provisioned |
| **Missing Licenses** | Echo of required license if not yet assigned |

> [!IMPORTANT]
> Users in the (Users with unassigned licenses) view will be unable to login to the system once license validation begins.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-unassigned-license-users.png" alt-text="Users with unassigned licenses" lightbox="media/fno-user-licensing/user-license-consumption-unassigned-license-users.png":::

## Filter and Sort Capabilities

### Filter by Assigned License

Use the **Assigned Licenses in M365** column dropdown to:

- Sort results (ascending/descending)  
- Filter by specific license types (for example, Commerce, Finance, Human Resources, Supply Chain Management, Team Members)

This helps triage misassigned or missing licenses at scale.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-filtering.png" alt-text="User Licensing Consumption Filtering" lightbox="media/fno-user-licensing/user-license-consumption-filtering.png":::

### Filter by Missing License

In the **Missing License** column, use the filter to isolate users missing a specific license (for example, Supply Chain Management only), enabling targeted action (for example assigning Supply Chain Management base licenses) based on product.

## Drill into User License Details

Click a **Required License** link to open the **Required license details per environment** screen.

| Field | Description |
|-------|-------------|
| **Environment name** | Where the user is assigned the security role |
| **Environment type** | Production |
| **Security role** | Assigned role |
| **Required license** | License required triggered by role |

This helps validate **why** a license is needed and in **which environment**.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-environment-details.png" alt-text="User Licensing Consumption Environment details" lightbox="media/fno-user-licensing/user-license-consumption-environment-details.png":::

## Analyze Role License Entitlements

From the user’s role, you can drill furtherinto the role-to-license mapping.

### Role License Matrix

- View all compatible licenses for a role (e.g., Commerce, Finance, Human Resources)  
- See how many users are correctly licensed vs. not  

### Securable Object Breakdown

View **menu items and access levels** (Read/Write) that contribute to license requirement.

| Field | Description |
|-------|-------------|
| **Securable Type** | e.g., MenuItemDisplay |
| **AOT Name** | Application Object tree name |
| **Access Level** | Read or Write |
| **Entitled** | Included in the mapped license scope |
| **Not Entitled** | Not included in the mapped license scope |
| **Not Required** | Doesn’t affect license scope |


This helps explain the **why** behind a license requirement for each role.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-role-duty-privilege.png" alt-text="User Licensing Consumption Role Duty Privilege" lightbox="media/fno-user-licensing/user-license-consumption-role-duty-privilege.png":::

## Export to CSV

You can export user data by selecting **Export to CSV** in the top-right corner.

> 🧾 The exported file contains only the following columns:
>
> - `TenantId`  
> - `UserEmail`  
> - `UserId`  
> - `AssignedLicense(s)`  
> - `MissingLicense(s)`  
> - `RefreshedOn`  

For full entitlement or role mapping detail, use the views in Power Platform admin center.

 :::image type="content" source="media/fno-user-licensing/user-license-consumption-export-csv.png" alt-text="User Licensing Consumption Export CSV" lightbox="media/fno-user-licensing/user-license-consumption-export-csv.png":::

## Best Practices

- Assign licenses to users with PowerShell automation for bulk user provisioning  
- Align license assignment with actual usage telemetry, not job titles  
- Use version 10.0.44 (or later) to validate roles using the [User Security Governance](/dynamics365/fin-ops-core/fin-ops/sysadmin/security-gov-overview) feature 
- Review monthly and remove [dormant user security accounts in Finance and Operations](https://community.dynamics.com/blogs/post/?postid=164a42b4-fbf7-43ea-b4db-a07733b8bafb)
- Coordinate with procurement to align purchases with requires licenses needed for users  

## Known Limitations

- For Dynamics 365 Finance and Operations, a GUID is how the system uniquely ties a user record to a identity in Entra ID. A GUID may appear in place of an email address if identity metadata is incomplete or users have been deleted in Entra but user records not been removed from Finance and Operations security role assignements 
- Custom security roles may require re-analysis to properly align with licensing  

## Related Resources

- [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544)
- [User security governance overview](/dynamics365/fin-ops-core/fin-ops/sysadmin/security-gov-overview)
- [Dynamics 365 Finance and Operations Apps Security Role FAQ](https://go.microsoft.com/fwlink/?linkid=2319108)  
- [Assign Microsoft 365 licenses to user accounts with PowerShell](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell)