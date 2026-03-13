---
title: Elastic compute for finance and operations apps
description: Learn about elastic compute, which provides flexible and scalable compute power for Dynamics 365 finance and operations apps in unified environments.
author: laneswenka
ms.topic: concept-article
ms.date: 03/04/2026
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks
---

# Elastic compute for finance and operations apps

Finance and operations apps in unified environments use **elastic compute** to provide flexible and scalable compute power. Instead of the fixed-size environment tiers that were available in Microsoft Dynamics 365 Lifecycle Services, environments now automatically scale up or down based on actual usage. This approach gives customers the right amount of compute power when they need it, without manual intervention or environment resizing.

## How elastic compute works

In unified environments, the Application Object Server (AOS) tier is the primary compute component for finance and operations apps. Each AOS instance hosts X++ business logic and handles user requests, OData and custom service calls, integration traffic, and batch workloads.

AOS instances are **stateful** and hold user session state in memory. Requests are distributed across AOS instances through internal Azure load balancers, with session affinity ensuring that a user's requests are routed to the same AOS instance for the duration of their session. Persistent data such as metadata and transactional state is stored externally in Azure SQL, caching layers, and blob storage.

Because AOS instances hold session state in memory, scaling up and scaling down behave differently. Adding new AOS instances (scale-up) is seamless and doesn't disrupt active users. However, removing AOS instances (scale-down) requires draining active sessions, so it's reserved for planned maintenance windows or customization deployments, where a natural downtime already occurs. This approach ensures that users never experience unexpected session loss due to a scale-down event.

An environment supports a maximum of **80 AOS instances** total. This limit is split between interactive AOS instances that serve user requests and batch processor AOS instances that handle background jobs.

## Deploy to the middle

When Microsoft provisions a finance and operations environment, it deploys to a **mid-sized baseline** topology. This baseline is:

- **Not the minimum** compute available for the environment
- **Not the maximum** compute available for the environment
- Chosen to handle steady-state interactive usage, normal batch processing, and typical Dataverse and Power Platform integration patterns

By starting in the middle, the platform minimizes the need for cold-start scaling events. Most customer workloads oscillate around this baseline, so the environment is ready for typical usage immediately after provisioning.

### Scale up

When the platform detects increased demand, it scales up from the baseline. Scale-up can be triggered by:

- High concurrent interactive user sessions
- Burst API traffic from OData or custom services
- Heavy batch job processing
- Increased Power Platform-initiated calls through Dataverse virtual tables

During scale-up, more AOS instances are added horizontally, and load is redistributed across them. Batch capacity can also increase independently. Scale-up happens **with no downtime** and is transparent to active users.

### Scale down

Because AOS instances hold session state in memory, scale-down can't happen on demand without risking disruption to active users. Instead, scale-down is **reserved for planned maintenance windows** or when a customer deploys customizations, both of which involve a natural downtime period. During these windows, extra AOS instances are drained and removed, and the environment returns to its baseline topology.

The environment scales down **to the baseline**, not below it. This approach ensures that the environment is always ready for normal workloads when it comes back online.

## Power Platform Requests and compute capacity

Compute capacity for finance and operations apps in unified environments is governed by **Power Platform Requests (PPR)**. PPR serves as the unit of measure for how much compute power is allocated to your environments.

### How PPR translates to AOS capacity

Each AOS instance requires **650,000 PPR** of capacity. The more PPR your tenant has available, the more AOS instances the platform can allocate across your environments, and the more room there is for elastic scaling.

### How you accrue PPR

PPR accrues to your tenant in three ways:

| Source | Amount | Details |
|--------|--------|---------|
| Tenant-wide base | 500,000 PPR | Automatically included with any Dynamics 365 purchase |
| Per-user license accrual | 5,000 PPR per license | Each assigned user license contributes to the tenant's total PPR pool |
| Add-on packs | 50,000 PPR per pack | Purchased from the [Microsoft 365 admin center](https://admin.microsoft.com) |

### Example: Impact of user licenses on PPR and AOS capacity

The following tables show how PPR accrues and translates to AOS capacity for two typical customer sizes.

**Small customer: 20 user licenses (minimum purchase)**

| Component | Calculation | PPR |
|-----------|-------------|-----|
| Tenant-wide base | — | 500,000 |
| Per-user license accrual | 20 &times; 5,000 | 100,000 |
| **Total from licenses** | | **600,000** |
| **AOS from PPR** | 600,000 &divide; 650,000 | **&lt; 1 AOS** from PPR alone |

Every sandbox and production environment is provisioned with a **minimum of 2 AOS instances** regardless of available PPR. This ensures the environment is functional and provides basic redundancy. To double their AOS capacity to 4 AOS, this customer could purchase add-on PPR packs.

| Component | Calculation | PPR |
|-----------|-------------|-----|
| Total from licenses | | 600,000 |
| Add-on packs purchased | 14 packs &times; 50,000 | 700,000 |
| **New total PPR** | | **1,300,000** |
| **New AOS capacity** | 1,300,000 &divide; 650,000 | **2 additional AOS** beyond baseline (4 AOS total) |

**Large customer: 500 user licenses**

| Component | Calculation | PPR |
|-----------|-------------|-----|
| Tenant-wide base | — | 500,000 |
| Per-user license accrual | 500 &times; 5,000 | 2,500,000 |
| **Total from licenses** | | **3,000,000** |
| **AOS from PPR** | 3,000,000 &divide; 650,000 | **~4 additional AOS** beyond baseline (6 AOS total) |

With the minimum of 2 AOS plus ~4 AOS of PPR-based headroom, this customer starts with 6 AOS. To double their total capacity to 12 AOS, this customer could purchase add-on packs.

| Component | Calculation | PPR |
|-----------|-------------|-----|
| Total from licenses | | 3,000,000 |
| Add-on packs purchased | 70 packs &times; 50,000 | 3,500,000 |
| **New total PPR** | | **6,500,000** |
| **New AOS capacity** | 6,500,000 &divide; 650,000 | **10 additional AOS** beyond baseline (12 AOS total) |

Add-on packs of 50,000 PPR each are available from the [Microsoft 365 admin center](https://admin.microsoft.com). These totals determine the compute capacity available for elastic scaling across all finance and operations environments in the tenant.

### Relationship between PPR and scaling

Although PPR governs compute capacity, it's important to understand the distinction between **PPR as a capacity entitlement** and **PPR as a request throttling limit** for Power Platform operations such as Dataverse calls, plugins, and flows.

Heavy Power Platform usage that generates requests through Dataverse virtual tables into finance and operations apps can increase demand on AOS instances. This demand can trigger elastic scale-up. However, increasing compute capacity doesn't increase Power Platform request limits, and increasing request limits doesn't guarantee additional compute beyond what the elastic scaling model provides.

## Unified Developer Environments

[Unified Developer Environments (UDE)](/power-platform/developer/unified-experience/finance-operations-dev-overview) are an exception to elastic compute scaling. While sandbox and production environments have a minimum of 2 AOS instances, **UDE environments are limited to a minimum and maximum of 1 AOS instance** and don't scale up or down. This limitation is due to technical constraints with the Visual Studio debugger, which must attach to a specific AOS process. A single AOS instance ensures that the debugging experience remains stable and predictable.

For development and testing workloads that require multiple AOS instances, use a sandbox environment instead.

## Key differences from Lifecycle Services

In Lifecycle Services, sandbox environments were available as fixed tiers—Tier 2, Tier 3, Tier 4, and Tier 5—each with progressively more compute resources. Customers had to select a tier at purchase time, often through their Enterprise Agreement or Cloud Solution Provider (CSP), and changing tiers later required contract amendments. This created significant **operational friction** when customers realized they needed more (or less) compute than they originally purchased. Production environments also had a set of tiers behind the scenes, but this sizing was never fully transparent to customers.

This mismatch between sandbox and production tiers led to a critical expectation gap. Customers who performed performance testing in a Tier 2 sandbox often saw dramatically different results in production, because the underlying compute resources didn't match. There was no reliable way to predict production performance from sandbox testing.

In unified environments, **all sandbox and production environments get equal maximum scale** for a given customer tenant. The elastic compute model ensures that the same PPR-based capacity pool applies across all environments. This means customers who performance-test in a sandbox environment see **relative performance comparable to what they can expect in production**, closing the expectation gap that existed in Lifecycle Services.

The following table summarizes the key differences.

| Aspect | Lifecycle Services | Unified environments |
|--------|-------------------|----------------------|
| Sandbox sizing | Fixed tiers (Tier 2–5) selected at purchase | Elastic, scales automatically based on PPR capacity |
| Production sizing | Fixed tiers, not fully transparent to customers | Elastic, same capacity model as sandbox |
| Sandbox vs. production parity | Different tiers led to performance expectation gaps | Equal maximum scale ensures consistent performance testing |
| Changing compute capacity | Required EA or CSP contract amendments | Purchase PPR add-on packs from the Microsoft 365 admin center |
| Scaling | Manual tier change with downtime | Automatic scale-up (no downtime), scale-down during maintenance windows |
| Capacity model | Environment slots purchased up front | PPR-based capacity pool shared across environments |
| Maximum AOS per environment | Varied by tier | Up to 80 AOS instances (interactive + batch) |
| Developer environments | All-in-one Azure VMs | UDE with single AOS instance |

## Related content

- [Overview of unified admin experience for finance and operations apps](finance-operations-apps-overview.md)
- [Finance and operations storage capacity](../finance-operations-storage-capacity.md)
