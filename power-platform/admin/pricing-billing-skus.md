---
title: Licensing overview for Microsoft Power Platform
description: Learn about Microsoft Power Platform license types and where to find current licensing, capacity, and consumption guidance.
author: dileepsinghmicrosoft
ms.topic: overview
ms.date: 08/25/2026
ms.subservice: admin
ms.author: dileeps
ms.reviewer: ellenwehrle
contributors:
  - Ravi-Chada
  - srpoduri
search.audienceType:
  - admin
---

# Licensing overview for Microsoft Power Platform

Microsoft Power Platform licensing includes user licenses, capacity-based licenses, and consumption-based meters. The licenses and use rights that your organization needs depend on the products, features, data sources, and environments that you use.

> [!IMPORTANT]
> This article provides a general overview. Licensing programs and product terms can change. For complete and current terms, see the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130) and your licensing agreement. Contact your Microsoft account representative or licensing partner for guidance about your specific scenario.

## Find product-specific licensing guidance

Use the following resources for detailed licensing and capacity information.

| Product or service | Licensing guidance |
|---|---|
| Power Apps | [Purchase Power Apps](signup-for-powerapps-admin.md) and [Power Apps licensing FAQs](powerapps-licensing-faq.md) |
| Power Automate | [Types of Power Automate licenses](power-automate-licensing/types.md) |
| Microsoft Copilot Studio | [Microsoft Copilot Studio Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2320995) and [Manage Copilot Credits and capacity](manage-copilot-studio-copilot-credits-capacity.md) |
| Power Pages | [Power Pages capacity management](/power-pages/admin/capacity-management) |
| Power BI | [Power BI pricing and licensing](https://powerbi.microsoft.com/pricing/) |
| AI Builder | [AI Builder licensing](/ai-builder/administer-licensing) |
| Microsoft Dataverse | [Dataverse storage capacity](capacity-storage.md) |

## Understand license and billing options

Microsoft Power Platform capabilities can be licensed through standalone licenses, use rights included with other Microsoft products, capacity add-ons, or pay-as-you-go meters.

### Standalone licenses

Standalone licenses provide use rights for a specific Microsoft Power Platform product. For example, Power Apps Premium and Power Automate Premium provide premium capabilities for licensed users. Product licenses can also include Dataverse and other capacity entitlements.

Power Apps per app is a capacity-based license for running a specific app in an environment. Effective January 2, 2026, the Power Apps per app SKU is no longer available to new customers through some purchasing channels. Existing customer and Cloud Solution Provider availability varies. For details, see [Power Apps per app license sales end](https://www.microsoft.com/licensing/news/power-app-per-app-end-of-sale) and [About Power Apps per app plans](about-powerapps-perapp.md).

## Trial plans

Power Apps and Power Automate offer trials that let users evaluate premium capabilities. Trial availability, duration, and self-service sign-up can vary by product and tenant settings. Use the product-specific licensing guidance to review current trial terms.

## Power Apps and Power Automate for Microsoft 365

Some Microsoft 365 licenses include limited Power Apps and Power Automate use rights. These use rights are intended for scenarios that use Microsoft 365 data and standard connectors. They don't provide the same rights as standalone premium licenses.

### Dataverse capabilities with Microsoft 365 licenses

Some Microsoft 365 applications also include limited Dataverse use rights for data and functionality required by those applications. These rights don't entitle users to run standalone custom apps, premium flows, or Copilot Studio agents. Refer to the service description for the Microsoft 365 application and the Power Platform Licensing Guide for the applicable use rights.

The Microsoft 365 admin center can display a **Dataverse** service plan for licenses that include these limited rights. The presence of this service plan doesn't provide the same use rights as a standalone Power Apps, Power Automate, or Copilot Studio license.

## Power Apps and Power Automate for Dynamics 365

Qualifying Dynamics 365 licenses include Power Apps and Power Automate use rights for extending and customizing the licensed Dynamics 365 application. These rights must be used in the context of the licensed Dynamics 365 application.

For details, see the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/p/?LinkId=866544) and [Power Automate seeded licenses for Dynamics 365](power-automate-licensing/deep-dive-on-specific-license.md).

## Capacity add-ons

Capacity add-ons provide tenant-level or environment-level capacity for specific services and features. Examples include Dataverse storage, AI Builder credits, Power Pages capacity, and Copilot Credits.

Admins can view and allocate supported capacity in the **Licensing** area of the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). For more information, see [Capacity add-ons](capacity-add-on.md).

## Power Apps Developer Plan

The free [Power Apps Developer Plan](/power-apps/maker/developer-plan) provides an individual developer environment for building and testing apps, flows, and other solution assets. Developer environments are intended for development and test use, not production workloads.

## Pay-as-you-go plan

Pay-as-you-go links an environment to an Azure subscription through a billing plan. Eligible usage is billed through Azure meters instead of requiring all capacity to be purchased in advance. Examples include meters for Power Apps, Power Automate, Dataverse, Power Pages, and Copilot Studio usage.

For details about supported meters, prerequisites, and setup, see [Pay-as-you-go plan](pay-as-you-go-overview.md).

## Tenant-level special licenses

Some licenses include tenant-level capabilities that make users eligible to be synchronized into Dataverse environments at runtime. A user's presence in an environment doesn't grant access to Dataverse data. The user must still have an appropriate security role and any required product license.

The SKUs and capability identifiers that provide these rights can change. Review the current Power Platform Licensing Guide instead of relying on a static SKU list.

## What users are licensed

The following reporting experiences provide different views of purchased licenses, assignments, capacity, and consumption.

| Reporting experience | Roles that can access the experience | What admins can see |
|---|---|---|
| [Microsoft 365 admin center](https://admin.microsoft.com/) | [**Billing Administrator**](/entra/identity/role-based-access-control/permissions-reference#billing-administrator) for purchased products and subscriptions.<br>[**License Administrator**](/entra/identity/role-based-access-control/permissions-reference#license-administrator) for user license assignments.<br>[**Global Administrator**](/entra/identity/role-based-access-control/permissions-reference#global-administrator) can access both areas. | Products and subscriptions purchased by the organization, available licenses, and licenses assigned to individual users. |
| [Power Apps license consumption report (preview)](view-license-consumption-issues.md) in the Power Platform admin center | [**Power Platform Administrator**](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) and [**Dynamics 365 Administrator**](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator) can access tenant and environment views.<br>[**Environment Admin**](view-license-consumption-issues.md#who-can-access-and-set-up) can access the environment view. Tenant admins can optionally allow environment admins to access the tenant summary. | Purchased, assigned, and used Power Apps licenses; active users; per-app allocation and consumption; pay-as-you-go plans; usage trends; and users who might need a standalone license. |
| [Power Automate license consumption report (preview)](view-license-consumption-power-automate.md) in the Power Platform admin center | [**Power Platform Administrator**](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) and [**Dynamics 365 Administrator**](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator). | Purchased, assigned, and consumed Power Automate licenses; users and flows consuming each license type; flow activity and premium features; and flows that require licensing attention. |
| [Capacity add-ons](capacity-add-on.md) in the Power Platform admin center | [**Power Platform Administrator**](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) and [**Dynamics 365 Administrator**](/entra/identity/role-based-access-control/permissions-reference#dynamics-365-administrator) can view and allocate supported add-on capacity. | Purchased, available, allocated, and consumed capacity by product and environment. Admins can also download available capacity usage reports. |

You can also export assigned Power Apps and Power Automate licenses by using the following PowerShell command:

```powershell
Get-AdminPowerAppLicenses -OutputFilePath '<licenses.csv>'
```

The export includes users who accessed a Power Platform service. It might not include users who were assigned a license but never accessed the service, and license assignment changes can take up to seven days to appear.

For information about the export and administration modules, see [PowerShell support for Power Apps and Power Automate](powerapps-powershell.md#export-a-list-of-assigned-user-licenses).
