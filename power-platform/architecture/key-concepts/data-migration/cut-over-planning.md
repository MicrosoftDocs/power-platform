---
title: Data migration planning for go-live
description: Cutover planning for go-live ensures a smooth transition after data migration. Discover how to estimate migration time, manage delta loads, and notify teams.
#customer intent: As a project manager, I want to plan the go-live after data migration so that the transition is smooth and business impact is minimized.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 06/26/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:05/21/2025
  - ai-gen-description
---

# Data migration planning for go-live

Cutover planning is often a challenge after complex data migrations. A well-structured approach helps prevent business disruption. Key considerations include timing, communication, validation, rollback strategy, and post-go-live monitoring.

## Assess the duration for migration

Developers often build migration jobs for development or test environments without accounting for production data volumes. Always measure CRUD  (create, read, update, or delete) throughput (records/sec) and estimate expected production load. Include a 20–30% buffer for monitoring overhead to better predict full migration duration.

## Plan for full or delta load

Full data migrations can be time-consuming. Even at 100–200 records per second, migrating 120 million records may take up to two weeks of continuous runtime. At 50 records per second, it could take four weeks—often impractical for business operations.

To mitigate this, perform a full migration about a month before go-live, followed by weekly delta loads. This approach:

- Helps estimate the time needed for weekly delta migrations.
- Allows business users to validate data and compare source vs. target systems.
- Supports a smoother, more predictable cutover.

If migration exceeds 2–3 days, plan for both full and incremental loads to maintain business continuity.

## Provide clear communication

Perform the final delta migration after freezing both source and target systems to prevent real-time changes. This approach ensures a consistent data snapshot and enables a clean switch to the target system. Communicate the cutover plan clearly and notify teams in advance. To minimize disruption, schedule downtime during off-hours or weekends.