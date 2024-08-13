---
title: Overview of Power Platform workloads using generative AI features
description: Learn how architecture patterns, design areas, and architecture layers relate to well-architected Power Platform workloads that use generative AI features
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 09/15/2024
ms.subservice: well-architected
ms.topic: conceptual
---

# Overview of Power Platform workloads that use generative AI features

This section of the Microsoft Power Platform Well-Architected Framework aims to address the challenges of building Generative AI workloads on Power Platform. This article describes the Generative AI design areas and architecture patterns.

Generative AI is an artificial intelligence technology that uses large language models (LLMs) to generate original content and provide natural language understanding and responses. For details, see Technology guidance > [Generative AI](/ai/playbook/technology-guidance/generative-ai/).

[Five pillars of architectural excellence](../pillars.md) underpin the workload design methodology. These pillars serve as a compass for subsequent design decisions across the design areas described in this article. The remaining articles in this series delve into how to evaluate the design areas using Generative AI-specific design principles in the reliability, security, operational excellence, performance efficiency, and experience optimization pillars.

>[!TIP]
>To assess your workload through the lenses of reliability, security, operational excellence, performance efficiency, and experience optimization see the [Power Platform Well-Architected Assessment](https://aka.ms/powa/assessment).

## What is a Gen AI workload?

The term workload refers to the collection of application resources that support a common business goal or the execution of a common business process. These goals or processes use multiple services, such as APIs and data stores. The services work together to deliver specific end-to-end functionality.

Internet of Things (IoT) is a collection of managed and platform services across edge and cloud environments that connect, monitor, and control physical assets.

An IoT workload therefore describes the practice of designing, building, and operating IoT solutions to help meet architectural challenges according to your requirements and constraints.

The IoT workload addresses the three components of IoT systems:

Things, or the physical objects, industrial equipment, devices, and sensors that connect to the cloud persistently or intermittently.
Insights, information that the things collect that humans or AI analyze and turn into actionable knowledge.
Actions, the responses of people or systems to insights, which connect to business outcomes, systems, and tools.