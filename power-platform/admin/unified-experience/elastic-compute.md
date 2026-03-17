---
title: Elastic compute for finance and operations apps
description: Learn about elastic compute, which provides flexible and scalable compute power for Dynamics 365 finance and operations apps in unified environments.
author: laneswenka
ms.topic: concept-article
ms.date: 03/17/2026
ms.subservice: admin
ms.author: laswenka
ms.reviewer: sericks

---

# Elastic compute for finance and operations apps

Finance and operations apps in unified environments use *elastic compute* to provide flexible and scalable compute power. Instead of selecting a fixed-size environment tier at purchase time, all your sandbox and production environments draw from a shared capacity pool and automatically scale based on actual usage.

This means:

- **Sandbox and production environments get the same performance model.** Performance testing in a sandbox environment reflects what you can expect in a production environment&mdash;no more guessing across tiers.
- **You don't pick a tier.** Your compute capacity is determined by your Power Platform Request (PPR) entitlement and scales automatically.
- **Adding capacity is simple.** Purchase more PPR to increase your compute ceiling, or add storage to create more environments&mdash;no contract amendments or support tickets required.

## How elastic compute works

In unified environments, the Application Object Server (AOS) tier is the primary compute component for finance and operations apps. Each AOS instance hosts X++ business logic and handles user requests, OData and custom service calls, integration traffic, and batch workloads.

AOS instances are stateful and hold user session state in memory. Requests are distributed across AOS instances through internal Azure load balancers, with session affinity ensuring that a user's requests are routed to the same AOS instance for the duration of their session. Persistent data such as metadata and transactional state is stored externally in Azure SQL, caching layers, and blob storage.

Because AOS instances hold session state in memory, scaling up and scaling down behave differently. Adding new AOS instances (scale-up) is seamless and doesn't disrupt active users. However, removing AOS instances (scale-down) requires draining active sessions, so it's reserved for planned maintenance windows or customization deployments, where a natural downtime already occurs. This approach ensures that users never experience unexpected session loss due to a scale-down event.

An environment supports a maximum of **80 AOS instances** total, split between up to 40 interactive AOS instances that serve user requests and up to 40 batch processor AOS instances that handle background jobs.

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

### Minimum and maximum AOS

Every sandbox and production environment is provisioned with a **minimum of 2 AOS instances** (1 interactive, 1 batch) regardless of available PPR. This ensures the environment is functional and provides basic redundancy. The **maximum is 80 AOS instances** (40 interactive, 40 batch).

### Example: PPR and AOS at different scales

The following table shows how PPR accrues and translates to AOS capacity across a range of customer sizes. Each row includes only licenses and the tenant-wide base—add-on packs can increase the total further.

| User licenses | PPR calculation | Total PPR | AOS capacity |
|---------------|-----------------|-----------|--------------|
| 20 (minimum) | 500K + (20 &times; 5K) | 600,000 | 2 AOS (floor) |
| 100 | 500K + (100 &times; 5K) | 1,000,000 | 2 AOS |
| 250 | 500K + (250 &times; 5K) | 1,750,000 | 2 AOS |
| 500 | 500K + (500 &times; 5K) | 3,000,000 | 4 AOS |
| 1,000 | 500K + (1,000 &times; 5K) | 5,500,000 | 8 AOS |
| 2,500 | 500K + (2,500 &times; 5K) | 13,000,000 | 20 AOS |
| 5,000 | 500K + (5,000 &times; 5K) | 25,500,000 | 39 AOS |
| 10,000+ | 500K + (10,000 &times; 5K) | 50,500,000 | 77 AOS |

If the PPR formula yields fewer than 2 AOS, the environment still receives the 2 AOS minimum. If it yields more than 80, the environment is capped at 80.

### Increasing capacity with add-on packs

If your license-based PPR doesn't provide enough AOS capacity, you can purchase **add-on packs of 50,000 PPR each** from the [Microsoft 365 admin center](https://admin.microsoft.com). For example, a customer with 20 licenses (600,000 PPR) could purchase 14 add-on packs (700,000 PPR) to reach 1,300,000 total PPR—enough for 2 AOS from PPR, which combined with the 2 AOS minimum gives 4 AOS total.

These totals determine the compute capacity available for elastic scaling across all finance and operations environments in the tenant.

### PPR serves two purposes

PPR plays two distinct roles, and it's important to understand both:

1. **Capacity entitlement.** PPR determines how many AOS instances your environments can scale to, as described in this article.
2. **Request throttling limit.** PPR also governs throttling limits for Power Platform operations such as Dataverse calls, plug-ins, and flows.

These roles are related but independent. Purchasing more PPR increases your AOS compute ceiling *and* raises your Power Platform request limits. However, heavy Dataverse traffic through virtual tables into finance and operations apps can trigger elastic scale-up to handle the load, even though the request limits themselves are a separate mechanism.

## Unified Developer Environments

[Unified Developer Environments (UDE)](/power-platform/developer/unified-experience/finance-operations-dev-overview) are an exception to elastic compute scaling. While sandbox and production environments have a minimum of 2 AOS instances, **UDE environments are limited to a minimum and maximum of 1 AOS instance** and don't scale up or down. This limitation is due to technical constraints with the Visual Studio debugger, which must attach to a specific AOS process. A single AOS instance ensures that the debugging experience remains stable and predictable.

For development and testing workloads that require multiple AOS instances, use a sandbox environment instead.

## Key differences from Lifecycle Services

In Lifecycle Services, environments were tied to fixed tiers and purchased as individual slots. This model created friction in three areas:

- **Tier lock-in.** Sandbox environments came in fixed tiers (Tier 2–5), each with progressively more compute. Customers selected a tier at purchase time through their Enterprise Agreement or Cloud Solution Provider, and changing tiers later required contract amendments.
- **Sandbox/production performance gap.** Production environments had different tiers and compute profiles than sandboxes. Performance testing in a Tier 2 sandbox couldn't reliably predict production behavior, because the underlying resources didn't match.
- **Scaling required support.** To get more compute within a tier, customers had to open support tickets and escalate. To get a second production environment, they needed to create a new Lifecycle Services project with a separate license minimum.

In unified environments, these constraints are eliminated. **All sandbox and production environments draw from the same PPR-based capacity pool.** Performance testing in a sandbox reflects what you can expect in production, because both environment types share the same elastic compute model and maximum scale.

The following table summarizes the key differences.

| Aspect | Lifecycle Services | Unified environments |
|--------|-------------------|----------------------|
| Compute model | Fixed tiers selected at purchase time | Elastic, scales automatically based on PPR |
| Sandbox = production? | No—different tiers, different SQL, different AOS counts | Yes—same capacity model and maximum scale |
| Changing capacity | EA/CSP contract amendments or support tickets | Purchase PPR add-on packs from the Microsoft 365 admin center |
| Scaling behavior | Manual tier change with downtime | Automatic scale-up (no downtime), scale-down during maintenance |
| Creating environments | Purchase addon slots per tier | Available storage (1 GB required) |
| Multiple production environments | Required a new Lifecycle Services project | Provision directly from the tenant capacity pool |
| Performance testing reliability | Sandbox tier mismatch made results unreliable | Sandbox and production share the same compute ceiling |
| Maximum AOS per environment | Varied by tier (3–12 AOS) | Up to 80 AOS instances (40 interactive + 40 batch) |
| Developer environments | Cloud-hosted Azure VMs | Unified Developer Environments with single AOS instance |

## Related content

- [Overview of unified admin experience for finance and operations apps](finance-operations-apps-overview.md)
- [Finance and operations storage capacity](../finance-operations-storage-capacity.md)
