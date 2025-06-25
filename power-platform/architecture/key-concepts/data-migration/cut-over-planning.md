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
ms.date: 05/23/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:05/21/2025
  - ai-gen-description
---

# Data migration planning for go-live

Cutover planning is often a challenge after complex data migrations. A well-structured approach helps prevent business disruption. Key considerations include timing, communication, validation, rollback strategy, and post-go-live monitoring.

## Assess the duration for migration

Developers often build migration jobs for dev or UAT environments without accounting for production data volumes. Always measure CRUD throughput (records/sec) and estimate expected production load. Include a 20–30% buffer for monitoring overhead to better predict full migration duration.

Developers often build data migration jobs for development or UAT (user acceptance testing) environments without knowing the actual data volume. Always assess the speed of CRUD (create, read, update, or delete) operations in records per second, and estimate how many operations are likely in production. Add a 20 to 30 percent buffer for monitoring jobs. This approach gives you a good idea of how long a full data migration takes.

## Plan for full or delta load

If full data migration will take a long time, plan carefully. Even at a good migration speed of 100–200 records per second, migrating 120 million records takes about two weeks if the job runs all day. This process affects the business during that time, so it's usually not practical. At 50 records per second, migrating a similar volume takes about four weeks, which is a long time.

To avoid this situation, run a full data migration about a month before go-live. Then, migrate the delta data each week. This approach lets you estimate the time needed to load a week's delta data and plan go-live accurately. Business users also have time to test the migrated data and compare source system records to target system records.

If data migration takes more than two or three days, plan for both full and delta data loads. This approach helps ensure business continuity.

## Provide clear communication

Do the final delta data migration after you freeze the source and target systems for any real-time transactions. This approach gives you a clear snapshot of data and lets you switch from the source system to the target system. Plan communication to the team and notify them in advance. To minimize disruption, schedule downtime during non-business hours or on weekends.
