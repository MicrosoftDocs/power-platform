---
title: Managed availability
description: Learn how to govern Power Platform to ensure that its capabilities are harnessed responsibly and effectively.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/04/2025
author: akadrno
ms.custom: NewPPAC
ms.author: kauguillard 
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin
---

# Managed availability
[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Managed availability provides robust capabilities to ensure continuous uptime, seamless failover, and enterprise-grade resilience for mission-critical applications and AI workloads. Built on Microsoft Azure, these features safeguard businesses against failures, outages, and disruptions, ensuring high availability without compromising performance.

## What can you do with managed availability?
Managed Availability is a suite of premium capabilities designed to ensure the resilience, responsiveness, and reliability of AI agents built with Microsoft Copilot Studio. It provides seamless failover, self-healing systems, and disaster-proof architecture, enabling businesses to run their intelligent automation workflows securely and at scale. By proactively mitigating disruptions and maintaining uninterrupted operations, Managed Availability empowers organizations to safeguard their AI-driven processes against a wide range of unforeseen events. 

## Increased Resiliency with Azure Availability Zones
Managed availability leverages Azure availability zones to replicate production environments across multiple datacenters within a region. These zones are physically separated and operate independently with distinct power, networking, and cooling systems. This ensures:

- Near Zero Data Loss: Synchronous replication across typically two and in some cases three zones.
- Rapid Failover: Recovery time objective (RTO) of less than five minutes.
- Minimal Service Disruption: Automatic redirection of traffic during zone-level failures.

## Automated Backups and Self-Serve Disaster Recovery
Environments with databases benefit from automated backups that can be restored to any system backup from the past seven days (extendable to 28 days for managed environments). 

Note: Self-Serve DR is currently in public preview. For more information about this feature, visit the Business continuity and disaster recovery page.

Self-Serve Disaster Recovery (DR) enables organizations to:
- Define and test cross-region failover strategies directly from the Power Platform Admin Center.
- Maintain a secondary environment copy in another region for business continuity.
- Activate emergency response modes for quick recovery during major outages.

:::image type="content" source="media/disaster-recovery.png" alt-text="Image showing the benefits of disaster recoery." lightbox="media/disaster-recovery.png":::

Self-Serve DR also supports disaster recovery drills and failback capabilities that empower administrators to decide whether and when to switch back to the primary location after an outage.

## Related content
- Business continuity and disaster recovery overview
- Managed Environments overview




