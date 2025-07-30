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

# View license consumption for finance and operations apps

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

<!-- fwlink: https://go.microsoft.com/fwlink/?linkid=2206011 -->

[!INCLUDE preview-note]

# View and Understand License Consumption for Dynamics 365 finance and operations apps in Power Platform Admin Center

> **Applies to:**  
> Dynamics 365 Finance, Dynamics 365 Supply Chain Management, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Project Operations, Dynamics 365 Team Members, and Dynamics 365 Operations (Legacy licenses)

## Overview

The **User License Consumption (Preview)** experience in Power Platform Admin Center helps admins monitor and manage licensing needs for Dynamics 365 Finance and Operations (F&O) apps. It offers transparency into which users need licenses, which ones are properly assigned, and where gaps exist—so you can take action before per user license validation deadlines.

Key capabilities include:

- Role-based user license analysis  
- Environment-level license requirement breakdown  
- Security role-to-license mapping  
- Drill-down into access-level entitlements  
- Powerful filters for unmet or misaligned licenses  
- Export-ready reports for compliance and planning  

## Access the Report

1. Sign in to [Power Platform Admin Center](https://admin.powerplatform.microsoft.com).
2. Select **Licensing** in the left menu.
3. Choose the **Finance and Operations** tab under **User License Consumption**.

> ⏱️ The report is refreshed every 24 hours. Last updated timestamp appears at the top right of the report.

 :::image type="content" source="media/user-license-consumption-overview.png" alt-text="User License Consumption summary" lightbox="media/user-license-consumption-overview.png":::

## Top-Level Metrics

- **Total users**: All users across connected F&O environments.
- **Users with unassigned licenses**: Users who are assigned roles that require a license but don’t have one provisioned.

These metrics are clickable and provide access to user-level data views.

 :::image type="content" source="media/user-license-consumption-metrics.png" alt-text="User License Consumption summary" lightbox="media/user-license-consumption-metrics.png":::

## Application-Level License Summaries

Each Dynamics 365 application has a dedicated card showing:

- Users requiring a license  
- Licenses purchased and assigned  
- Licenses purchased but unassigned (available to assign)  

Supported applications include:

- Finance  
- Supply Chain Management  
- Commerce  
- Human Resources  
- Project Operations  
- Team Members  
- Operations – Activity  
- Operations (Legacy licenses) 

Click **View all** to drill into the license assignment list for each app.

 :::image type="content" source="media/user-license-consumption-card-view-all.png" alt-text="Download license summary" lightbox="media/user-license-consumption-card-view-all.png":::

## Users with Unassigned Licenses

This view filters the report to highlight users with unmet license assignments.

| Column | Description |
|--------|-------------|
| **Email/User ID** | Entra ID identity |
| **Required License** | Based on role telemetry |
| **Assigned License in M365** | Whether license is provisioned |
| **Missing Licenses** | Echo of required license if not yet assigned |

> ⚠️ Users in this view will be blocked from sign-in once license validation begins.

## Filter and Sort Capabilities

### Filter by Assigned License

Use the **Assigned Licenses in M365** column dropdown to:

- Sort results (ascending/descending)  
- Filter by specific license types (e.g., Finance, SCM, Team Members)

This helps triage misassigned or missing licenses at scale.

 :::image type="content" source="media/user-license-consumption-filtering.png" alt-text="Download license summary" lightbox="media/user-license-consumption-filtering.png":::

### Filter by Missing License

In the **Missing License** column, use the filter to isolate users missing a specific license (e.g., Supply Chain Management only).  
This enables targeted action based on application or priority.

## Drill into User License Details

Click a **Required License** link to open the **Required license details per environment** screen.

| Field | Description |
|-------|-------------|
| **Environment name** | Where the user holds the role |
| **Environment type** | Production or Sandbox |
| **Security role** | Assigned role |
| **Required license** | License obligation triggered by role |

This helps validate **why** a license is needed and in **which environment**.

 :::image type="content" source="media/user-license-consumption-environment-details.png" alt-text="Download license summary" lightbox="media/user-license-consumption-environment-details.png":::

## Analyze Role License Entitlements

From the user’s role, you can drill further into the role-to-license mapping.

### Role License Matrix

- View all compatible licenses for a role (e.g., SCM, Finance Premium)  
- See how many users are correctly licensed vs. not  

### Securable Object Breakdown

View **menu items and access levels** (Read/Write) that contribute to license requirement.

| Field | Description |
|-------|-------------|
| **Securable Type** | e.g., MenuItemDisplay |
| **AOT Name** | Object name in metadata |
| **Access Level** | Read or Write |
| **Entitlement** | Whether it requires a license |

This helps explain the **why** behind a license requirement for each role.

 :::image type="content" source="media/user-license-consumption-role-duty-privilege.png" alt-text="Download license summary" lightbox="media/user-license-consumption-role-duty-privilege.png":::

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

For full entitlement or role mapping detail, use the interactive UI.

 :::image type="content" source="media/user-license-consumption-export-csv.png" alt-text="Download license summary" lightbox="media/user-license-consumption-export-csv.png":::

## Best Practices

- Assign licenses to users with PowerShell automation to scale provisioning  
- Align license assignment with actual usage telemetry, not job titles  
- Use version 10.0.44+ to validate roles using the Security Analysis tool  
- Review monthly and clean up legacy or unused roles  
- Coordinate with procurement to align purchases with system needs  

## Known Limitations (Preview)

- GUIDs may appear in place of names if identity metadata is incomplete  
- Non-production telemetry may be limited  
- Custom roles may require re-analysis to properly align with licensing  
- Reports may differ from LCS, M365 Admin Center, or 3rd party tools  

## Related Resources

- [Dynamics 365 Licensing Guide](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/fin-ops/get-started/licensing-requirements)  
- [Role-Based Security in F&O](https://learn.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/sysadmin/role-based-security)  
- [Group-Based License Assignment in Entra ID](https://learn.microsoft.com/en-us/entra/identity/licensing/group-based)

