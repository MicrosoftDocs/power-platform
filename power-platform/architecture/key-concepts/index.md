---
title: Power Platform and Copilot Studio architecture key concepts overview
description: Learn foundational principles to design scalable and efficient solutions with Microsoft Power Platform and Copilot Studio.
#customer intent: As a Power Platform user, I want to understand architecture key concepts of Microsoft Power Platform so that I can design scalable and efficient solutions.  
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: overview
ms.date: 11/26/2026
ms.author: mapichle
ms.reviewer: jhaskett-msft
ai-usage: ai-assisted
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/02/2025
---

# Power Platform and Copilot Studio architecture key concepts overview

Architecture key concepts are the foundational principles and recommendations that guide the design, planning, and implementation of robust, scalable, and efficient solutions using Microsoft Power Platform. These fundamentals encompass key aspects such as reliability, security, operational excellence, performance efficiency, and user experience optimization.

The following table describes the key concepts of Power Platform and Copilot Studio architecture and provides links to related articles that offer in-depth information and best practices for each concept.

| Title | Description |
| --- | --- |
| **[Choose an architecture to connect Copilot Studio agents to Microsoft Fabric data](copilot-studio-fabric/index.md)** | Compare four patterns for connecting agents to Microsoft Fabric and Power BI semantic models, and choose an architecture based on accuracy, response time, maintainability, and security. |
| **[Prepare a semantic model for AI agents](copilot-studio-fabric/semantic-model-ai-agents.md)** | Prepare a semantic model with a star schema, governed measures, and documented names so agents return accurate, consistent answers. |
| **[Copilot Studio analytics agent over a Microsoft Fabric semantic model](copilot-studio-fabric/copilot-studio-fabric-analytics-agent.md)** | Explore an analytics agent architecture that runs live, read-only DAX queries over a governed semantic model and returns formatted answers for human review. |
| **[Evaluate analytical agents with an output contract and golden prompts](copilot-studio-fabric/evaluate-analytical-agents.md)** | Define an output contract, build golden prompts with exact expected answers, and set accuracy gates to evaluate analytical agents after each change. |
| **[ExpressRoute and Power Platform](expressroute/overview.md)** | Learn how to use Microsoft Azure ExpressRoute to connect your on-premises network to Microsoft cloud services by using private connectivity. |
| **[Dataverse auditing](dataverse-auditing.md)** | Learn how to track and record changes to data, user activities, and system events with Dataverse auditing. |
| **[CRM data migration to Dataverse: Key insights and best practices](data-migration/index.md)** | Learn how to move data from external customer relationship management (CRM) systems to Microsoft Dataverse, overcome common challenges, and ensure business continuity. |
| **[Distributed tracing across multiple services](distributed-tracing.md)** | Learn how to achieve comprehensive observability across services like Power Platform, Azure, and Dynamics 365. |
| **[Cloud flow integration patterns](integration-patterns/index.md)** | Learn how to design scalable and cost-effective integrations with Power Automate. Identify requirements and explore design patterns. |
| **[Manage Power Platform solution performance](performance/index.md)** | Learn about key concepts and considerations for managing the performance of Power Platform solutions. |