---
title: Data migration planning for go-live
description: Plan a smooth go-live after data migration with tips on timing, delta loads, and team communication. Minimize business impact with effective cutover strategies.
#customer intent: As a project manager, I want to plan the go-live after data migration so that the transition is smooth and business impact is minimized.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/19/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:05/21/2025
  - ai-gen-description
---

# Data migration planning for go-live

Cutover planning is often a challenge after complex data migrations. A well-structured approach helps prevent business disruption. Key considerations include timing, communication, validation, rollback strategy, and post-go-live monitoring.

## Assess the duration for migration

Developers often build migration jobs for development or test environments without accounting for production data volumes. Always measure CRUD (create, read, update, or delete) throughput (records per second) and estimate expected production load. Include a 20-30% buffer for monitoring overhead to better predict full migration duration.

Also consider that the production environment might be faster than test or development environments. Environments with a large number of licensed users support more concurrent threads. Learn more about [sending requests in parallel](/power-apps/developer/data-platform/send-parallel-requests?tabs=sdk) and review the guidance for [optimizing performance for bulk operations](/power-apps/developer/data-platform/optimize-performance-create-update).

## Plan for full or delta load

Full data migrations can be time-consuming. Even at 100-200 records per second, migrating 120 million records might take up to two weeks of continuous runtime. At 50 records per second, it could take four weeks, which is often impractical for business operations.

To mitigate this issue, perform a full migration about a month before go-live, followed by weekly delta loads. This approach:

- Helps estimate the time needed for weekly delta migrations.
- Allows business users to validate data and compare source and target systems.
- Supports a smoother, more predictable cutover.

If migration exceeds two to three days, plan for both full and incremental loads to maintain business continuity.

## Provide clear communication

Perform the final delta migration after freezing both source and target systems to prevent real-time changes. This approach ensures a consistent data snapshot and enables a clean switch to the target system. Communicate the cutover plan clearly and notify teams in advance. To minimize disruption, schedule downtime during off-hours or weekends.