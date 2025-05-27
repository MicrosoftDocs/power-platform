---
title: Storage management in Dataverse and finance and operations
description: Learn about storage management in Dataverse and finance and operations
author: ritesp
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/27/2025
ms.subservice: admin
ms.author: ritesp
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Storage management in Dataverse and finance and operations

As organizations accelerate their digital transformation journeys, the ability to manage data effectively becomes a strategic business imperative. With the rise of AI-powered applications and Copilot-driven workflows, enterprises are generating and consuming data at unprecedented rates. This data fuels innovation, enables personalized experiences, and supports critical decision-making—but only if it is governed and stored intelligently.

To support these evolving business needs, organizations must adopt a proactive storage management strategy. This ensures that data no longer required for day-to-day operations is handled responsibly freeing up capacity for high-value workloads, reducing operational friction, and aligning with compliance and audit requirements.

From a technical standpoint, effective storage management in Dataverse and Dynamics 365 enhances system performance, improves cost efficiency, and ensures adherence to long-term retention (LTR) policies. Both platforms offer tools and automation capabilities that empower organizations to manage storage.

By implementing the strategies outlined in this paper, enterprises can reduce support overhead, streamline compliance, and unlock greater value from their business applications—turning storage from a constraint into a competitive advantage.

## Key benefits
Effective storage management in Dataverse and Dynamics 365 provides several key benefits that address common customer pain points and enhance overall operational efficiency.

- **Increased compliance with LTR**: [RG1.1]Effective storage management ensures that data is stored in compliance with LTR policies. This not only helps in meeting regulatory requirements but also ensures that critical data is preserved and accessible when needed.
- **Improved performance**: By optimizing storage management, organizations can significantly enhance the performance of their systems. Efficient storage allocation and management reduce latency and improve the speed of data retrieval, leading to smoother and faster operations.
- **Driving cost efficiency**: Effective storage management empowers organizations to focus on high-value data by streamlining and decluttering their storage landscape. By retaining only what’s necessary, businesses can optimize their storage footprint—leading to smarter resource utilization and cost-effective scalability.

## Background
As organizations grow and digitize more of their operations, the volume of business data stored in systems like Dataverse and Dynamics 365 increases steadily. This includes not only active transactional data but also historical records that must be retained for audit, regulatory, or business continuity purposes. Over time, this accumulation can lead to performance degradation, increased operational overhead, and rising storage costs—especially when data that is no longer actively used remains in high-performance storage tiers.

A well-defined storage management strategy helps organizations address these challenges by identifying data that can be archived, cleaned up, or moved to lower-cost, read-optimized storage. This is particularly important for compliance scenarios where data must remain immutable, low-access, and read-only—such as financial records, audit logs, or regulatory filings. Ensuring that such data is retained in a compliant manner, without impacting the performance of live systems, is a key requirement for many enterprises.

By leveraging the tools and strategies available in both platforms, organizations can gain better visibility into their storage footprint, reduce unnecessary consumption, and ensure that compliance-critical data is handled appropriately.

This document outlines practical approaches to storage management that help customers align their data retention practices with business and regulatory needs—improving system performance, reducing operational overhead, and ensuring that compliance obligations are met without compromise.

## Why we store data
To select and optimise the right data retention pattern for your data, it is valuable to reflect on the reasons and uses for which we stored data.

### Operational data
With a business application, operational data is what is used to execute the business tracking sales, or financial or supply chain actions. 

This data needs to be accessed in real time supporting customer and internal operational processes of the business recording granular actions such as interactions with customers, orders or inventory activities. 

Over time operational data may move from being actively used to infrequently used but would need to be accessible in near real time assisting a customer in an order or support case e.g. 
- from a customer placing an order to one who has not interacted with the business for some time
- Each order that has been placed and is being shipped being accessed constantly to < 1% of orders one that under a warranty period of 3 years may need to be referenced for support and possibly requiring a refund

This may lead to phases of operational data access needs such as:

- < 1 year of actively accessed data
- < 3 years of infrequently accessed data
- > 3 years where data is no longer operationally accessed

The real time nature of operational storage does make that relatively expensive compared to other storage, so recognising where data needs to be accessed operationally and where it does not is important for defining retention strategies.

### Operational Integration

As a specialised category of operational use, data may be required to be replicated between multiple operational systems, including patterns such as:

- Banking: CRM for front line customer interactions and replication to multiple banking systems (current accounts, credit cards, mortgage, credit check systems)
- Manufacturing: CRM for front line order taking and ERP for supply chain management
- Police emergency handling: CRM for citizen interactions and Dispatch systems for police offer deployment management

In these cases, while each system may have unique data it tracks, there is often common master data needing to be shared between them and kept in sync leading to integration needs

### Audit data
A business typically has regulatory responsibility to keep data for extended periods (e.g. for 7 years on average) for audit purposes, whether internal or external, such as supporting financial auditing, regulatory disclosure or fraud review.

This data would typically span both data needed for operational purposes and data that is no longer needed as it allows review across the data set from one place.

### Analytics data
Organizations also have a need to review and analyse the state of their business, measuring and comparing over time as well as spanning multiple or all parts of the business. 

The large periods and breadth of data over which this analysis can occur leads to the need to replicate operational data into specialist analytics tools. This avoids complex analytics from affecting the performance of operational systems but also allows analysis across data sets that go beyond the period for which data is needed operationally e.g. over 7 years rather than over 1-2 years. Differing analytics needs however may need the full data retention periods or only span the data retained in operational systems 

It also typically allows for aggregation of data across multiple parts of the business, so combines data fed from multiple systems.

### Flow of data

The data of these types typically flow over time as follows:

:::image type="content" source="media/flow-of-data.png" alt-text="The flow of data." lightbox="media/flow-of-data.png":::


