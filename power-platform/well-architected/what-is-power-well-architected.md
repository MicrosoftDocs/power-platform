---
title: How to use the Power Platform Well-Architected documentation
description: Learn about Power Platform Well-Architected, the pillars of architectural excellence, and how the documentation is organized.
author: robstand
ms.author: rstand
ms.reviewer: jhaskett-msft
ms.subservice: well-architected
ms.topic: overview
ms.date: 08/05/2025
---

# What is Power Platform Well-Architected?

Power Platform Well-Architected is a framework that can improve the quality of a Power Platform workload by helping it to:

- Be reliable.
- Be secure.
- Support responsible development and operations.
- Meet expectations of performance.
- Be easy to use.

Power Platform Well-Architected is built on five pillars of architectural excellence, which are mapped to the goals. The pillars are: [**Reliability**](./reliability/index.yml), [**Security**](./security/index.yml), [**Operational Excellence**](./operational-excellence/index.yml), [**Performance Efficiency**](./performance-efficiency/index.yml), and [**Experience Optimization**](./experience-optimization/index.yml). 

Each pillar offers best practices, risk factors, and tradeoffs. The design choices must consider all pillars, based on the business needs. The technical and practical guidance is general enough for all workloads and relevant to a specific situation. This guidance focuses on Power Platform.  

Workload architecture differs from its execution. Power Platform Well-Architected can help you achieve optimal architectural design, but the execution options depend on the business goals and limitations of your organization.

> [!NOTE]
> Power Platform Well-Architected is based on the methodology and guidance of the [Microsoft Azure Well-Architected Framework](/azure/well-architected). It is designed to be used in alignment with Azure Well-Architected for those organizations that use both Power Platform and Azure.

## Audience

Power Platform Well-Architected is for teams that want to improve workloads and deal with cross-cutting issues. Power Platform Well-Architected offers useful insights and suggestions for anyone who participates in the lifecycle of a modern application workload built with Microsoft Power Platform. No matter what your role is in a workload team, whether it's architect, developer, maker, or business stakeholder, if you have the authority to make decisions within the scope of a workload, you can use the guidance.  

This guidance is helpful regardless of the size of your organization. The Power Platform Well-Architected guidance covers a wide range of organizational structures and sizes, making sure that all workload users can effectively access its benefits.

## Goals

The main goal of Power Platform Well-Architected is to help you achieve success with your modern application workloads built with Microsoft Power Platform.

- **Successful design**: A well-architected design leads to successful execution. With the comprehensive and thorough coverage of concepts, you can make smart decisions.  
- **Confidence in outcomes**: The guidance is based on real customer experiences and subject matter expertise of Microsoft solution architects, supporting the principles of the framework.  
- **Recognize tradeoffs and risks**: The guidance helps you realize that following the recommendations might involve making compromises against the other pillars. It shows the tradeoffs and also the possible risks that you might want to address in the short term.  
- **Improve over time**: The guidance is intended for iterative use and as a tool for continuous improvement. Assess the maturity of your workload against the guidance. Treat that assessment as a changing score that evolves with your workload, ensuring that the design stays efficient and effective in meeting your business goals.

## Pillars

Pillars are the foundation of Power Platform Well-Architected. They are the high-level areas of focus that are critical to the success of a workload. Four of the five pillars in Power Platform Well-Architected (Reliability, Security, Operational Excellence, Performance Efficiency) are based on the [Azure Well-Architected Framework](/azure/well-architected/pillars). The fifth pillar, Experience Optimization, is unique to Power Platform Well-Architected.

1. Start your journey with the **Design principles**. Each principle has a specific goal. For each principle, follow the approaches to craft your design strategy. 

2. Next, move on to the **Checklist**, which is your starting point for evaluation. Each item on the checklist includes one or more Recommendation guides.

3. Visit each **Recommendation guide**, which describes key strategies to help you attain the goals of the recommendation.

Each architectural decision entails a series of considerations. These **tradeoffs** represent recognized and accepted compromises that balance the various aspects of the framework.

Tradeoffs are noted with this icon: :::image type="icon" source="./_images/trade-off.svg":::

Risks are noted with this icon: :::image type="icon" source="./_images/risk.svg":::

For more information, see [Power Platform Well-Architected pillars](./pillars.md).
