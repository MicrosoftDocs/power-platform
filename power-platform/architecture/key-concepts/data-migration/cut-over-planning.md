---
title: Data migration planning for go-live
description: Cut over planning for go-live ensures a smooth transition after data migration. Discover how to estimate migration time, manage delta loads, and notify teams.
#customer intent: As a project manager, I want to plan the cut over for go-live after data migration so that the transition is smooth and business impact is minimized.
author: manuelap-msft
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: guidance
ms.author: mapichle
ms.reviewer: pankajsharma2087
ms.date: 05/21/2025
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:05/21/2025
  - ai-gen-description
---

# Data migration planning for go-live

Many organizations find it hard to plan the right cut over for going live after complex data migration. Careful cut over planning helps avoid real business impact. Here are some important things to consider for cut over planning.

## Assess the duration for migration

Developers often build data migration jobs for development or UAT (user acceptance testing) environments without knowing the actual data volume. Always assess the speed of CRUD (create,read,update,or delete) operations in records per second, and estimate how many operations are likely in production. Add a 20 to 30 percent buffer for monitoring jobs. This approach gives you a good idea of how much time a full data migration takes.

## Plan for full or delta load

If full data migration takes too long, plan it carefully. Even with a good migration speed of 100–200 records per second, there are about 1.2 million seconds in two weeks. In this case, a job running 24x7 migrates about 120 million records in two weeks, which still affect the business during that time. In most cases, this isn't practical. At 50 records per second, migrating a similar volume takes about four weeks, which is a long time.

Fix this problem by running a full data migration about a month before go live. Then, migrate the delta data each week. This approach lets you estimate the time needed to load a week's delta data and plan go live accurately. Business users also get time to test the migrated data and compare source system records to target system records.

If data migration takes more than two or three days, plan for both full and delta data loads. This helps ensure business continuity.

## Provide clear communication

Do the final delta data migration after you freeze the source and target systems for any real-time transactions. This approach gives you a clear snapshot of data and lets you switch from the source system to the target system. Plan this communication and notify the team in advance. To minimize downtime, schedule it during nonbusiness hours or on weekends.
