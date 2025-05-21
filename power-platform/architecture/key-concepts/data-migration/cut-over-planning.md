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

Most of the organizations face difficulty to assess on the correct cut over planning for going live after complex data migration. We need to plan the cut over planning carefully to avoid any real business impacts. Here are some important considerations for cut over planning.

## Assess the duration for migration

Most of the times developers keep building data migration jobs for dev / UAT environment and don't have any idea on the real volume / size of actual data. You should always assess the speed of CRUD operations in terms of records/second, and estimate number of such operations which are likely to happen in production and on top of that we can add 20-30% buffer time for monitoring those jobs, this gives us a good idea on how much approximate time it’s going to take for full data migration.

## Plan for full or delta load

If full data migration is taking more time, you need to plan it carefully. Even if you achieve a good migration speed of 100–200 records per second, there are about 1.2 million seconds in two weeks. In that scenario, a 24x7 successfully running job will migrate about 120 million records in two weeks, which still impacts the business for that entire period. In most cases, this isn't practical. With a speed of 50 records per second, a similar volume of data would take approximately four weeks, which is a long time.

You can resolve this problem by making a strategy so that you do full load data migration approximately a month ago then the actual go live, and then every week by week we can start migrating the delta data for that week, this way we know the approximate time for loading a week’s delta data and can plan go live accurately. Also, business users also get a time to test on migrated data and can compare Apple to Apple, meaning source system data records to target system data records.

Any Data Migration which is taking more than 2-3 days to complete, you must plan for full and delta data loads. This helps planning for business continuity.

## Provide clear communication

Final delta data migration must be done after freezing the source and target systems for any real time transactions, so that we get a clear snapshot of Data, and can switch from source systems to target system. You need to plan for this communication and send it to the team well in advance. To minimize this downtime, we should plan this downtime in non-business hours or weekends.
