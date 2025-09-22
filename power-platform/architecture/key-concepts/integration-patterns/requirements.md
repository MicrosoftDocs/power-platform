---
title: Integration requirements
description: Explore integration requirements for Power Automate to meet enterprise goals. Understand volume, directionality, and system capabilities for robust solutions.
#customer intent: As an integration architect, I want to understand the requirements of an integration so that I can design scalable and efficient solutions.
author: manuelap-msft
ms.author: manuelap-msft
ms.reviewer: jhaskett-msft
ms.date: 09/22/2025
ms.topic: concept-article
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:09/22/2025
---

# Integration requirements

Successful integration design begins with understanding three foundational dimensions: volume and frequency, directionality, and capability. These dimensions help evaluate business requirements, system constraints, and scalability needs.

For example, imagine that you have a high level goal such as to connect SAP to Dataverse or to send a notification every time there's an update to a case a user works on. What is the starting point to design the integration? 

The first step is to deconstruct the requirements into the three key components of an integration:

- [Volume and frequency](#volume-and-frequency) is the first major component in our decision-making process. It helps determine the kinds of tools we need to use to implement the business requirements.

- [Directionality](#directionality), the next component, addresses where data flows from and to. Understanding directionality helps us set up the pattern for a successful integration.

- [Capability](#capability), or the ability of each system involved to receive, process and send data, is the final step. Using the "weakest link" approach, evaluation of capabilities will inform us of limitations and possibilities.

## Volume and frequency

This dimension defines how much data is transferred and how often. It influences the choice of triggers (scheduled vs. event-driven), resource allocation, and performance tuning. For example, sending 60,000 records per hour versus 1,000 records per minute may seem equivalent in volume, but the frequency impacts system load and responsiveness differently. You must also consider seasonality (for example, tax season spikes) and future growth trajectories to ensure long-term scalability.

:::image type="content" source="media/IntegrationPattern_VolumeFrequency_v1.png" alt-text="Diagram showing how volume and frequency varies with values.":::
<!-- Let's talk about these images and where they come from. Did you create these diagrams? -->

### Triggers


### Seasonality


### Stakeholders


### Plan for the future


## Directionality

Directionality refers to the source and destination of data flow. It determines how systems interact and whether data flows are inbound, outbound, or bidirectional. Carefully assess system availability, compliance requirements, and security constraints. For example, legacy systems might prohibit inbound connections, requiring reverse integration patterns.

:::image type="content" source="media/IntegrationPattern_Directionality_Mapping_v1.png" alt-text="Diagram showing how directionality of data mapping matters.":::

### Stakeholders

...

## Capability

Capability evaluates each system's ability to send, receive, and process data. It identifies bottlenecks and informs caching strategies, transformation logic, and error handling. For instance, if Dataverse can't handle high-frequency updates, architects might introduce Azure Data Lake or Synapse Link as a buffer.

:::image type="content" source="media/IntegrationPattern_Capability_Analysis_v1.png" alt-text="Diagram showing capability analysis.":::

### Capability and frequency


### Caching


### Transformation and business logic


### Stakeholders


## Put it all together


### Example scenario


## Next step

> [!div class="nextstepaction"]
> [Determine the best integration pattern](integration-patterns.md)

